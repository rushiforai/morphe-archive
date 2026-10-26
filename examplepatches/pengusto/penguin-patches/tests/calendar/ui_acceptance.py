#!/usr/bin/env python3
"""Exercise Calendar #381 settings and draft restoration through visible Android UI.

Requires the independent UiSnapshot driver from tests/clock, installed on the
same named disposable AVD. Installs nothing and does not clear app data.
"""
import argparse
import base64
import hashlib
import json
import re
import sqlite3
import subprocess
import time
import xml.etree.ElementTree as ET
from pathlib import Path

PKG = 'org.fossify.calendar'
ROOT = Path(__file__).resolve().parents[2]


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ('adb', 'serial', 'avd-name'):
        p.add_argument('--' + name, required=True)
    for name in ('patched', 'artifacts'):
        p.add_argument('--' + name, required=True, type=Path)
    p.add_argument('--disposable-emulator', action='store_true', required=True)
    a = p.parse_args(); a.artifacts.mkdir(parents=True, exist_ok=True)
    assert a.serial.startswith('emulator-') and a.artifacts.resolve().is_relative_to(ROOT / '.scratch')
    count = 0
    draft_title = 'Penguin381VisibleDraft-' + str(time.time_ns())

    def adb(*args, binary=False):
        output = subprocess.check_output([a.adb, '-s', a.serial, *map(str, args)], timeout=50)
        return output if binary else output.decode()

    assert adb('emu', 'avd', 'name').splitlines()[0] == a.avd_name
    assert adb('shell', 'getprop', 'ro.hardware').strip() == 'ranchu'
    assert 'uid=0' in adb('shell', 'su', '0', 'id')
    path = adb('shell', 'pm', 'path', PKG).strip().removeprefix('package:')
    assert adb('shell', 'su', '0', 'sha256sum', path).split()[0] == hashlib.sha256(a.patched.read_bytes()).hexdigest()
    height = int(re.search(r'\d+x(\d+)', adb('shell', 'wm', 'size'))[1])

    def check(value, message):
        nonlocal count
        assert value, message
        count += 1

    def dump(label):
        output = adb('shell', 'am', 'instrument', '-w', '-r',
            'io.github.pengusto.patches.clock.ui/io.github.pengusto.patches.clock.ui.UiSnapshot')
        check('INSTRUMENTATION_CODE: -1' in output, 'Fresh snapshot unavailable: ' + output)
        text = base64.b64decode(re.search(r'xml=(.*)', output)[1]).decode()
        root = ET.fromstring(text)
        (a.artifacts / (label + '.xml')).write_text(text)
        return root

    def bounds(node): return list(map(int, re.findall(r'-?\d+', node.get('bounds'))))

    def nodes(root, text=None, id=None, starts=None, cls=None):
        result = []
        for n in root.iter('node'):
            if n.get('visible') != 'true': continue
            x, y, X, Y = bounds(n)
            if not (0 <= y < Y <= height - 80 and X > x): continue
            if text is not None and n.get('text') != text and n.get('content-desc') != text: continue
            if starts is not None and not n.get('text', '').startswith(starts): continue
            if id is not None and n.get('resource-id') != PKG + ':id/' + id: continue
            if cls is not None and n.get('class') != cls: continue
            result.append(n)
        return result

    def tap(node):
        x, y, X, Y = bounds(node)
        adb('shell', 'input', 'tap', (x + X) // 2, (y + Y) // 2)
        time.sleep(.3)

    def click(label, **match):
        matches = nodes(dump(label), **match)
        check(len(matches) == 1, 'Ambiguous/unreachable UI ' + repr(match) + ': ' + str(len(matches)))
        tap(matches[0])

    def scroll_to(prefix):
        for i in range(22):
            root = dump('scroll-' + str(i))
            found = nodes(root, starts=prefix)
            if found: return found[0]
            target = next((n for n in root.iter('node') if n.get('text', '').startswith(prefix)), None)
            above = target is not None and bounds(target)[3] < 350
            # Slow, short drags avoid flinging past the narrow defaults section.
            adb('shell', 'input', 'swipe', 550, 1100 if above else 1600, 550, 1600 if above else 1100, 900)
            time.sleep(.2)
        raise AssertionError('No reachable row: ' + prefix)

    def settings():
        adb('shell', 'am', 'force-stop', PKG)
        adb('shell', 'su', '0', 'am', 'start', '-W', '-n', PKG + '/.activities.SettingsActivity')
        time.sleep(.5)
        scroll_to('All-day reminder 1:')

    def screenshot(name):
        (a.artifacts / (name + '.png')).write_bytes(adb('exec-out', 'screencap', '-p', binary=True))

    def pref(index):
        root = ET.fromstring(adb('exec-out', 'su', '0', 'cat', '/data/user/0/' + PKG + '/shared_prefs/penguin_calendar_all_day.xml'))
        return next(int(n.get('value')) for n in root if n.get('name') == 'reminder_' + str(index))

    def choose(index, label):
        tap(scroll_to('All-day reminder ' + str(index + 1) + ':'))
        click('choose-' + str(index), text=label)

    settings()
    choose(0, '6 hours before'); time.sleep(.3)
    check(pref(0) == 360, 'UI preset saved six hours')
    choose(1, '1 day before'); check(pref(1) == 1440, 'Second default independent')
    choose(2, 'At start'); check(pref(2) == 0, 'Third default accepts at-start')
    screenshot('settings-three-reminders')
    choose(0, 'Custom minutes…')
    click('custom-input', cls='android.widget.EditText')
    adb('shell', 'input', 'keyevent', 'KEYCODE_MOVE_END')
    # Select the entire current numeric value using the standard edit shortcut.
    adb('shell', 'input', 'keycombination', '113', '29')
    adb('shell', 'input', 'text', '9999999')
    click('invalid-custom', text='OK')
    check(bool(nodes(dump('invalid-still-open'), cls='android.widget.EditText')), 'Out-of-range input keeps dialog open')
    check(pref(0) == 360, 'Invalid custom input did not save')
    click('correct-custom-input', cls='android.widget.EditText')
    adb('shell', 'input', 'keycombination', '113', '29')
    adb('shell', 'input', 'text', '90')
    click('valid-custom', text='OK'); time.sleep(.3)
    check(pref(0) == 90, 'Valid custom minutes persisted')
    choose(0, 'Custom minutes…'); click('cancel-custom', text='CANCEL')
    check(pref(0) == 90, 'Cancel keeps previous custom default')
    choose(0, '6 hours before')
    settings()
    check(pref(0) == 360 and pref(1) == 1440 and pref(2) == 0, 'Settings survive process restart')
    screenshot('settings-after-restart')

    def event(day):
        adb('shell', 'am', 'force-stop', PKG)
        adb('shell', 'am', 'start', '-W', '-a', 'android.intent.action.INSERT',
            '-n', PKG + '/.activities.EventActivity', '--ez', 'allDay', str(day).lower(),
            '--el', 'beginTime', '1793534400000', '--el', 'endTime', '1793538000000',
            '--es', 'title', draft_title)
        time.sleep(.8)

    def reminder(label):
        root = dump(label)
        match = nodes(root, id='event_reminder_1')
        check(len(match) == 1, 'Visible first reminder')
        return match[0].get('text')

    event(False); check(reminder('timed-draft') == '30 minutes before', 'Timed default unchanged')
    click('toggle-day', id='event_all_day'); check(reminder('all-day-draft') == '6 hours before', 'New all-day default applied through native switch')
    screenshot('all-day-three-reminders')
    click('toggle-timed', id='event_all_day'); check(reminder('timed-return') == '30 minutes before', 'Timed draft restored')
    click('toggle-day-again', id='event_all_day'); check(reminder('all-day-return') == '6 hours before', 'All-day draft restored')

    # Backgrounding saves Activity state. am kill preserves the task (force-stop would discard it).
    pid = adb('shell', 'pidof', PKG).strip()
    adb('shell', 'input', 'keyevent', 'KEYCODE_HOME'); time.sleep(.6)
    adb('shell', 'am', 'kill', PKG); time.sleep(.8)
    processes = adb('shell', 'ps', '-A', '-o', 'PID,NAME')
    check(not any(line.split()[-1:] == [PKG] for line in processes.splitlines()), 'Background process actually killed')
    # Bring the existing task forward via Recents; do not launch a replacement draft.
    adb('shell', 'input', 'keyevent', 'KEYCODE_APP_SWITCH'); time.sleep(.5)
    root = dump('recents')
    candidates = [n for n in root.iter('node') if n.get('visible') == 'true'
                  and n.get('content-desc', '').startswith('Calendar ')
                  and n.get('resource-id') == 'com.android.launcher3:id/task']
    check(bool(candidates), 'Calendar task in Recents')
    tap(candidates[0]); time.sleep(1)
    check(adb('shell', 'pidof', PKG).strip() != pid, 'Actual process restart')
    check(reminder('process-restored-day') == '6 hours before', 'All-day draft survives process death')
    click('restored-toggle-timed', id='event_all_day'); check(reminder('process-restored-timed') == '30 minutes before', 'Other draft mode survives process death')
    screenshot('restored-draft')
    click('restored-toggle-day-save', id='event_all_day')
    check(reminder('process-restored-before-save') == '6 hours before', 'Restored all-day values before native save')
    check(bool(nodes(dump('restored-title'), text=draft_title)), 'Native title survives process death')
    click('save-restored-draft', id='save')
    time.sleep(1)
    adb('shell', 'am', 'force-stop', PKG)
    database = a.artifacts / 'saved-after-process-death'
    database.mkdir(exist_ok=True)
    for name in adb('shell', 'su', '0', 'ls', '/data/user/0/' + PKG + '/databases').split():
        (database / name).write_bytes(adb('exec-out', 'su', '0', 'cat', '/data/user/0/' + PKG + '/databases/' + name, binary=True))
    with sqlite3.connect(database / 'events.db') as db:
        rows = db.execute('SELECT flags,reminder_1_minutes,reminder_2_minutes,reminder_3_minutes FROM events WHERE title=?', (draft_title,)).fetchall()
    check(len(rows) == 1, 'Exactly one restored event saved by native UI')
    check(rows[0][0] & 1 == 1 and sorted(rows[0][1:]) == [0, 360, 1440], 'Native save after process death preserves all-day and three reminder values')
    summary = dict(outcome='PASS', checks=count, patchedSha256=hashlib.sha256(a.patched.read_bytes()).hexdigest())
    (a.artifacts / 'summary.json').write_text(json.dumps(summary, indent=2) + '\n')
    print(json.dumps(summary, indent=2))


if __name__ == '__main__': main()
