#!/usr/bin/env python3
"""Build an isolated Android policy fixture from actual YT Music DEX.

This fixture is not a playable YT Music installation. It has a minimal manifest,
no account providers or exported music service, and every input DEX unchanged.
The companion instrumentation executes the original policy classes on ART.
"""
import argparse
import re
from pathlib import Path
import subprocess
import zipfile


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('apk', type=Path)
    parser.add_argument('output', type=Path)
    parser.add_argument('--version', required=True)
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    sdk = Path.home() / 'Library/Android/sdk'
    tools = sdk / 'build-tools/36.1.0'
    android = sdk / 'platforms/android-36/android.jar'
    if not re.fullmatch(r'[A-Za-z0-9_.-]+', args.version):
        parser.error('Invalid fixture version')
    suffix = args.version.replace('.', '_').replace('-', '_')
    target = 'nl.johninnl.ytmusic.policy.v' + suffix
    probe = 'nl.johninnl.ytmusic.probe.v' + suffix
    manifest = args.output / 'AndroidManifest.xml'
    manifest.write_text(f'''<manifest xmlns:android="http://schemas.android.com/apk/res/android"
package="{target}" android:versionCode="1" android:versionName="{args.version}">
<uses-sdk android:minSdkVersion="32" android:targetSdkVersion="36"/>
<queries><package android:name="app.seb3thehacker.gearslip"/>
<package android:name="app.seb3thehacker.gearslip.morphetest"/></queries>
<application android:label="YT Music Policy Fixture {suffix}"/></manifest>''')
    fixture = args.output / 'policy.apk'
    subprocess.run([str(tools / 'aapt2'), 'link', '-I', str(android), '--manifest', str(manifest), '-o', str(fixture)], check=True)
    with zipfile.ZipFile(args.apk) as source, zipfile.ZipFile(fixture, 'a', compression=zipfile.ZIP_DEFLATED) as output:
        dex = [name for name in source.namelist() if name.startswith('classes') and name.endswith('.dex')]
        assert dex, 'No DEX in input'
        for name in dex:
            output.writestr(name, source.read(name))
    with zipfile.ZipFile(args.apk) as source, zipfile.ZipFile(fixture) as output:
        assert all(source.read(name) == output.read(name) for name in dex), 'Fixture changed DEX'
    sign = [str(tools / 'apksigner'), 'sign', '--ks', str(Path.home() / '.android/debug.keystore'), '--ks-pass', 'pass:android']
    subprocess.run([*sign, str(fixture)], check=True)
    classes = args.output / 'classes'
    dexout = args.output / 'dex'
    classes.mkdir(exist_ok=True)
    dexout.mkdir(exist_ok=True)
    subprocess.run(['javac', '-source', '8', '-target', '8', '-cp', str(android), '-d', str(classes),
                    str(Path(__file__).with_name('CallerPolicyProbe.java'))], check=True)
    subprocess.run([str(tools / 'd8'), '--min-api', '32', '--lib', str(android), '--output', str(dexout),
                    *map(str, classes.rglob('*.class'))], check=True)
    manifest.write_text(f'''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="{probe}">
<uses-sdk android:minSdkVersion="32" android:targetSdkVersion="36"/><application/>
<instrumentation android:name="nl.johninnl.ytmusic.probe.CallerPolicyProbe" android:targetPackage="{target}"/></manifest>''')
    instrumentation = args.output / 'probe.apk'
    subprocess.run([str(tools / 'aapt2'), 'link', '-I', str(android), '--manifest', str(manifest), '-o', str(instrumentation)], check=True)
    with zipfile.ZipFile(instrumentation, 'a', compression=zipfile.ZIP_DEFLATED) as output:
        output.write(dexout / 'classes.dex', 'classes.dex')
    subprocess.run([*sign, str(instrumentation)], check=True)
    print(f'Fixture: {fixture}\nProbe: {instrumentation}\nRunner: {probe}/nl.johninnl.ytmusic.probe.CallerPolicyProbe')


if __name__ == '__main__':
    main()
