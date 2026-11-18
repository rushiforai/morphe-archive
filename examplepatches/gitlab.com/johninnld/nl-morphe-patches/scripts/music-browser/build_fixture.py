#!/usr/bin/env python3
"""Package unchanged app DEX/resources in an accountless Android instrumentation fixture.

No app Application, account provider, exported service or Internet permission is retained.
This verifies Android execution of the emitted hooks, not signed-in library delivery.
"""
import argparse
from pathlib import Path
import re
import subprocess
import zipfile


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('apk', type=Path)
    parser.add_argument('output', type=Path)
    parser.add_argument('--label', required=True)
    args = parser.parse_args()
    if not re.fullmatch('[a-z][a-z0-9_]*', args.label):
        parser.error('Use a lowercase fixture label')
    args.output.mkdir(parents=True, exist_ok=False)
    sdk = Path.home() / 'Library/Android/sdk'
    tools = sdk / 'build-tools/36.1.0'
    android = sdk / 'platforms/android-36/android.jar'
    target = 'nl.johninnl.musicfixture.' + args.label
    probe = 'nl.johninnl.musicprobe.' + args.label
    manifest = args.output / 'AndroidManifest.xml'
    manifest.write_text(f'''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="{target}">
<uses-sdk android:minSdkVersion="32" android:targetSdkVersion="36"/>
<queries><package android:name="app.seb3thehacker.gearslip"/></queries>
<application android:label="Music browser hook fixture"/></manifest>''')
    fixture = args.output / 'fixture-unaligned.apk'
    subprocess.run([str(tools / 'aapt2'), 'link', '-I', str(android), '--manifest', str(manifest), '-o', str(fixture)], check=True)
    with zipfile.ZipFile(fixture) as generated:
        binary_manifest = generated.read('AndroidManifest.xml')
    with zipfile.ZipFile(args.apk) as source, zipfile.ZipFile(fixture, 'w') as output:
        output.writestr('AndroidManifest.xml', binary_manifest)
        names = [n for n in source.namelist() if (re.fullmatch(r'classes\d*\.dex', n)
                 or n == 'resources.arsc' or n.startswith(('res/', 'assets/'))) and not n.endswith('/')]
        assert any(n.endswith('.dex') for n in names)
        for name in names:
            output.writestr(name, source.read(name), compress_type=zipfile.ZIP_STORED if name == 'resources.arsc' else zipfile.ZIP_DEFLATED)
    with zipfile.ZipFile(args.apk) as source, zipfile.ZipFile(fixture) as output:
        assert all(source.read(n) == output.read(n) for n in names), 'Fixture altered input code/resources'
    sign = [str(tools / 'apksigner'), 'sign', '--ks', str(Path.home() / '.android/debug.keystore'), '--ks-pass', 'pass:android']
    aligned = args.output / 'fixture.apk'
    subprocess.run([str(tools / 'zipalign'), '-p', '-f', '4', str(fixture), str(aligned)], check=True)
    subprocess.run([*sign, str(aligned)], check=True)
    classes, dexout = args.output / 'classes', args.output / 'dex'
    classes.mkdir()
    dexout.mkdir()
    source = Path(__file__).with_name('BrowseProbe.java')
    subprocess.run(['javac', '--release', '8', '-cp', str(android), '-d', str(classes), str(source)], check=True)
    subprocess.run([str(tools / 'd8'), '--min-api', '32', '--lib', str(android), '--output', str(dexout),
                    *map(str, classes.rglob('*.class'))], check=True)
    manifest.write_text(f'''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="{probe}">
<uses-sdk android:minSdkVersion="32" android:targetSdkVersion="36"/><application/>
<instrumentation android:name="nl.johninnl.musicprobe.BrowseProbe" android:targetPackage="{target}"/></manifest>''')
    instrumentation = args.output / 'probe.apk'
    subprocess.run([str(tools / 'aapt2'), 'link', '-I', str(android), '--manifest', str(manifest), '-o', str(instrumentation)], check=True)
    with zipfile.ZipFile(instrumentation, 'a') as output:
        output.write(dexout / 'classes.dex', 'classes.dex')
    subprocess.run([*sign, str(instrumentation)], check=True)
    print(f'Fixture: {aligned}\nProbe: {instrumentation}\nRunner: {probe}/nl.johninnl.musicprobe.BrowseProbe')


if __name__ == '__main__':
    main()
