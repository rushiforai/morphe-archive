#!/usr/bin/env python3
"""Prepare a separately named, debug-signed Gearslip copy for local validation only.

Product patches do not repackage Gearslip. This harness preserves the installed official
app and asserts that the test adaptation leaves every classes*.dex byte unchanged.
"""
import argparse
import hashlib
from pathlib import Path
import shutil
import subprocess
import xml.etree.ElementTree as ET
import zipfile


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('apk', type=Path)
    parser.add_argument('output', type=Path)
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    decoded = args.output / 'decoded'
    if decoded.exists():
        raise SystemExit('Use a fresh output directory')
    subprocess.run(['apktool', 'd', '--no-src', '-o', str(decoded), str(args.apk)], check=True)
    manifest = decoded / 'AndroidManifest.xml'
    ET.register_namespace('android', 'http://schemas.android.com/apk/res/android')
    ns = '{http://schemas.android.com/apk/res/android}'
    tree = ET.parse(manifest)
    root = tree.getroot()
    original = root.attrib['package']
    test_package = original + '.morphetest'
    root.set('package', test_package)
    for permission in list(root.findall('permission')):
        if permission.get(ns + 'name') == 'android.car.permission.TEMPLATE_RENDERER':
            root.remove(permission)
    for element in root.iter():
        for key, value in list(element.attrib.items()):
            if key in (ns + 'authorities', ns + 'name') and value.startswith(original + '.'):
                if key == ns + 'authorities' or value.endswith('.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION'):
                    element.set(key, test_package + value[len(original):])
    app = root.find('application')
    app.set(ns + 'label', 'Gearslip Morphe Test')
    tree.write(manifest, encoding='utf-8', xml_declaration=True)
    unsigned = args.output / 'test-unsigned.apk'
    subprocess.run(['apktool', 'b', str(decoded), '-o', str(unsigned)], check=True)
    with zipfile.ZipFile(args.apk) as before, zipfile.ZipFile(unsigned) as after:
        dex = [name for name in before.namelist() if name.startswith('classes') and name.endswith('.dex')]
        assert dex and all(before.read(name) == after.read(name) for name in dex), 'Test harness changed DEX'
    sdk = Path.home() / 'Library/Android/sdk/build-tools/36.1.0'
    aligned = args.output / 'test-aligned.apk'
    subprocess.run([str(sdk / 'zipalign'), '-p', '-f', '4', str(unsigned), str(aligned)], check=True)
    signed = args.output / 'gearslip-test.apk'
    shutil.copy2(aligned, signed)
    subprocess.run([str(sdk / 'apksigner'), 'sign', '--ks', str(Path.home() / '.android/debug.keystore'),
                    '--ks-pass', 'pass:android', str(signed)], check=True)
    print(signed.resolve(), hashlib.file_digest(signed.open('rb'), 'sha256').hexdigest())


if __name__ == '__main__':
    main()
