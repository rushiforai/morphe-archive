#!/usr/bin/env python3
"""Edit/save, disable and delete only synthetic Clock alarms on a disposable emulator.

Run acceptance.py first. Uses an independent accessibility driver because Clock's
off-screen ticking views can prevent `uiautomator dump` from reaching idle.
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
import uuid
import xml.etree.ElementTree as ET
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PKG = 'org.fossify.clock'
LABEL_A, LABEL_B = 'Penguin #14 910014', 'Penguin #14 910015'


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ('sdk', 'java-home', 'keystore', 'patched', 'acceptance-artifacts', 'artifacts'):
        p.add_argument('--' + name, type=Path, required=True)
    for name in ('serial', 'avd-name', 'key-alias'):
        p.add_argument('--' + name, required=True)
    p.add_argument('--disposable-emulator', action='store_true', required=True)
    a = p.parse_args()
    assert a.serial.startswith('emulator-')
    out = a.artifacts.resolve(); assert out.is_relative_to(ROOT / '.scratch')
    out.mkdir(parents=True, exist_ok=True)
    tools, api = a.sdk / 'build-tools/36.0.0', a.sdk / 'platforms/android-35/android.jar'
    env = dict(os.environ, JAVA_HOME=str(a.java_home.resolve()))

    def run(*command, binary=False):
        result = subprocess.run(list(map(str, command)), check=True, capture_output=True,
                                timeout=60, env=env).stdout
        return result if binary else result.decode()

    def adb(*command, binary=False):
        return run(a.sdk / 'platform-tools/adb', '-s', a.serial, *command, binary=binary)

    def cert(apk):
        return re.search(r'certificate SHA-256 digest: (\w+)',
                         run(tools / 'apksigner', 'verify', '--print-certs', apk)).group(1)

    assert adb('shell', 'getprop', 'ro.hardware').strip() == 'ranchu'
    assert adb('shell', 'getprop', 'ro.kernel.qemu').strip() == '1'
    assert adb('emu', 'avd', 'name').splitlines()[0] == a.avd_name
    assert 'uid=0' in adb('shell', 'su', '0', 'id')
    proof = json.loads((a.acceptance_artifacts / 'summary-120.json').read_text())
    assert proof['outcome'] == 'PASS' and proof['mode'] == 'suite'
    sha = hashlib.sha256(a.patched.read_bytes()).hexdigest()
    assert sha == proof['patchedSha256']
    installed = adb('shell', 'pm', 'path', PKG).strip().removeprefix('package:')
    installed_bytes = adb('exec-out', 'cat', installed, binary=True)
    assert hashlib.sha256(installed_bytes).hexdigest() == sha, 'Run main acceptance on this APK first'
    assert cert(a.patched) == proof['certificate'] != 'affdb124d3f4720c2f98dbca9eacba0514fba4306e20a2786c861c3c0d6ff292'

    classes, dex = out / 'driver/classes', out / 'driver/dex'
    classes.mkdir(parents=True, exist_ok=True); dex.mkdir(parents=True, exist_ok=True)
    run(a.java_home / 'bin/javac', '-cp', api, '-d', classes, ROOT / 'tests/clock/UiSnapshot.java')
    run(tools / 'd8', '--lib', api, '--output', dex, *classes.rglob('*.class'))
    driver = out / 'driver.apk'; driver.unlink(missing_ok=True)
    run(tools / 'aapt2', 'link', '-I', api, '--manifest', ROOT / 'tests/clock/UiManifest.xml', '-o', driver)
    with zipfile.ZipFile(driver, 'a') as z: z.write(dex / 'classes.dex', 'classes.dex')
    run(tools / 'apksigner', 'sign', '--ks', a.keystore, '--ks-pass', 'pass:android',
        '--key-pass', 'pass:android', '--ks-key-alias', a.key_alias, driver)
    assert cert(driver) == proof['certificate']
    adb('install', '-r', driver)
    marker = 'PenguinClockUi-' + uuid.uuid4().hex
    adb('shell', 'log', '-t', 'PenguinClockUi', marker)

    def instrument(mode):
        result = adb('shell', 'am', 'instrument', '-w', '-r', '-e', 'disposable', 'true',
                     '-e', 'mode', mode, '-e', 'lead', '120',
                     'io.github.pengusto.patches.clock.acceptance/'
                     'io.github.pengusto.patches.clock.tests.ClockAcceptance')
        (out / (mode + '.txt')).write_text(result)
        assert 'INSTRUMENTATION_CODE: -1' in result and 'PASS:' in result, result
        print(result.strip(), flush=True)

    def snapshot(label):
        for attempt in range(4):
            result = adb('shell', 'am', 'instrument', '-w', '-r',
                         'io.github.pengusto.patches.clock.ui/io.github.pengusto.patches.clock.ui.UiSnapshot')
            match = re.search(r'INSTRUMENTATION_RESULT: xml=(.*)', result)
            if match and 'INSTRUMENTATION_CODE: -1' in result:
                xml = base64.b64decode(match[1]); root = ET.fromstring(xml)
                if any(n.get('package') == PKG for n in root.iter('node')):
                    (out / (label + '.xml')).write_bytes(xml)
                    return root
            time.sleep(.3)
        raise AssertionError('No fresh Clock accessibility state: ' + result)

    def find(root, label=None, resource=None):
        found = [n for n in root.iter('node') if n.get('visible') == 'true'
                 and (label is None or label in (n.get('text'), n.get('content-desc')))
                 and (resource is None or n.get('resource-id') == resource)]
        assert len(found) == 1, ('Ambiguous/missing visible control', label, resource, len(found))
        return found[0]

    def tap(node, hold=False):
        x, y, right, bottom = map(int, re.findall(r'-?\d+', node.get('bounds')))
        assert right > x >= 0 and bottom > y >= 0
        x, y = (x + right) // 2, (y + bottom) // 2
        adb('shell', 'input', *(['swipe', x, y, x, y, 1200] if hold else ['tap', x, y]))
        time.sleep(.4)

    def launch():
        adb('shell', 'am', 'start', '-W', '-a', 'android.intent.action.SHOW_ALARMS',
            '-n', PKG + '/.activities.SplashActivity')
        return snapshot('alarm-list')

    def screenshot(label):
        (out / (label + '.png')).write_bytes(adb('exec-out', 'screencap', '-p', binary=True))

    def rows(label):
        folder = out / label; folder.mkdir(exist_ok=True)
        names = adb('shell', 'su', '0', 'ls', '/data/user/0/' + PKG + '/databases').split()
        for suffix in ('', '-wal', '-shm'):
            target = folder / ('alarms.db' + suffix); target.unlink(missing_ok=True)
            remote = '/data/user/0/' + PKG + '/databases/alarms.db' + suffix
            if 'alarms.db' + suffix in names:
                target.write_bytes(adb('exec-out', 'su', '0', 'cat', remote, binary=True))
        assert (folder / 'alarms.db').stat().st_size > 0, 'Missing actual Clock database'
        with sqlite3.connect(folder / 'alarms.db') as db:
            db.row_factory = sqlite3.Row
            data = {r['id']: dict(r) for r in db.execute('SELECT * FROM contacts ORDER BY id')}
        (folder / 'rows.json').write_text(json.dumps(data, indent=2))
        return data

    instrument('ui-seed'); root = launch(); screenshot('two-alarms')
    before = rows('before-edit')
    tap(find(root, LABEL_A)); root = snapshot('edit-alarm')
    editor = find(root, resource=PKG + ':id/edit_alarm')
    tap(editor)
    adb('shell', 'input', 'keyevent', 'KEYCODE_MOVE_END')
    adb('shell', 'input', 'text', '%sedited')
    # Hide IME before selecting a potentially covered dialog button.
    ime = adb('shell', 'dumpsys', 'input_method')
    if 'mInputShown=true' in ime: adb('shell', 'input', 'keyevent', 'KEYCODE_BACK')
    root = snapshot('edited-label'); tap(find(root, 'OK'))
    # A fresh fixture can show the original recurring-alarm warning once.
    root = snapshot('after-save')
    if any(n.get('text') == 'OK' and n.get('visible') == 'true' for n in root.iter('node')):
        tap(find(root, 'OK')); root = snapshot('after-warning')
    find(root, LABEL_A + ' edited'); screenshot('label-saved')
    saved = rows('after-edit')
    expected = dict(before[910014]); expected['label'] = LABEL_A + ' edited'
    assert saved[910014] == expected, 'Native label save changed unrelated alarm fields'
    assert {k: v for k, v in before.items() if k != 910014} == {k: v for k, v in saved.items() if k != 910014}

    label = find(root, LABEL_B)
    parents = {child: parent for parent in root.iter() for child in parent}
    parent = parents[label]
    switches = [n for n in parent.iter('node') if n.get('resource-id') == PKG + ':id/alarm_switch']
    assert len(switches) == 1 and switches[0].get('checked') == 'true'
    tap(switches[0]); root = snapshot('disabled-B'); screenshot('disabled-B')
    instrument('ui-disabled')
    root = launch(); tap(find(root, LABEL_A + ' edited'), hold=True)
    root = snapshot('selected-A'); tap(find(root, resource=PKG + ':id/cab_delete'))
    root = snapshot('deleted-A'); screenshot('deleted-A')
    assert not any(n.get('text') == LABEL_A + ' edited' for n in root.iter('node'))
    find(root, LABEL_B)
    adb('shell', 'am', 'force-stop', PKG)
    root = launch(); find(root, LABEL_B)
    after = rows('after-restart')
    assert 910014 not in after and after[910015]['is_enabled'] == 0
    assert {k: v for k, v in before.items() if k not in (910014, 910015)} == {k: v for k, v in after.items() if k not in (910014, 910015)}
    instrument('ui-check')
    logs = adb('logcat', '-d', '-v', 'threadtime'); assert marker in logs
    logs = logs.split(marker, 1)[1]; (out / 'logcat.txt').write_text(logs)
    assert not re.search(r'FATAL EXCEPTION|VerifyError|NoSuchMethodError|NoSuchFieldError|IllegalAccessError', logs)
    (out / 'summary.json').write_text(json.dumps(dict(outcome='PASS', patchedSha256=sha,
        editedLabelOnly=True, disabledOnlyB=True, deletedOnlyA=True, restartRetainedState=True), indent=2) + '\n')
    print('PASS: native label edit/save, per-row disable, delete and restart', flush=True)


if __name__ == '__main__': main()
