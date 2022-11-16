import 'package:flutter/material.dart';

class FormEx extends StatefulWidget {
  FormEx({Key? key}) : super(key: key);

  @override
  _FormExState createState() => _FormExState();
}

class _FormExState extends State<FormEx> {
  List<String> agama = [
    "Islam",
    "Kristen",
    "Buddha",
    "Hindu",
    "Kristen katholik"
  ];

  String _agama = "Islam";
  String _jk = "";

  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  TextEditingController controllerMoto = new TextEditingController();

  void _pilihJK(String value) {
    setState(() {
      _jk = value;
    });
  }

  void pilihAgama(String value) {
    setState(() {
      _agama = value;
    });
  }

  void kirimData() {
    AlertDialog alertDialog = new AlertDialog(
      content: Container(
        height: 200.0,
        child: Column(
          children: [
            Text("Nama Lengkap : ${controllerNama.text}"),
            Text("Password : ${controllerPass.text}"),
            Text("Moto Hidup : ${controllerMoto.text}"),
            Text("Jenis kelamin : ${_jk}"),
            Text("Agama : ${_agama}"),
            ElevatedButton(
              child: Text("OK"),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
              ),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.list),
          title: Text('Data Diri'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    controller: controllerNama,
                    decoration: InputDecoration(
                        labelText: "Nama lengkap",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  TextField(
                    controller: controllerPass,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  TextField(
                    controller: controllerMoto,
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintText: "Moto Hidup",
                        labelText: "Moto Hidup",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  RadioListTile(
                    value: "laki-laki",
                    title: Text("Laki-laki"),
                    groupValue: _jk,
                    onChanged: (String? value) {
                      _pilihJK(value!);
                    },
                    activeColor: Colors.blue,
                    subtitle: Text("Pilih ini jika anda Laki-laki"),
                  ),
                  RadioListTile(
                      value: "perempuan",
                      title: Text("Perempuan"),
                      groupValue: _jk,
                      onChanged: (String? value) {
                        _pilihJK(value!);
                      },
                      activeColor: Colors.blue,
                      subtitle: Text("Pilih ini jika anda Perempuan")),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Row(
                    children: [
                      Text(
                        "Agama",
                        style: TextStyle(fontSize: 18.0, color: Colors.blue),
                      ),
                      Padding(padding: EdgeInsets.only(left: 15.0)),
                      DropdownButton(
                        onChanged: (String? value) {
                          pilihAgama(value!);
                        },
                        value: _agama,
                        items: agama.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                  ElevatedButton(
                    child: Text("OK"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () {
                      kirimData();
                    },
                  ),
                  
                ],
              ),
            )
          ],
        ));
  }
}