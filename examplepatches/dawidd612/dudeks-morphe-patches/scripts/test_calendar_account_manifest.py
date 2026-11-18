#!/usr/bin/env python3
"""Run production launcher routing against both Android XML DOM parser modes."""
import os, shutil, subprocess, tempfile
from pathlib import Path
import xml.etree.ElementTree as ET
ROOT=Path(__file__).resolve().parents[1]
A='{http://schemas.android.com/apk/res/android}'
NATIVE='com.android.calendar.event.LaunchInfoActivity'
GATE='pl.dudek.extension.calendar.CalendarAccountAccessActivity'
FIXTURE=f'''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.google.android.calendar"><uses-permission android:name="android.permission.READ_CALENDAR"/><application android:label="@string/app_label"><activity android:name="{NATIVE}" android:taskAffinity="launch-affinity"><intent-filter><action android:name="android.intent.action.VIEW"/></intent-filter></activity><activity-alias android:name="com.android.calendar.AllInOneActivity" android:exported="true" android:launchMode="singleTask" android:targetActivity="{NATIVE}"><intent-filter><action android:name="android.intent.action.MAIN"/><category android:name="android.intent.category.LAUNCHER"/></intent-filter></activity-alias><activity-alias android:name="another.entry" android:targetActivity="{NATIVE}"/><provider android:name="Provider" android:authorities="existing.authority"/></application></manifest>'''
def shape(node):return (node.tag,sorted(node.attrib.items()),(node.text or '').strip(),[shape(c) for c in node])
with tempfile.TemporaryDirectory(prefix='calendar-account-manifest-') as temporary:
    d=Path(temporary)
    (d/'PatchException.kt').write_text('package app.morphe.patcher.patch\nclass PatchException(message: String): RuntimeException(message)')
    (d/'Apply.kt').write_text('''package app.template.patches.calendar.widget
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
fun main(args:Array<String>){val f=File(args[0]);val doc=DocumentBuilderFactory.newInstance().apply{isNamespaceAware=args[1].toBoolean()}.newDocumentBuilder().parse(f);AccountAccessManifest.install(doc.documentElement);TransformerFactory.newInstance().newTransformer().transform(DOMSource(doc),StreamResult(f))}''')
    compiler=os.environ.get('KOTLINC') or shutil.which('kotlinc')
    if not compiler:raise SystemExit('KOTLINC required')
    jar=d/'test.jar'
    subprocess.run([compiler,str(ROOT/'patches/src/main/kotlin/app/template/patches/calendar/widget/AccountAccessManifest.kt'),str(d/'PatchException.kt'),str(d/'Apply.kt'),'-include-runtime','-d',str(jar)],check=True)
    def run(path,aware):return subprocess.run(['java','-jar',str(jar),str(path),aware],capture_output=True,text=True)
    for aware in ['true','false']:
        p=d/(aware+'.xml');p.write_text(FIXTURE)
        result=run(p,aware);assert result.returncode==0,result.stderr
        root=ET.parse(p).getroot();app=root.find('application')
        gates=[c for c in app if c.get(A+'name')==GATE];assert len(gates)==1
        gate=gates[0];alias=next(c for c in app if c.get(A+'name')=='com.android.calendar.AllInOneActivity')
        assert gate.tag=='activity' and gate.get(A+'exported')=='false' and gate.get(A+'taskAffinity')=='launch-affinity'
        assert list(app).index(gate)<list(app).index(alias) and alias.get(A+'targetActivity')==GATE
        # Remove the two intended changes and compare the whole manifest.
        app.remove(gate);alias.set(A+'targetActivity',NATIVE)
        assert shape(root)==shape(ET.fromstring(FIXTURE))
        before=p.read_bytes();assert run(p,aware).returncode!=0;assert p.read_bytes()==before
        for key,text in [('target',FIXTURE.replace(f'android:targetActivity="{NATIVE}"','android:targetActivity="unsupported"')),('missing-launcher',FIXTURE.replace('android.intent.category.LAUNCHER','unsupported'))]:
            p=d/(aware+key+'.xml');p.write_text(text);before=p.read_bytes();assert run(p,aware).returncode!=0;assert p.read_bytes()==before
print('PASS: account Activity declaration, existing launcher routing and filters, namespace parser modes, preserved manifest, clean-input guards')
