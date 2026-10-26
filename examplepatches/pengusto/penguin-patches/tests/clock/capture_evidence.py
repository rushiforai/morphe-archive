#!/usr/bin/env python3
"""Capture matched original/patched Clock notification screenshots; publish nothing.

Requires prior default acceptance, its same-key APKs and an owned disposable AVD.
Schedules only synthetic alarms through Clock's real API and observes natural
AlarmManager delivery. Captures raw native screenshots without image editing.
"""
import argparse
import base64
import hashlib
import json
import os
import re
import sqlite3
import subprocess
import time
import xml.etree.ElementTree as ET
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PKG = 'org.fossify.clock'
ORIGINAL_SHA = '43cf9f0ec45f1f1ff2df47286622e5b8f3acedaeb07b7f7641b5243dbedca079'


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ('sdk', 'java-home', 'keystore', 'original', 'baseline', 'patched', 'acceptance-artifacts', 'artifacts'):
        p.add_argument('--' + name, type=Path, required=True)
    for name in ('serial', 'avd-name', 'key-alias'): p.add_argument('--' + name, required=True)
    p.add_argument('--disposable-emulator', action='store_true', required=True)
    a = p.parse_args()
    assert a.serial.startswith('emulator-')
    out = a.artifacts.resolve(); assert out.is_relative_to(ROOT / '.scratch')
    out.mkdir(parents=True, exist_ok=True)
    env = dict(os.environ, JAVA_HOME=str(a.java_home.resolve()))
    api, tools = a.sdk / 'platforms/android-35/android.jar', a.sdk / 'build-tools/36.0.0'

    def run(*args, binary=False):
        result = subprocess.run(list(map(str, args)), env=env, check=True, capture_output=True, timeout=60)
        return result.stdout if binary else result.stdout.decode()

    def adb(*args, binary=False): return run(a.sdk / 'platform-tools/adb', '-s', a.serial, *args, binary=binary)
    def sha(path): return hashlib.sha256(path.read_bytes()).hexdigest()
    def certificate(path):
        return re.search(r'certificate SHA-256 digest: (\w+)', run(tools / 'apksigner', 'verify', '--print-certs', path))[1]
    def payload(path):
        with zipfile.ZipFile(path) as z: return {n: z.read(n) for n in z.namelist() if not n.startswith('META-INF/') and not n.endswith('/')}

    assert sha(a.original) == ORIGINAL_SHA and payload(a.original) == payload(a.baseline)
    proof = json.loads((a.acceptance_artifacts / 'summary-120.json').read_text())
    assert proof['outcome'] == 'PASS' and sha(a.patched) == proof['patchedSha256']
    assert certificate(a.baseline) == certificate(a.patched) == proof['certificate'] != certificate(a.original)
    assert adb('shell', 'getprop', 'ro.hardware').strip() == 'ranchu'
    assert adb('shell', 'getprop', 'ro.kernel.qemu').strip() == '1'
    assert adb('shell', 'getprop', 'sys.boot_completed').strip() == '1'
    assert adb('emu', 'avd', 'name').splitlines()[0] == a.avd_name
    assert 'uid=0' in adb('shell', 'su', '0', 'id')
    installed = adb('shell', 'pm', 'path', PKG).strip().removeprefix('package:')
    installed_sha = hashlib.sha256(adb('exec-out', 'cat', installed, binary=True)).hexdigest()
    assert installed_sha in {sha(a.baseline), sha(a.patched)}, 'Unowned Clock installation'

    def build(name, source, manifest):
        folder = out / name; classes, dex = folder / 'classes', folder / 'dex'
        classes.mkdir(parents=True, exist_ok=True); dex.mkdir(exist_ok=True)
        run(a.java_home / 'bin/javac', '-cp', api, '-d', classes, ROOT / source)
        run(tools / 'd8', '--lib', api, '--output', dex, *classes.rglob('*.class'))
        apk = folder / 'tests.apk'; apk.unlink(missing_ok=True)
        run(tools / 'aapt2', 'link', '-I', api, '--manifest', ROOT / manifest, '-o', apk)
        with zipfile.ZipFile(apk, 'a') as z: z.write(dex / 'classes.dex', 'classes.dex')
        run(tools / 'apksigner', 'sign', '--ks', a.keystore, '--ks-pass', 'pass:android',
            '--key-pass', 'pass:android', '--ks-key-alias', a.key_alias, apk)
        assert certificate(apk) == proof['certificate']; adb('install', '-r', apk)

    build('driver', 'tests/clock/UiSnapshot.java', 'tests/clock/UiManifest.xml')
    build('instrumentation', 'tests/clock/ClockEvidence.java', 'tests/clock/EvidenceManifest.xml')
    first = (int(time.time() // 60) + 46) * 60000; second = first + 15 * 60000

    def instrument(mode, label):
        output = adb('shell', 'am', 'instrument', '-w', '-r', '-e', 'disposable', 'true',
            '-e', 'mode', mode, '-e', 'first', first, '-e', 'second', second,
            'io.github.pengusto.patches.clock.evidence/io.github.pengusto.patches.clock.evidence.ClockEvidence')
        (out / (label + '.txt')).write_text(output)
        assert 'INSTRUMENTATION_CODE: -1' in output and 'PASS:' in output, output
        match = re.search(r'INSTRUMENTATION_RESULT: notifications=(.*)', output)
        # Android may add a ranker_group summary, which is not an alarm notice.
        return [n for n in json.loads(match[1]) if n.get('tag') != 'ranker_group']

    def snapshot(label, package):
        for attempt in range(4):
            output = adb('shell', 'am', 'instrument', '-w', '-r',
                'io.github.pengusto.patches.clock.ui/io.github.pengusto.patches.clock.ui.UiSnapshot')
            match = re.search(r'INSTRUMENTATION_RESULT: xml=(.*)', output)
            if match and 'INSTRUMENTATION_CODE: -1' in output:
                xml = base64.b64decode(match[1]); root = ET.fromstring(xml)
                if any(n.get('package') == package for n in root.iter('node')):
                    (out / (label + '.xml')).write_bytes(xml); return root
            time.sleep(.3)
        raise AssertionError('No fresh target UI: ' + output)

    def capture(label, shade=False):
        if shade:
            adb('shell', 'cmd', 'statusbar', 'expand-notifications'); time.sleep(.7)
        else:
            adb('shell', 'cmd', 'statusbar', 'collapse')
            adb('shell', 'am', 'start', '-W', '-a', 'android.intent.action.SHOW_ALARMS', '-n', PKG + '/.activities.SplashActivity')
            # Opening Clock natively reschedules enabled alarms, clearing/replacing
            # notices. Observe the subsequent natural delivery after minimum futurity.
            time.sleep(8)
        root = snapshot(label, 'com.android.systemui' if shade else PKG)
        if label == 'after':
            # Expand Clock's own group, using fresh accessibility bounds. The
            # collapsed group clips the synthetic IDs needed to compare A/B.
            parents = {child: parent for parent in root.iter() for child in parent}
            headers = [n for n in root.iter('node') if n.get('text') == 'Clock'
                and n.get('resource-id') == 'android:id/app_name_text']
            assert len(headers) == 1, 'Expected one Clock notification group'
            group = headers[0]
            buttons = []
            while group in parents:
                group = parents[group]
                buttons = [n for n in group.iter('node')
                    if n.get('resource-id') == 'android:id/expand_button'
                    and n.get('content-desc') == 'Expand' and n.get('visible') == 'true']
                if buttons: break
            assert len(buttons) == 1, 'Ambiguous Clock expand control'
            x1, y1, x2, y2 = map(int, re.fullmatch(r'\[(\d+),(\d+)\]\[(\d+),(\d+)\]', buttons[0].get('bounds')).groups())
            adb('shell', 'input', 'tap', (x1 + x2) // 2, (y1 + y2) // 2)
            time.sleep(.5)
            root = snapshot(label, 'com.android.systemui')
        (out / (label + '.png')).write_bytes(adb('exec-out', 'screencap', '-p', binary=True))
        return root

    def rows(label):
        folder = out / label; folder.mkdir(exist_ok=True)
        names = adb('shell', 'su', '0', 'ls', '/data/user/0/' + PKG + '/databases').split()
        for suffix in ('', '-wal', '-shm'):
            path = folder / ('alarms.db' + suffix); path.unlink(missing_ok=True)
            if 'alarms.db' + suffix in names:
                path.write_bytes(adb('exec-out', 'su', '0', 'cat', '/data/user/0/' + PKG + '/databases/alarms.db' + suffix, binary=True))
        with sqlite3.connect(folder / 'alarms.db') as db: return db.execute('SELECT * FROM contacts ORDER BY id').fetchall()

    marker = 'PenguinClockEvidence-' + str(time.time_ns()); adb('shell', 'log', '-t', 'PenguinClockEvidence', marker)
    # Cleanup through actual installed native DB methods before replacing the payload.
    instrument('cleanup', 'initial-cleanup')
    unrelated = rows('initial-rows')
    completed = False
    try:
        adb('install', '-r', a.baseline)
        adb('shell', 'pm', 'grant', PKG, 'android.permission.POST_NOTIFICATIONS')
        before_notices = instrument('seed', 'original-scheduled')
        assert not before_notices, before_notices
        fixture = rows('original-rows')
        capture('alarms-original'); capture('before', shade=True)

        adb('shell', 'cmd', 'statusbar', 'collapse')
        adb('install', '-r', a.patched)
        assert rows('updated-rows') == fixture, 'Same-key update changed fixture data'
        after_notices = instrument('seed', 'patched-scheduled')
        # seed observes delivery while keeping the target alive. Starting an
        # inspect instrumentation here would force-stop pending broadcasts.
        assert {n['alarmId'] for n in after_notices} == {910014, 910015}, after_notices
        assert {n['when'] for n in after_notices} == {first, second}, after_notices
        assert rows('patched-rows') == fixture, 'Original and patched alarm definitions differ'
        capture('alarms-patched'); root = capture('after', shade=True)
        visible_text = ' '.join(n.get('text', '') for n in root.iter('node') if n.get('visible') == 'true')
        assert '910014' in visible_text and '910015' in visible_text, visible_text
        remaining = instrument('dismiss-A', 'dismiss-A')
        assert [n['alarmId'] for n in remaining] == [910015], remaining
        capture('after-dismiss-A', shade=True)
        assert rows('after-skip-rows') == fixture, 'Recurring skip changed alarm definitions'
        completed = True
    finally:
        adb('shell', 'cmd', 'statusbar', 'collapse')
        adb('install', '-r', a.patched)
        instrument('cleanup', 'cleanup')
        assert rows('cleaned-rows') == unrelated, 'Fixture cleanup affected unrelated rows'
    logs = adb('logcat', '-d', '-v', 'threadtime'); assert marker in logs
    logs = logs.split(marker, 1)[1]; (out / 'logcat.txt').write_text(logs)
    assert not re.search(r'FATAL EXCEPTION|VerifyError|NoSuchMethodError|NoSuchFieldError|IllegalAccessError', logs)
    assert completed
    summary = dict(outcome='PASS', originalSha256=sha(a.original), baselineSha256=sha(a.baseline),
        patchedSha256=sha(a.patched), certificate=proof['certificate'], firstWhen=first, secondWhen=second,
        beforeNotifications=before_notices, afterNotifications=after_notices, afterDismissA=remaining,
        fixtureRowsEqual=True, sameKeyUpdateRetainedData=True, unrelatedRowsPreserved=True,
        directNotificationOrReceiverInjection=False,
        screenshots={name: sha(out / (name + '.png')) for name in ['before', 'after', 'after-dismiss-A', 'alarms-original', 'alarms-patched']})
    (out / 'summary.json').write_text(json.dumps(summary, indent=2) + '\n')
    print(json.dumps(summary, indent=2), flush=True)


if __name__ == '__main__': main()
