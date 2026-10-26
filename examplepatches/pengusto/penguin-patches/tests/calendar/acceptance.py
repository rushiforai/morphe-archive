#!/usr/bin/env python3
"""Verify original provenance, apply Calendar #381, same-key update and native integration.

Only an explicitly named rooted disposable emulator is accepted. No uninstall,
data clearing, compatibility override, downloads or publication. Artifacts stay ignored.
"""
import argparse
import hashlib
import json
import os
import re
import sqlite3
import subprocess
import xml.etree.ElementTree as ET
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PKG = 'org.fossify.calendar'
SHA = 'd43b2df05d5702bea760a7ab03402977ba72e446e5932038efbdab248a5de987'
CERT = 'affdb124d3f4720c2f98dbca9eacba0514fba4306e20a2786c861c3c0d6ff292'
PATCH = 'Separate all-day reminder defaults'


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ('original', 'mpp', 'desktop', 'sdk', 'java-home', 'keystore', 'artifacts'):
        p.add_argument('--' + name, required=True, type=Path)
    for name in ('serial', 'avd-name', 'key-alias'):
        p.add_argument('--' + name, required=True)
    p.add_argument('--baseline', action='store_true')
    p.add_argument('--html', action='store_true', help='Also apply the existing Calendar HTML patch')
    p.add_argument('--disposable-emulator', action='store_true', required=True)
    a = p.parse_args(); out = a.artifacts.resolve()
    assert a.serial.startswith('emulator-') and out.is_relative_to(ROOT / '.scratch')
    out.mkdir(parents=True, exist_ok=True)
    env = dict(os.environ, JAVA_HOME=str(a.java_home.resolve()))
    tools, api = a.sdk / 'build-tools/36.0.0', a.sdk / 'platforms/android-35/android.jar'

    def run(*command, timeout=240, check=True):
        return subprocess.run(list(map(str, command)), env=env, check=check,
                              stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=timeout)

    def adb(*command, binary=False):
        data = run(a.sdk / 'platform-tools/adb', '-s', a.serial, *command).stdout
        return data if binary else data.decode()

    def digest(path): return hashlib.sha256(path.read_bytes()).hexdigest()

    def cert(apk):
        return re.search(r'certificate SHA-256 digest: (\w+)',
                         run(tools / 'apksigner', 'verify', '--print-certs', apk).stdout.decode()).group(1)

    def payload(apk):
        with zipfile.ZipFile(apk) as z:
            return {n: z.read(n) for n in z.namelist() if not n.startswith('META-INF/') and not n.endswith('/')}

    assert digest(a.original) == SHA and cert(a.original) == CERT
    identity = run(tools / 'aapt2', 'dump', 'badging', a.original).stdout.decode()
    assert "name='org.fossify.calendar'" in identity and "versionName='1.12.0'" in identity and "versionCode='23'" in identity
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
        assert payload(prior) == payload(a.original) or digest(prior) in owned, 'Unowned Calendar installation'

    def install(apk):
        print(adb('install', '-r', apk).strip(), flush=True)
        owned.append(digest(apk)); ownership.write_text(json.dumps(sorted(set(owned)), indent=2))

    classes, dex = out / 'test-classes', out / 'test-dex'
    classes.mkdir(exist_ok=True); dex.mkdir(exist_ok=True)
    run(a.java_home / 'bin/javac', '-cp', api, '-d', classes, ROOT / 'tests/calendar/CalendarAcceptance.java')
    run(tools / 'd8', '--lib', api, '--output', dex, *classes.rglob('*.class'))
    tests = out / 'acceptance.apk'; tests.unlink(missing_ok=True)
    run(tools / 'aapt2', 'link', '-I', api, '--manifest', ROOT / 'tests/calendar/AcceptanceManifest.xml', '-o', tests)
    with zipfile.ZipFile(tests, 'a') as z: z.write(dex / 'classes.dex', 'classes.dex')
    run(*sign, tests)
    print(adb('install', '-r', tests).strip(), flush=True)

    def instrument(mode):
        output = adb('shell', 'am', 'instrument', '-w', '-r', '-e', 'disposable', 'true',
            '-e', 'mode', mode, 'io.github.pengusto.patches.calendar.acceptance/'
            'io.github.pengusto.patches.calendar.tests.CalendarAcceptance')
        (out / (mode + ('-html' if a.html else '') + '.txt')).write_text(output)
        print(output, flush=True)
        assert 'INSTRUMENTATION_CODE: -1' in output and 'PASS:' in output, output
        return output

    for permission in ('READ_CALENDAR', 'WRITE_CALENDAR', 'POST_NOTIFICATIONS'):
        adb('shell', 'pm', 'grant', PKG, 'android.permission.' + permission)
    adb('shell', 'appops', 'set', PKG, 'SCHEDULE_EXACT_ALARM', 'allow')
    if a.baseline:
        install(baseline)
        instrument('baseline')

    def snapshot(label):
        adb('shell', 'am', 'force-stop', PKG)
        saved = out / label; saved.mkdir(exist_ok=True)
        result = dict(databases={}, preferences={})
        for directory in ('databases', 'shared_prefs'):
            names = adb('shell', 'su', '0', 'ls', '/data/user/0/' + PKG + '/' + directory).split()
            for name in names:
                (saved / name).write_bytes(adb('exec-out', 'su', '0', 'cat', '/data/user/0/' + PKG + '/' + directory + '/' + name, binary=True))
                if directory == 'shared_prefs':
                    result['preferences'][name] = sorted(ET.tostring(n).decode() for n in ET.parse(saved / name).getroot())
            if directory == 'databases':
                for name in names:
                    if not name.endswith('.db'): continue
                    with sqlite3.connect(saved / name) as db:
                        tables = db.execute("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name").fetchall()
                        result['databases'][name] = {table: sorted(db.execute('SELECT * FROM "' + table.replace('"', '""') + '"').fetchall(), key=repr)
                                                    for (table,) in tables}
        return result

    before = snapshot('before-update')
    label = 'combined' if a.html else 'standalone'
    unsigned, patched = out / (label + '-unsigned.apk'), out / (label + '-patched.apk')
    report = out / (label + '-patch.json')
    command = [a.java_home / 'bin/java', '-jar', a.desktop, 'patch', a.original,
               '-p', a.mpp, '--exclusive', '-e', PATCH]
    if a.html: command += ['-e', 'Readable Calendar descriptions']
    proc = run(*command, '--unsigned', '-o', unsigned, '-r', report, '-t', out / (label + '-work'), check=False)
    output = proc.stdout.decode()
    (out / (label + '-patch.log')).write_text(output)
    assert proc.returncode == 0, output
    data = json.loads(report.read_text())
    assert not data['failedPatches'] and len(data['appliedPatches']) == (2 if a.html else 1), output
    run(*sign, '--out', patched, unsigned)
    assert cert(patched) == test_cert
    install(patched)
    assert before == snapshot('after-update'), 'Same-key update changed existing database rows or preferences'
    marker = 'PenguinCalendar381-' + str(os.getpid())
    adb('shell', 'log', '-t', 'PenguinCalendarAcceptance', marker)
    test_output = instrument('suite')
    expected_alarm = int(re.search(r'expectedAlarm=(\d+)', test_output)[1])
    alarms = adb('shell', 'dumpsys', 'alarm')
    (out / (label + '-alarms.txt')).write_text(alarms)
    assert re.search(r'Alarm\{[^\n]*origWhen ' + str(expected_alarm) + r'[^\n]*org\.fossify\.calendar\}\s+tag=\*walarm\*:org\.fossify\.calendar/\.receivers\.NotificationReceiver', alarms), 'Native scheduled reminder does not match local midnight minus reminder plus native 1s offset'
    logs = adb('logcat', '-d', '-v', 'threadtime')
    assert marker in logs
    logs = logs.split(marker, 1)[1]
    (out / (label + '-logcat.txt')).write_text(logs)
    assert not re.search(r'FATAL EXCEPTION|VerifyError|NoSuchMethodError|NoSuchFieldError|IllegalAccessError', logs), 'Runtime/linkage error'
    summary = dict(originalSha256=SHA, mppSha256=digest(a.mpp), patchedSha256=digest(patched),
                   certificate=test_cert, html=a.html, sameKeyUpdatePreservedData=True,
                   nativeReminderScheduledAt=expected_alarm, outcome='PASS')
    (out / (label + '-summary.json')).write_text(json.dumps(summary, indent=2) + '\n')
    print(json.dumps(summary, indent=2), flush=True)


if __name__ == '__main__': main()
