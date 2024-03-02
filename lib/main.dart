import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  double height = 100;
  double width = 100;
  Color color = Colors.green;
  BorderRadiusGeometry radiusGeometry = BorderRadius.circular(12);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Random Animation',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 15,
        ),
        body: Center(
          child: AnimatedContainer(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: color,
              borderRadius: radiusGeometry,
            ),
            duration: Duration(milliseconds: 1),
            curve: Curves.decelerate,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              final random = Random();
              height = random.nextInt(500)+10.toDouble();
              width = random.nextInt(500)+10.toDouble();
              color = Color.fromRGBO(random.nextInt(255) + 1,
                  random.nextInt(255) + 1, random.nextInt(255) + 1, 1);
              radiusGeometry =
                  BorderRadius.circular(random.nextInt(250).toDouble());
            });
          },
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}
