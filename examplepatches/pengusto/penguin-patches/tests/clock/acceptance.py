#!/usr/bin/env python3
"""Build/apply/test Clock #14 locally on an explicitly named disposable emulator.

Uses the original APK, a local MPP and an existing disposable key. No downloads,
uninstall, compatibility override, app-data clearing or publication.
"""
import argparse
import hashlib
import json
import os
import re
import sqlite3
import subprocess
import uuid
import xml.etree.ElementTree as ET
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PKG = 'org.fossify.clock'
SHA = '43cf9f0ec45f1f1ff2df47286622e5b8f3acedaeb07b7f7641b5243dbedca079'
CERT = 'affdb124d3f4720c2f98dbca9eacba0514fba4306e20a2786c861c3c0d6ff292'
PATCH = 'Choose upcoming alarm notification time'


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ('original', 'mpp', 'desktop', 'sdk', 'java-home', 'keystore', 'artifacts'):
        p.add_argument('--' + name, required=True, type=Path)
    for name in ('serial', 'avd-name', 'key-alias'):
        p.add_argument('--' + name, required=True)
    p.add_argument('--lead', type=int, default=120)
    p.add_argument('--mode', choices=('suite', 'timing'), default='suite')
    p.add_argument('--baseline', action='store_true')
    p.add_argument('--disposable-emulator', action='store_true', required=True)
    a = p.parse_args()
    assert a.serial.startswith('emulator-') and 1 <= a.lead <= 1440
    out = a.artifacts.resolve()
    assert out.is_relative_to(ROOT / '.scratch')
    out.mkdir(parents=True, exist_ok=True)
    env = dict(os.environ, JAVA_HOME=str(a.java_home.resolve()))
    tools, api = a.sdk / 'build-tools/36.0.0', a.sdk / 'platforms/android-35/android.jar'
    java = a.java_home / 'bin/java'

    def run(*command, timeout=240, check=True):
        return subprocess.run(list(map(str, command)), env=env, check=check,
                              stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=timeout)

    def adb(*command, binary=False):
        output = run(a.sdk / 'platform-tools/adb', '-s', a.serial, *command).stdout
        return output if binary else output.decode()

    def digest(path): return hashlib.sha256(path.read_bytes()).hexdigest()

    def cert(apk):
        return re.search(r'certificate SHA-256 digest: (\w+)',
                         run(tools / 'apksigner', 'verify', '--print-certs', apk).stdout.decode()).group(1)

    def payload(apk):
        with zipfile.ZipFile(apk) as z:
            return {n: z.read(n) for n in z.namelist() if not n.startswith('META-INF/') and not n.endswith('/')}

    assert digest(a.original) == SHA and cert(a.original) == CERT
    assert adb('shell', 'getprop', 'ro.hardware').strip() == 'ranchu'
    assert adb('shell', 'getprop', 'ro.kernel.qemu').strip() == '1'
    assert adb('shell', 'getprop', 'sys.boot_completed').strip() == '1'
    assert adb('emu', 'avd', 'name').splitlines()[0] == a.avd_name
    assert 'uid=0' in adb('shell', 'su', '0', 'id')
    sign = [tools / 'apksigner', 'sign', '--ks', a.keystore, '--ks-pass', 'pass:android',
            '--key-pass', 'pass:android', '--ks-key-alias', a.key_alias]
    baseline = out / 'original-resigned.apk'
    run(*sign, '--out', baseline, a.original)
    test_cert = cert(baseline)
    assert test_cert != CERT and payload(a.original) == payload(baseline)
    ownership = out / 'owned-apks.json'
    owned = json.loads(ownership.read_text()) if ownership.exists() else []
    if 'package:' + PKG in adb('shell', 'pm', 'list', 'packages', PKG).splitlines():
        installed = adb('shell', 'pm', 'path', PKG).strip()
        assert len(installed.splitlines()) == 1 and installed.startswith('package:')
        prior = out / 'installed-before.apk'
        adb('pull', installed.removeprefix('package:'), prior)
        assert cert(prior) == test_cert
        assert payload(prior) == payload(a.original) or digest(prior) in owned, 'Unowned Clock installation'

    def install(apk):
        print(adb('install', '-r', apk).strip(), flush=True)
        owned.append(digest(apk)); ownership.write_text(json.dumps(sorted(set(owned)), indent=2))

    classes, dex = out / 'classes', out / 'dex'
    classes.mkdir(exist_ok=True); dex.mkdir(exist_ok=True)
    run(a.java_home / 'bin/javac', '-cp', api, '-d', classes, ROOT / 'tests/clock/ClockAcceptance.java')
    run(tools / 'd8', '--lib', api, '--output', dex, *classes.rglob('*.class'))
    tests = out / 'acceptance.apk'; tests.unlink(missing_ok=True)
    run(tools / 'aapt2', 'link', '-I', api, '--manifest', ROOT / 'tests/clock/AcceptanceManifest.xml', '-o', tests)
    with zipfile.ZipFile(tests, 'a') as z: z.write(dex / 'classes.dex', 'classes.dex')
    run(*sign, tests)
    print(adb('install', '-r', tests).strip(), flush=True)

    def instrument(mode, path):
        output = adb('shell', 'am', 'instrument', '-w', '-r', '-e', 'disposable', 'true',
                     '-e', 'mode', mode, '-e', 'lead', str(a.lead),
                     'io.github.pengusto.patches.clock.acceptance/'
                     'io.github.pengusto.patches.clock.tests.ClockAcceptance')
        path.write_text(output); print(output, flush=True)
        return output

    if a.baseline:
        install(baseline)
        output = instrument('identity', out / 'baseline-regression.txt')
        assert 'Different alarms share the upcoming PendingIntent' in output
        assert 'INSTRUMENTATION_CODE: 0' in output, 'Baseline must fail for the actual identity defect'
        output = instrument('preservation-seed', out / 'preservation-seed.txt')
        assert 'INSTRUMENTATION_CODE: -1' in output, output

    def snapshot(label):
        adb('shell', 'am', 'force-stop', PKG)
        saved = out / label; saved.mkdir(exist_ok=True)
        result = dict(databases={}, preferences={})
        for directory in ('databases', 'shared_prefs'):
            names = adb('shell', 'su', '0', 'ls', '/data/user/0/' + PKG + '/' + directory).split()
            for name in names:
                (saved / name).write_bytes(adb('exec-out', 'su', '0', 'cat', '/data/user/0/' + PKG + '/' + directory + '/' + name, binary=True))
                if directory == 'shared_prefs' and name != 'penguin_clock_upcoming.xml':
                    root = ET.parse(saved / name).getroot()
                    result['preferences'][name] = sorted(ET.tostring(n).decode() for n in root)
            if directory == 'databases':
                for name in names:
                    if not name.endswith('.db'): continue
                    with sqlite3.connect(saved / name) as db:
                        tables = db.execute("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name").fetchall()
                        result['databases'][name] = {table: sorted(db.execute('SELECT * FROM "' + table.replace('"', '""') + '"').fetchall(), key=repr)
                                                     for (table,) in tables}
        return result

    before = snapshot('before-update')
    unsigned, patched = out / ('unsigned-' + str(a.lead) + '.apk'), out / ('patched-' + str(a.lead) + '.apk')
    report = out / ('patch-' + str(a.lead) + '.json')
    output = run(java, '-jar', a.desktop, 'patch', a.original, '-p', a.mpp, '--exclusive',
                 '-e', PATCH, '-O', 'leadMinutes=' + str(a.lead), '--unsigned',
                 '-o', unsigned, '-r', report, '-t', out / 'patch-work').stdout.decode()
    (out / ('patch-' + str(a.lead) + '.log')).write_text(output)
    data = json.loads(report.read_text())
    assert not data['failedPatches'] and len(data['appliedPatches']) == 1, output
    assert data['appliedPatches'][0]['options'] == [{'key': 'leadMinutes', 'value': a.lead}]
    run(*sign, '--out', patched, unsigned)
    assert cert(patched) == test_cert
    identity = run(tools / 'aapt2', 'dump', 'badging', patched).stdout.decode()
    assert "name='org.fossify.clock'" in identity and "versionName='1.6.0'" in identity
    install(patched)
    after = snapshot('after-update')
    assert before == after, 'Same-key update changed existing database rows or preferences'
    adb('shell', 'pm', 'grant', PKG, 'android.permission.POST_NOTIFICATIONS')
    adb('shell', 'appops', 'set', PKG, 'SYSTEM_ALERT_WINDOW', 'allow')
    adb('shell', 'input', 'keyevent', 'KEYCODE_WAKEUP')
    marker = 'ClockAcceptance-' + uuid.uuid4().hex
    adb('shell', 'log', '-t', 'PenguinClockAcceptance', marker)
    output = instrument(a.mode, out / ('acceptance-' + str(a.lead) + '.txt'))
    assert 'INSTRUMENTATION_CODE: -1' in output and 'PASS:' in output, output
    if a.mode == 'suite':
        for mode in ('persistence-seed', 'persistence-check'):
            if mode == 'persistence-check': adb('shell', 'am', 'force-stop', PKG)
            extra = instrument(mode, out / (mode + '.txt'))
            assert 'INSTRUMENTATION_CODE: -1' in extra and 'PASS:' in extra, extra
        adb('shell', 'pm', 'revoke', PKG, 'android.permission.POST_NOTIFICATIONS')
        try:
            extra = instrument('permission-denied', out / 'permission-denied.txt')
            assert 'INSTRUMENTATION_CODE: -1' in extra and 'PASS:' in extra, extra
        finally:
            adb('shell', 'pm', 'grant', PKG, 'android.permission.POST_NOTIFICATIONS')
    logs = adb('logcat', '-d', '-v', 'threadtime')
    assert marker in logs, 'Log marker missing; cannot verify this run'
    logs = logs.split(marker, 1)[1]
    (out / ('logcat-' + str(a.lead) + '.txt')).write_text(logs)
    assert 'INSTRUMENTATION_CODE: -1' in output and 'PASS:' in output, output
    assert not re.search(r'FATAL EXCEPTION|VerifyError|NoSuchMethodError|NoSuchFieldError|IllegalAccessError', logs), 'Runtime/linkage error in test log'
    summary = dict(originalSha256=SHA, mppSha256=digest(a.mpp), patchedSha256=digest(patched),
                   certificate=test_cert, leadMinutes=a.lead, mode=a.mode,
                   sameKeyUpdatePreservedData=True, outcome='PASS')
    (out / ('summary-' + str(a.lead) + '.json')).write_text(json.dumps(summary, indent=2) + '\n')
    print(json.dumps(summary, indent=2), flush=True)


if __name__ == '__main__': main()
