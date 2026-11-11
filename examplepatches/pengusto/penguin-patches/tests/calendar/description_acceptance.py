#!/usr/bin/env python3
"""Compare official and patched Calendar surfaces on a disposable emulator.

This intentionally writes synthetic events and notification channels on the
fixture. It never uninstalls or clears app data and restores the original APK.
"""
import argparse
import hashlib
import os
import re
import subprocess
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PKG = 'org.fossify.calendar'
ORIGINALS = {
    'd43b2df05d5702bea760a7ab03402977ba72e446e5932038efbdab248a5de987': '1.12.0',
    'dae815ce83285facf9fd8648b8c4f039700d95126325db124521eba479b270ba': '1.12.1',
    '2825816d0a972bd85eb289e556221293fadecfd3179a4a2531bde6f89c6f0238': '1.12.2',
}
OFFICIAL_CERT = 'affdb124d3f4720c2f98dbca9eacba0514fba4306e20a2786c861c3c0d6ff292'

def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ('original', 'patched', 'sdk', 'java-home', 'keystore', 'artifacts'):
        p.add_argument('--' + name, required=True, type=Path)
    for name in ('serial', 'avd-name', 'key-alias'):
        p.add_argument('--' + name, required=True)
    p.add_argument('--disposable-emulator', required=True, action='store_true')
    a = p.parse_args()
    out = a.artifacts.resolve()
    assert out.is_relative_to(ROOT / '.scratch') and a.serial.startswith('emulator-')
    out.mkdir(parents=True, exist_ok=False)
    env = dict(os.environ, JAVA_HOME=str(a.java_home.resolve()))
    tools, api = a.sdk / 'build-tools/36.0.0', a.sdk / 'platforms/android-35/android.jar'
    def run(*args):
        return subprocess.run(list(map(str, args)), env=env, check=True, stdout=subprocess.PIPE,
                              stderr=subprocess.STDOUT, timeout=180).stdout.decode()
    def adb(*args): return run(a.sdk / 'platform-tools/adb', '-s', a.serial, *args)
    def cert(path):
        return re.search(r'certificate SHA-256 digest: (\w+)', run(tools / 'apksigner', 'verify', '--print-certs', path)).group(1)
    sha = hashlib.sha256(a.original.read_bytes()).hexdigest()
    assert sha in ORIGINALS and cert(a.original) == OFFICIAL_CERT
    for apk in (a.original, a.patched):
        identity = run(tools / 'aapt2', 'dump', 'badging', apk)
        assert "name='org.fossify.calendar'" in identity and "versionName='" + ORIGINALS[sha] + "'" in identity
    assert adb('shell', 'getprop', 'ro.hardware').strip() == 'ranchu'
    assert adb('shell', 'getprop', 'ro.kernel.qemu').strip() == '1'
    assert adb('shell', 'getprop', 'sys.boot_completed').strip() == '1'
    assert adb('emu', 'avd', 'name').splitlines()[0] == a.avd_name
    assert adb('shell', 'am', 'get-current-user').strip() == '0'
    path = adb('shell', 'pm', 'path', PKG).strip()
    assert path.startswith('package:') and len(path.splitlines()) == 1, 'Fixture Calendar must already be installed'
    prior = out / 'prior.apk'
    adb('pull', path[len('package:'):], prior)
    sign = [tools / 'apksigner', 'sign', '--ks', a.keystore, '--ks-pass', 'pass:android',
            '--key-pass', 'pass:android', '--ks-key-alias', a.key_alias]
    original, patched = out / 'original.apk', out / 'patched.apk'
    run(*sign, '--out', original, a.original)
    run(*sign, '--out', patched, a.patched)
    assert cert(prior) == cert(original) == cert(patched) != OFFICIAL_CERT, 'Fixture signer mismatch'
    classes, dex = out / 'classes', out / 'dex'
    classes.mkdir(); dex.mkdir()
    run(a.java_home / 'bin/javac', '-cp', api, '-d', classes, ROOT / 'tests/calendar/DescriptionSurfaces.java')
    run(tools / 'd8', '--lib', api, '--output', dex, *classes.rglob('*.class'))
    test = out / 'test.apk'
    run(tools / 'aapt2', 'link', '-I', api, '--manifest', ROOT / 'tests/calendar/DescriptionSurfacesManifest.xml', '-o', test)
    with zipfile.ZipFile(test, 'a') as z: z.write(dex / 'classes.dex', 'classes.dex')
    run(*sign, test)
    adb('install', '-r', test)
    try:
        for label, apk in [('baseline', original), ('patched', patched)]:
            adb('install', '-r', '-d', apk)
            for permission in ('READ_CALENDAR', 'WRITE_CALENDAR', 'POST_NOTIFICATIONS'):
                adb('shell', 'pm', 'grant', PKG, 'android.permission.' + permission)
            command = ['shell', 'am', 'instrument', '-w', '-r', '-e', 'disposable', 'true']
            if label == 'baseline': command += ['-e', 'baseline', 'true']
            text = adb(*command, 'io.github.pengusto.patches.calendar.surfaces/'
                       'io.github.pengusto.patches.calendar.tests.DescriptionSurfaces')
            (out / (label + '.txt')).write_text(text)
            assert 'INSTRUMENTATION_CODE: -1' in text and 'PASS:' in text, text
            print(label, text.strip(), flush=True)
    finally:
        adb('install', '-r', '-d', prior)

if __name__ == '__main__':
    main()
