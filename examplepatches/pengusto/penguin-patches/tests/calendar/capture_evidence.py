#!/usr/bin/env python3
"""Capture raw #381 before/after screenshots on the owned disposable emulator.

Uses previously verified APKs with the same disposable test signature. Opens
unsaved synthetic drafts only; never clears data, saves events or publishes.
"""
import argparse
import base64
import hashlib
import json
import os
import re
import shlex
import sqlite3
import subprocess
import time
import xml.etree.ElementTree as ET
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PKG = 'org.fossify.calendar'
DATA = '/data/user/0/' + PKG
ORIGINAL_SHA = 'd43b2df05d5702bea760a7ab03402977ba72e446e5932038efbdab248a5de987'
OFFICIAL_CERT = 'affdb124d3f4720c2f98dbca9eacba0514fba4306e20a2786c861c3c0d6ff292'
TITLE = 'All-day reminder example'


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ('sdk', 'java-home', 'original', 'baseline', 'patched',
                 'acceptance-artifacts', 'artifacts'):
        p.add_argument('--' + name, type=Path, required=True)
    for name in ('serial', 'avd-name'):
        p.add_argument('--' + name, required=True)
    p.add_argument('--disposable-emulator', action='store_true', required=True)
    a = p.parse_args()
    out = a.artifacts.resolve()
    assert a.serial.startswith('emulator-') and out.is_relative_to(ROOT / '.scratch')
    out.mkdir(parents=True, exist_ok=True)
    (out / 'summary.json').unlink(missing_ok=True)
    env = dict(os.environ, JAVA_HOME=str(a.java_home.resolve()))
    tools = a.sdk / 'build-tools/36.0.0'

    def run(*args):
        return subprocess.run(list(map(str, args)), env=env, capture_output=True,
                              check=True, timeout=60).stdout

    def adb(*args, binary=False):
        data = run(a.sdk / 'platform-tools/adb', '-s', a.serial, *args)
        return data if binary else data.decode()

    def sha(path): return hashlib.sha256(path.read_bytes()).hexdigest()

    def cert(apk):
        return re.search(r'certificate SHA-256 digest: (\w+)',
                         run(tools / 'apksigner', 'verify', '--print-certs', apk).decode())[1]

    def payload(apk):
        with zipfile.ZipFile(apk) as z:
            return {n: z.read(n) for n in z.namelist()
                    if not n.startswith('META-INF/') and not n.endswith('/')}

    proof = json.loads((a.acceptance_artifacts / 'combined-summary.json').read_text())
    assert proof['outcome'] == 'PASS' and proof['html'] is True
    assert sha(a.original) == ORIGINAL_SHA == proof['originalSha256']
    assert cert(a.original) == OFFICIAL_CERT
    assert payload(a.original) == payload(a.baseline), 'Baseline must retain official payload'
    assert sha(a.patched) == proof['patchedSha256']
    assert cert(a.baseline) == cert(a.patched) == proof['certificate'] != OFFICIAL_CERT
    for apk in (a.original, a.baseline, a.patched):
        info = run(tools / 'aapt2', 'dump', 'badging', apk).decode()
        assert "name='org.fossify.calendar'" in info and "versionName='1.12.0'" in info
        assert "versionCode='23'" in info
    assert adb('emu', 'avd', 'name').splitlines()[0] == a.avd_name
    assert adb('shell', 'getprop', 'ro.hardware').strip() == 'ranchu'
    assert adb('shell', 'getprop', 'ro.kernel.qemu').strip() == '1'
    assert adb('shell', 'getprop', 'sys.boot_completed').strip() == '1'
    assert 'uid=0' in adb('shell', 'su', '0', 'id')
    installed = adb('shell', 'pm', 'path', PKG).strip().removeprefix('package:')
    assert adb('shell', 'su', '0', 'sha256sum', installed).split()[0] in {sha(a.baseline), sha(a.patched)}
    height = int(re.search(r'\d+x(\d+)', adb('shell', 'wm', 'size'))[1])

    def stop(): adb('shell', 'am', 'force-stop', PKG)

    def state(label):
        stop()
        folder = out / label
        folder.mkdir(exist_ok=True)
        result = dict(databases={}, preferences={})
        for directory in ('databases', 'shared_prefs'):
            names = adb('shell', 'su', '0', 'ls', DATA + '/' + directory).split()
            for name in names:
                (folder / name).write_bytes(adb('exec-out', 'su', '0', 'cat',
                    DATA + '/' + directory + '/' + name, binary=True))
                if directory == 'shared_prefs':
                    result['preferences'][name] = sorted(ET.tostring(n).decode()
                        for n in ET.parse(folder / name).getroot())
            if directory == 'databases':
                for name in names:
                    if not name.endswith('.db'): continue
                    with sqlite3.connect(folder / name) as db:
                        tables = db.execute("SELECT name FROM sqlite_master WHERE type='table' ORDER BY name").fetchall()
                        result['databases'][name] = {table: sorted(db.execute(
                            'SELECT * FROM "' + table.replace('"', '""') + '"').fetchall(), key=repr)
                            for (table,) in tables}
        return result

    def snapshot(label):
        output = adb('shell', 'am', 'instrument', '-w', '-r',
            'io.github.pengusto.patches.clock.ui/io.github.pengusto.patches.clock.ui.UiSnapshot')
        assert 'INSTRUMENTATION_CODE: -1' in output, output
        xml = base64.b64decode(re.search(r'xml=(.*)', output)[1])
        root = ET.fromstring(xml)
        assert root.get('package') == PKG, 'Unexpected foreground surface'
        (out / (label + '.xml')).write_bytes(xml)
        return root

    def bounds(n): return list(map(int, re.findall(r'-?\d+', n.get('bounds'))))

    def visible(root, id=None, text=None):
        found = []
        for n in root.iter('node'):
            x, y, X, Y = bounds(n)
            if n.get('visible') != 'true' or not (0 <= y < Y <= height - 80 and X > x): continue
            if id is not None and n.get('resource-id') != PKG + ':id/' + id: continue
            if text is not None and n.get('text') != text: continue
            found.append(n)
        return found

    def capture(label):
        (out / (label + '.png')).write_bytes(adb('exec-out', 'screencap', '-p', binary=True))
        print('Captured ' + label, flush=True)

    def event(label, all_day, expected):
        stop()
        adb('shell', 'am', 'start', '-W', '-a', 'android.intent.action.INSERT',
            '-n', PKG + '/.activities.EventActivity', '--ez', 'allDay', str(all_day).lower(),
            '--el', 'beginTime', '1793534400000', '--el', 'endTime', '1793538000000',
            '--es', 'title', shlex.quote(TITLE))
        time.sleep(.8)
        # A fresh timed editor focuses the title and can open the IME. Dismiss
        # only an actually shown keyboard before reading/tapping editor rows.
        ime = adb('shell', 'dumpsys', 'input_method')
        if re.search(r'mInputShown=true|isInputViewShown=true', ime):
            adb('shell', 'input', 'keyevent', 'KEYCODE_BACK')
            time.sleep(.3)
        assert not re.search(r'mInputShown=true|isInputViewShown=true',
                             adb('shell', 'dumpsys', 'input_method')), 'IME obscures editor'
        root = snapshot(label)
        assert len(visible(root, text=TITLE)) == 1, 'Same synthetic draft title required'
        switch = visible(root, id='event_all_day')
        assert len(switch) == 1 and switch[0].get('checked') == str(all_day).lower()
        for i, text in enumerate(expected, 1):
            found = visible(root, id='event_reminder_' + str(i))
            assert len(found) == 1 and found[0].get('text') == text, (label, i, text, [n.attrib for n in found])
        capture(label)
        return root

    initial = state('initial')
    assert 'Penguin381' in repr(initial['databases']), 'Owned synthetic fixture required'
    prefs = ET.parse(out / 'initial/Prefs.xml').getroot()
    values = {n.get('name'): n.get('value') for n in prefs}
    assert values['use_previous_event_reminders'] == 'false'
    assert [values['default_reminder_' + str(i)] for i in (1, 2, 3)] == ['30', '120', '-1']
    day = ET.parse(out / 'initial/penguin_calendar_all_day.xml').getroot()
    day_values = {n.get('name'): n.get('value') for n in day}
    assert [day_values['reminder_' + str(i)] for i in range(3)] == ['360', '1440', '0']
    marker = 'Penguin381Evidence-' + str(time.time_ns())
    adb('shell', 'log', '-t', 'Penguin381Evidence', marker)
    try:
        adb('shell', 'cmd', 'statusbar', 'collapse')
        adb('install', '-r', a.baseline)
        assert state('baseline-update') == initial, 'Baseline update changed data/preferences'
        before = event('before', True, ['30 minutes before', '2 hours before', 'Add another reminder'])
        assert state('after-baseline') == initial, 'Unsaved original draft changed data/preferences'
        adb('install', '-r', a.patched)
        assert state('patched-update') == initial, 'Patched update changed data/preferences'
        after = event('after', True, ['6 hours before', '1 day before', 'At start'])
        # Compare actual event/date fields as well as the common title/all-day state.
        for id in ('event_start_date', 'event_end_date'):
            left, right = visible(before, id=id), visible(after, id=id)
            assert len(left) == len(right) == 1 and left[0].get('text') == right[0].get('text')
        event('timed', False, ['30 minutes before', '2 hours before', 'Add another reminder'])
        stop()
        adb('shell', 'su', '0', 'am', 'start', '-W', '-n', PKG + '/.activities.SettingsActivity')
        time.sleep(.5)
        for i in range(24):
            root = snapshot('settings-scroll-' + str(i))
            if visible(root, text='All-day reminder 3: At start'):
                assert visible(root, text='All-day reminder 1: 6 hours before')
                assert visible(root, text='All-day reminder 2: 1 day before')
                capture('settings')
                break
            adb('shell', 'input', 'swipe', 550, 1600, 550, 1100, 900)
            time.sleep(.2)
        else: raise AssertionError('No visible all-day settings')
        assert state('after-capture') == initial, 'Screenshots changed saved data/preferences'
    finally:
        stop()
        adb('install', '-r', a.patched)
        stop()
    assert state('final') == initial, 'Final state differs from fixture'
    logs = adb('logcat', '-d', '-v', 'threadtime')
    assert marker in logs
    logs = logs.split(marker, 1)[1]
    (out / 'logcat.txt').write_text(logs)
    assert not re.search(r'FATAL EXCEPTION|VerifyError|NoSuchMethodError|NoSuchFieldError|IllegalAccessError', logs)
    summary = dict(outcome='PASS', originalSha256=sha(a.original), baselineSha256=sha(a.baseline),
        patchedSha256=sha(a.patched), certificate=proof['certificate'],
        sameSyntheticTitleAndDates=True, originalAllDayUsesTimedDefaults=True,
        patchedAllDayUsesSeparateDefaults=True, timedDefaultsUnchanged=True,
        sameKeyUpdatesRetainedDataAndPreferences=True, unsavedDraftsRetainedDataAndPreferences=True,
        finalStateUnchanged=True, rawNativeScreenshots=True,
        screenshots={n: sha(out / (n + '.png')) for n in ('before', 'after', 'settings', 'timed')})
    (out / 'summary.json').write_text(json.dumps(summary, indent=2) + '\n')
    print(json.dumps(summary, indent=2), flush=True)


if __name__ == '__main__': main()
