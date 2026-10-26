#!/usr/bin/env python3
"""Reproduce Clock 1.6.0's shared upcoming-alarm identity on a disposable emulator.

Re-signs the verified original with an existing disposable key; never patches its
code or edits its database. Refuses an unrelated installed Clock application.
"""
import argparse
import hashlib
import json
import os
import re
import subprocess
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
ORIGINAL_SHA = '43cf9f0ec45f1f1ff2df47286622e5b8f3acedaeb07b7f7641b5243dbedca079'
ORIGINAL_CERT = 'affdb124d3f4720c2f98dbca9eacba0514fba4306e20a2786c861c3c0d6ff292'
PKG = 'org.fossify.clock'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ('original', 'sdk', 'java-home', 'keystore', 'artifacts'):
        parser.add_argument('--' + name, required=True, type=Path)
    parser.add_argument('--serial', required=True)
    parser.add_argument('--avd-name', required=True)
    parser.add_argument('--key-alias', required=True)
    parser.add_argument('--disposable-emulator', action='store_true', required=True)
    args = parser.parse_args()
    assert args.serial.startswith('emulator-'), 'Physical devices are unsupported'
    assert hashlib.sha256(args.original.read_bytes()).hexdigest() == ORIGINAL_SHA
    out = args.artifacts.resolve()
    assert out.is_relative_to(ROOT / '.scratch'), 'Artifacts must remain ignored'
    out.mkdir(parents=True, exist_ok=True)
    env = dict(os.environ, JAVA_HOME=str(args.java_home.resolve()))
    tools = args.sdk / 'build-tools/36.0.0'
    api = args.sdk / 'platforms/android-35/android.jar'

    def run(*command, timeout=60):
        return subprocess.check_output(list(map(str, command)), env=env,
                                       stderr=subprocess.STDOUT, timeout=timeout).decode()

    def adb(*command):
        return run(args.sdk / 'platform-tools/adb', '-s', args.serial, *command)

    def cert(apk):
        return re.search(r'certificate SHA-256 digest: (\w+)',
                         run(tools / 'apksigner', 'verify', '--print-certs', apk)).group(1)

    def payload(apk):
        with zipfile.ZipFile(apk) as z:
            return {name: z.read(name) for name in z.namelist()
                    if not name.startswith('META-INF/') and not name.endswith('/')}

    assert adb('shell', 'getprop', 'ro.hardware').strip() == 'ranchu'
    assert adb('shell', 'getprop', 'ro.kernel.qemu').strip() == '1'
    assert adb('shell', 'getprop', 'sys.boot_completed').strip() == '1'
    assert adb('emu', 'avd', 'name').splitlines()[0] == args.avd_name
    assert cert(args.original) == ORIGINAL_CERT
    identity = run(tools / 'aapt2', 'dump', 'badging', args.original)
    assert "name='org.fossify.clock'" in identity and "versionName='1.6.0'" in identity

    baseline = out / 'original-resigned.apk'
    sign = [tools / 'apksigner', 'sign', '--ks', args.keystore,
            '--ks-pass', 'pass:android', '--key-pass', 'pass:android',
            '--ks-key-alias', args.key_alias]
    run(*sign, '--out', baseline, args.original)
    test_cert = cert(baseline)
    assert test_cert != ORIGINAL_CERT, 'A disposable test key is required'
    original_payload = payload(args.original)
    assert payload(baseline) == original_payload, 'Re-signing changed code/resources'
    installed_packages = adb('shell', 'pm', 'list', 'packages', PKG).splitlines()
    if 'package:' + PKG in installed_packages:
        installed = adb('shell', 'pm', 'path', PKG).strip()
        assert installed.startswith('package:') and len(installed.splitlines()) == 1
        installed_apk = out / 'previously-installed.apk'
        adb('pull', installed.removeprefix('package:'), installed_apk)
        assert cert(installed_apk) == test_cert, 'Unrelated installed Clock certificate'
        assert payload(installed_apk) == original_payload, 'Unrelated installed Clock code'
    print(adb('install', '-r', baseline).strip(), flush=True)

    classes, dex = out / 'classes', out / 'dex'
    classes.mkdir(exist_ok=True)
    dex.mkdir(exist_ok=True)
    run(args.java_home / 'bin/javac', '-cp', api, '-d', classes,
        ROOT / 'tests/clock/UpcomingIdentityProbe.java')
    run(tools / 'd8', '--lib', api, '--output', dex, *classes.rglob('*.class'))
    test_apk = out / 'probe.apk'
    test_apk.unlink(missing_ok=True)
    run(tools / 'aapt2', 'link', '-I', api, '--manifest',
        ROOT / 'tests/clock/AndroidManifest.xml', '-o', test_apk)
    with zipfile.ZipFile(test_apk, 'a') as z:
        z.write(dex / 'classes.dex', 'classes.dex')
    run(*sign, test_apk)
    print(adb('install', '-r', test_apk).strip(), flush=True)
    output = adb('shell', 'am', 'instrument', '-w', '-r',
                 'io.github.pengusto.patches.clock.tests/'
                 'io.github.pengusto.patches.clock.tests.UpcomingIdentityProbe')
    (out / 'instrumentation.txt').write_text(output)
    assert 'INSTRUMENTATION_CODE: -1' in output and 'REPRODUCED:' in output, output
    for key in ('upcomingCollision', 'cancellingFirstCancelsSecond'):
        assert key + '=true' in output, output
    assert 'skipActionCollision=false' in output, output
    report = dict(originalSha256=ORIGINAL_SHA, originalCertificate=ORIGINAL_CERT,
                  testCertificate=test_cert, serial=args.serial, avd=args.avd_name,
                  codeAndResourcesUnchanged=True, upcomingCollision=True,
                  skipActionCollision=False, cancellingFirstCancelsSecond=True,
                  outcome='REPRODUCED on original APK; baseline probe only, not patched acceptance')
    (out / 'finding.json').write_text(json.dumps(report, indent=2) + '\n')
    print(output, flush=True)


if __name__ == '__main__':
    main()
