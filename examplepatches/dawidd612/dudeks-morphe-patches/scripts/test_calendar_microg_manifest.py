#!/usr/bin/env python3
"""Exercise production MicroG metadata transformation in both DOM modes."""
import os, shutil, subprocess, tempfile
from pathlib import Path
import xml.etree.ElementTree as ET
ROOT=Path(__file__).resolve().parents[1]
A='{http://schemas.android.com/apk/res/android}'
M='app.revanced.android.gms'
FIXTURE='''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.google.android.calendar" android:versionCode="2018314914"><uses-permission android:name="android.permission.READ_CALENDAR"/><queries><package android:name="com.google.android.gms"/></queries><application><meta-data android:name="existing" android:value="unchanged"/><provider android:name="Provider" android:authorities="existing.authority"/></application></manifest>'''
def shape(node):return (node.tag,sorted(node.attrib.items()),(node.text or '').strip(),[shape(c) for c in node])
with tempfile.TemporaryDirectory(prefix='calendar-microg-manifest-') as temporary:
    d=Path(temporary)
    (d/'PatchException.kt').write_text('package app.morphe.patcher.patch\nclass PatchException(message: String): RuntimeException(message)')
    (d/'Apply.kt').write_text('''package app.template.patches.calendar.widget
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
fun main(args:Array<String>){val f=File(args[0]);val doc=DocumentBuilderFactory.newInstance().apply{isNamespaceAware=args[1].toBoolean()}.newDocumentBuilder().parse(f);CalendarMicroGManifest.install(doc.documentElement);TransformerFactory.newInstance().newTransformer().transform(DOMSource(doc),StreamResult(f))}''')
    compiler=os.environ.get('KOTLINC') or shutil.which('kotlinc')
    if not compiler:raise SystemExit('KOTLINC required')
    jar=d/'test.jar'
    subprocess.run([compiler,str(ROOT/'patches/src/main/kotlin/app/template/patches/calendar/widget/CalendarMicroGManifest.kt'),str(d/'PatchException.kt'),str(d/'Apply.kt'),'-include-runtime','-d',str(jar)],check=True)
    def run(path,aware):return subprocess.run(['java','-jar',str(jar),str(path),aware],capture_output=True,text=True)
    for aware in ['true','false']:
        for query in [True,False]:
            text=FIXTURE if query else FIXTURE.replace('<queries><package android:name="com.google.android.gms"/></queries>','')
            p=d/(aware+str(query)+'.xml');p.write_text(text)
            result=run(p,aware);assert result.returncode==0,result.stderr
            root=ET.parse(p).getroot();app=root.find('application');queries=root.find('queries')
            metadata={n.get(A+'name'):n.get(A+'value') for n in app.findall('meta-data')}
            assert metadata[M+'.SPOOFED_PACKAGE_NAME']=='com.google.android.calendar'
            assert metadata[M+'.SPOOFED_PACKAGE_SIGNATURE']=='38918a453d07199354f8b19af05ec6562ced5788'
            assert metadata['app.revanced.MICROG_PACKAGE_NAME']==M
            packages=[n for n in queries if n.get(A+'name')==M];assert len(packages)==1
            gate=app.find('activity');assert gate.get(A+'name')=='pl.dudek.extension.calendar.CalendarMicroGAccessActivity' and gate.get(A+'exported')=='false';app.remove(gate)
            for n in list(app):
                if n.get(A+'name') in [M+'.SPOOFED_PACKAGE_NAME',M+'.SPOOFED_PACKAGE_SIGNATURE','app.revanced.MICROG_PACKAGE_NAME']:app.remove(n)
            queries.remove(packages[0])
            if not query:root.remove(queries)
            assert shape(root)==shape(ET.fromstring(text))
            before=p.read_bytes();assert run(p,aware).returncode!=0;assert p.read_bytes()==before
        for text in [FIXTURE.replace('2018314914','999'),FIXTURE.replace('package="com.google.android.calendar"','package="wrong"'),FIXTURE.replace('<queries>','<queries/><queries>')]:
            p=d/'bad.xml';p.write_text(text);before=p.read_bytes();assert run(p,aware).returncode!=0;assert p.read_bytes()==before
print('PASS: MicroG identity, original signer, queries, preserved permissions/providers/accounts, both DOM modes and clean-input/version guards')
