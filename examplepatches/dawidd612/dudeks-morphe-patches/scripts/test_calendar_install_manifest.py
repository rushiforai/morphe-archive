#!/usr/bin/env python3
"""Run the production manifest transform and verify the fresh-install UID contract."""
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
ANDROID = '{http://schemas.android.com/apk/res/android}'
MANIFEST = '''<manifest xmlns:android="http://schemas.android.com/apk/res/android"
xmlns:other="urn:test" package="com.google.android.calendar" android:versionCode="2018314914"
android:sharedUserId="com.google.android.calendar.uid.shared" android:sharedUserLabel="@string/app_label"
android:sharedUserMaxSdkVersion="32" other:sharedUserId="keep">
<uses-permission android:name="android.permission.READ_CALENDAR"/>
<uses-permission android:name="android.permission.WRITE_CALENDAR"/>
<permission android:name="com.google.android.calendar.permission.C2D_MESSAGE" android:protectionLevel="signature"/>
<application android:label="@string/app_label" android:allowBackup="true">
<provider android:name="androidx.core.content.FileProvider" android:authorities="com.google.android.calendar.fileprovider" android:exported="false"/>
<receiver android:name="com.google.android.calendar.widget.WidgetReceiver" android:exported="true"/>
</application></manifest>'''

def structure(node):
    return (node.tag, sorted(node.attrib.items()), (node.text or '').strip(),
            [structure(child) for child in node])

with tempfile.TemporaryDirectory(prefix='calendar-manifest-') as temporary:
    directory = Path(temporary)
    stub = directory / 'PatchException.kt'
    stub.write_text('package app.morphe.patcher.patch\nclass PatchException(message: String): RuntimeException(message)')
    harness = directory / 'ApplyManifest.kt'
    harness.write_text('''package app.template.patches.calendar.widget
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
fun main(args: Array<String>) {
    val file = File(args[0])
    val document = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = args[1].toBoolean() }
        .newDocumentBuilder().parse(file)
    ScheduleInstallManifest.prepare(document.documentElement)
    TransformerFactory.newInstance().newTransformer().transform(DOMSource(document), StreamResult(file))
}''')
    compiler = os.environ.get('KOTLINC') or shutil.which('kotlinc')
    if not compiler:
        raise SystemExit('A Kotlin compiler is required; set KOTLINC.')
    jar = directory / 'manifest.jar'
    production = ROOT / 'patches/src/main/kotlin/app/template/patches/calendar/widget/ScheduleInstallManifest.kt'
    subprocess.run([compiler, str(production), str(stub), str(harness), '-include-runtime', '-d', str(jar)], check=True)
    cases = [
        ('native', MANIFEST, True),
        ('no-max-sdk', MANIFEST.replace('android:sharedUserMaxSdkVersion="32"', ''), True),
        ('no-shared-uid', MANIFEST.replace('android:sharedUserId="com.google.android.calendar.uid.shared"', ''), True),
        ('wrong-uid', MANIFEST.replace('com.google.android.calendar.uid.shared', 'android.uid.system'), False),
        ('wrong-package', MANIFEST.replace('package="com.google.android.calendar"', 'package="another.app"'), False),
        ('alternate-prefix', MANIFEST.replace('android:', 'a:').replace('xmlns:android', 'xmlns:a'), True),
    ]
    for name, text, success in [(name + '-' + aware, text, success) for aware in ['true', 'false']
                                for name, text, success in cases]:
        aware = name.rsplit('-', 1)[1]
        path = directory / (name + '.xml')
        path.write_text(text)
        before = path.read_bytes()
        result = subprocess.run(['java', '-jar', str(jar), str(path), aware], capture_output=True, text=True)
        assert (result.returncode == 0) == success, result.stderr
        if not success:
            assert path.read_bytes() == before, 'rejected input changed'
            continue
        expected = ET.fromstring(text)
        for attribute in ['sharedUserId', 'sharedUserLabel', 'sharedUserMaxSdkVersion']:
            expected.attrib.pop(ANDROID + attribute, None)
        output = ET.parse(path).getroot()
        assert structure(output) == structure(expected), 'unrelated manifest content changed'
        subprocess.run(['java', '-jar', str(jar), str(path), aware], check=True)
        assert structure(ET.parse(path).getroot()) == structure(expected), 'repeat changed manifest'
print('PASS: fresh-install shared UID removal, namespace handling, unchanged package/permissions/providers, invalid input rejection')
