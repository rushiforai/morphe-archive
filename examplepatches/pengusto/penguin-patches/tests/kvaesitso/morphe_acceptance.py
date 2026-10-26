#!/usr/bin/env python3
"""Morphe #1504 acceptance on the named disposable, rooted AOSP emulator.

Installs same-key test APKs, seeds synthetic notes, edits test-only settings and
exercises real UI. Never use with real data. No uninstall or force compatibility.
"""
import argparse
import hashlib
import json
import re
import sqlite3
import subprocess
import sys
import time
import uuid
import xml.etree.ElementTree as ET
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PKG = 'de.mm20.launcher2.release'
DATA = '/data/user/0/' + PKG
ORIGINAL_SHA = '55e4a287f1198be22f040c2ad1443f5861b58b1d1394d7377221f1ad4448b810'


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ('adb', 'serial', 'apksigner', 'aapt2'):
        p.add_argument('--' + name, required=True)
    for name in ('original', 'baseline', 'patched', 'artifacts'):
        p.add_argument('--' + name, type=Path, required=True)
    p.add_argument('--disposable-emulator', action='store_true', required=True)
    p.add_argument('--editing-only', action='store_true',
                   help='Reuse the installed patched fixture after navigation acceptance; install nothing')
    a = p.parse_args()
    assert a.serial.startswith('emulator-'), 'Refusing physical device'
    assert hashlib.sha256(a.original.read_bytes()).hexdigest() == ORIGINAL_SHA
    a.artifacts.mkdir(parents=True, exist_ok=True)

    def run(*args, check=True, timeout=60):
        return subprocess.run(list(map(str, args)), capture_output=True, check=check, timeout=timeout)

    def adb(*args, binary=False, check=True):
        r = run(a.adb, '-s', a.serial, *args, check=check)
        return r.stdout if binary else r.stdout.decode()

    assert adb('shell', 'getprop', 'ro.kernel.qemu').strip() == '1'
    assert adb('shell', 'getprop', 'ro.hardware').strip() == 'ranchu'
    assert 'penguin_kvaesitso_api35' in adb('emu', 'avd', 'name'), 'Wrong fixture AVD'
    assert 'uid=0' in adb('shell', 'su', '0', 'id'), 'Rooted test fixture required'

    def certificate(apk):
        out = run(a.apksigner, 'verify', '--print-certs', apk).stdout.decode()
        return re.search(r'certificate SHA-256 digest: (\w+)', out).group(1)

    original_cert = certificate(a.original)
    cert = certificate(a.baseline)
    assert cert == certificate(a.patched) and cert != original_cert, 'Disposable same-key APKs required'
    for apk in (a.baseline, a.patched):
        info = run(a.aapt2, 'dump', 'badging', apk).stdout.decode()
        assert "name='" + PKG + "'" in info and "versionName='1.41.0'" in info
    with zipfile.ZipFile(a.original) as original, zipfile.ZipFile(a.baseline) as baseline:
        for name in original.namelist():
            if not name.startswith('META-INF/') and not name.endswith('/'):
                assert original.read(name) == baseline.read(name), 'Baseline code/resources changed: ' + name

    def stop():
        adb('shell', 'am', 'force-stop', PKG)

    def restart():
        stop()
        adb('shell', 'am', 'start', '-W', '-a', 'android.intent.action.MAIN',
            '-c', 'android.intent.category.HOME', '-p', PKG)
        dump('restart-ready')

    def read_settings():
        stop()
        return json.loads(adb('exec-out', 'su', '0', 'cat', DATA + '/files/datastore/settings.json'))

    def write_settings(value):
        stop()
        path = a.artifacts / 'fixture-settings.json'
        path.write_text(json.dumps(value))
        adb('push', path, '/data/local/tmp/penguin-kvaesitso-settings.json')
        adb('shell', 'su', '0', 'cp', '/data/local/tmp/penguin-kvaesitso-settings.json',
            DATA + '/files/datastore/settings.json')

    def database(label):
        stop()
        folder = a.artifacts / label
        folder.mkdir(exist_ok=True)
        for suffix in ('', '-wal', '-shm'):
            (folder / ('room' + suffix)).unlink(missing_ok=True)
            r = run(a.adb, '-s', a.serial, 'exec-out', 'su', '0', 'cat', DATA + '/databases/room' + suffix, check=False)
            if r.returncode == 0:
                (folder / ('room' + suffix)).write_bytes(r.stdout)
        db = sqlite3.connect(folder / 'room')
        values = db.execute('SELECT id,type,config,position,parentId FROM Widget ORDER BY id').fetchall()
        db.close()
        rows = [[v.hex() if isinstance(v, bytes) else v for v in row] for row in values]
        (folder / 'widgets.json').write_text(json.dumps(rows, indent=2))
        return rows

    def dump(label):
        for _ in range(4):
            adb('shell', 'rm', '-f', '/sdcard/penguin-kvaesitso-acceptance.xml')
            result = adb('shell', 'uiautomator', 'dump', '/sdcard/penguin-kvaesitso-acceptance.xml')
            if 'dumped to:' in result:
                text = adb('shell', 'cat', '/sdcard/penguin-kvaesitso-acceptance.xml')
                root = ET.fromstring(text)
                if any(n.get('package') == PKG for n in root.iter('node')):
                    (a.artifacts / (label + '.xml')).write_text(text)
                    return root
            time.sleep(.4)
        raise AssertionError('No fresh UI from target package')

    def find(root, label):
        matches = [n for n in root.iter('node') if label in (n.get('text'), n.get('content-desc'))]
        if label == 'More actions':
            # A note has its own overflow. This fixture uses a top search bar.
            matches.sort(key=lambda n: int(re.findall(r'\d+', n.get('bounds'))[1]))
        return next(iter(matches), None)

    def click(label):
        n = find(dump('before-' + label), label)
        assert n is not None, 'Missing UI: ' + label
        x, y, X, Y = map(int, re.findall(r'\d+', n.get('bounds')))
        adb('shell', 'input', 'tap', (x + X) // 2, (y + Y) // 2)
        time.sleep(.4)

    def regression(label, button='hidden', layout='separate', start='home', expected_failure=False):
        cmd = [sys.executable, ROOT / 'tests/kvaesitso/menu_regression.py', '--adb', a.adb,
               '--serial', a.serial, '--package', PKG, '--button', button, '--layout', layout,
               '--start-page', start, '--artifacts', a.artifacts / label]
        result = run(*cmd, check=False, timeout=300)
        output = result.stdout.decode() + result.stderr.decode()
        (a.artifacts / (label + '.log')).write_text(output)
        if expected_failure:
            assert result.returncode != 0 and 'FAIL #1504' in output and 'Verified edit button preference: hidden' in output, output
            print('PASS: official baseline reproduces #1504', flush=True)
        else:
            assert result.returncode == 0 and 'PASS:' in output, output
            print(output.strip(), flush=True)

    def editing():
        def content(row):
            # The native editor serializes default config NULL as {} and
            # compacts JSON whitespace when saving reordered widgets.
            return row[:2], json.loads(row[2] or '{}'), row[4:]

        installed = adb('shell', 'pm', 'path', PKG).strip().removeprefix('package:')
        digest = adb('shell', 'su', '0', 'sha256sum', installed).split()[0]
        assert digest == hashlib.sha256(a.patched.read_bytes()).hexdigest(), 'Wrong installed APK'
        original = database('editing-before')
        note = next(r for r in original if 'Penguin1504MorpheOne' in (r[2] or ''))
        media = next(r for r in original if r[1] == 'music' and r[4] == note[4])
        assert note[3] > 0, 'Requires the prepared, unreordered note fixture'
        settings = read_settings()
        assert settings['widgetsEditButton'] is False and settings['homeScreenWidgets'] is False

        restart()
        click('More actions')
        click('Edit widgets')
        root = dump('before-drag')
        n, first = find(root, 'Note'), find(root, 'Weather')
        assert n is not None and first is not None, 'Prepared widgets are not visible'
        x, y, X, Y = map(int, re.findall(r'\d+', n.get('bounds')))
        _, fy, _, fY = map(int, re.findall(r'\d+', first.get('bounds')))
        adb('shell', 'input', 'swipe', x - 50, (y + Y) // 2, x - 50, max(300, fy - 100), 1500)
        time.sleep(.8)
        dump('after-drag')
        click('Done')
        moved = database('editing-reordered')
        same_page = sorted((r for r in moved if r[4] == note[4]), key=lambda r: r[3])
        assert same_page[0][0] == note[0], 'Drag did not persist the first position'
        assert {r[0] for r in original} == {r[0] for r in moved}, 'Reorder changed widget identities'
        for row in moved:
            before = next(r for r in original if r[0] == row[0])
            assert content(row) == content(before), 'Reorder changed widget content'
        print('PASS: real drag/reorder persists; all widget identities and contents retained', flush=True)

        restart()
        click('More actions')
        click('Edit widgets')
        root = dump('before-remove')
        n = find(root, 'Media')
        assert n is not None, 'Media fixture missing'
        parents = {child: parent for parent in root.iter() for child in parent}
        while n in parents:
            n = parents[n]
            removes = [s for s in n.iter('node') if s.get('content-desc') == 'Remove']
            if removes:
                assert len(removes) == 1, 'Ambiguous remove control'
                x, y, X, Y = map(int, re.findall(r'\d+', removes[0].get('bounds')))
                adb('shell', 'input', 'tap', (x + X) // 2, (y + Y) // 2)
                break
        else:
            raise AssertionError('Media remove control missing')
        time.sleep(.5)
        click('Done')
        removed = database('editing-removed')
        assert {r[0] for r in removed} == {r[0] for r in moved} - {media[0]}, 'Removed the wrong widget'
        for row in removed:
            before = next(r for r in moved if r[0] == row[0])
            assert content(row) == content(before), 'Removal changed unrelated content'

        restart()
        click('More actions')
        click('Edit widgets')
        click('Add widget')
        dump('picker-before-hide-ime')
        # The picker focuses search and opens the IME. UIAutomator still lists
        # rows covered by the keyboard, so their bounds alone are insufficient.
        for attempt in range(4):
            ime = adb('shell', 'dumpsys', 'input_method')
            # mIsInputViewShown belongs to the IME service's cached view and can
            # stay true after its window hides. Use the manager's request flag.
            if 'mInputShown=true' not in ime:
                break
            adb('shell', 'input', 'keyevent', 'KEYCODE_BACK')
            time.sleep(.4)
        else:
            raise AssertionError('Picker keyboard did not close')
        # The sheet also exposes editor nodes behind it. Select the note below
        # the sheet handle and wait for its entrance animation to settle.
        previous = None
        for attempt in range(6):
            picker = dump('widget-picker-' + str(attempt))
            handle = find(picker, 'Drag handle')
            assert handle is not None and find(picker, 'Apps') is not None, 'Widget picker did not open'
            bottom = int(re.findall(r'\d+', handle.get('bounds'))[3])
            choices = [n for n in picker.iter('node') if n.get('text') == 'Note'
                       and int(re.findall(r'\d+', n.get('bounds'))[1]) > bottom]
            assert len(choices) == 1, 'Ambiguous built-in Note picker row'
            bounds = choices[0].get('bounds')
            if bounds == previous:
                break
            previous = bounds
        else:
            raise AssertionError('Widget picker did not settle')
        x, y, X, Y = map(int, re.findall(r'\d+', bounds))
        adb('shell', 'input', 'tap', (x + X) // 2, (y + Y) // 2)
        for attempt in range(5):
            editor = dump('after-add-' + str(attempt))
            if find(editor, 'Drag handle') is None:
                break
        else:
            raise AssertionError('Picker did not return to editor')
        assert find(editor, 'Done') is not None, 'Editor missing after selection'
        click('Done')
        added = database('editing-added')
        extra = [r for r in added if r[0] not in {v[0] for v in removed}]
        assert len(extra) == 1 and extra[0][1] == 'notes' and extra[0][4] == note[4], 'Wrong added widget/page'
        assert len(added) == len(removed) + 1
        for row in removed:
            after = next(r for r in added if r[0] == row[0])
            assert content(after) == content(row), 'Adding changed existing content'
        print('PASS: built-in Note added through the real widget picker; existing contents retained', flush=True)
        assert read_settings() == settings, 'Editing changed user settings'
        restart()
        adb('shell', 'input', 'swipe', 540, 1800, 540, 800, 350)
        time.sleep(.5)
        assert find(dump('note-after-restart'), 'Penguin1504MorpheOne') is not None
        assert database('editing-after-restart') == added, 'Restart changed saved widget rows'
        print('PASS: only selected Media widget removed; note and settings survive process restart', flush=True)
        restart()
        crashes = adb('logcat', '-b', 'crash', '-d')
        (a.artifacts / 'editing-crash.log').write_text(crashes)
        assert 'FATAL EXCEPTION' not in crashes and 'Fatal signal' not in crashes, crashes
        (a.artifacts / 'editing-summary.json').write_text(json.dumps({'result': 'passed',
            'reordered_widget': note[0], 'removed_widget': media[0], 'added_widget': extra[0][0]}, indent=2))

    if a.editing_only:
        editing()
        return

    adb('install', '-r', a.baseline)
    regression('original-repro', expected_failure=True)
    # Seed two distinguishable notes into this disposable baseline Room fixture.
    database('seed')
    db = sqlite3.connect(a.artifacts / 'seed/room')
    parent = db.execute('SELECT parentId FROM Widget LIMIT 1').fetchone()[0]
    markers = ('Penguin1504MorpheOne', 'Penguin1504MorpheTwo')
    for i, text in enumerate(markers, 1):
        parent_id = uuid.UUID(int=i)
        parent_value = parent_id.bytes if isinstance(parent, bytes) else str(parent_id)
        if db.execute('SELECT 1 FROM Widget WHERE config LIKE ?', ('%' + text + '%',)).fetchone() is None:
            db.execute('INSERT INTO Widget(id,type,config,position,parentId) VALUES(?,?,?,?,?)',
                       (uuid.uuid4().bytes, 'notes', json.dumps({'storedText': text}), 3, parent_value))
    db.commit()
    db.execute('PRAGMA wal_checkpoint(TRUNCATE)')
    db.close()
    adb('push', a.artifacts / 'seed/room', '/data/local/tmp/penguin-kvaesitso-room')
    adb('shell', 'su', '0', 'cp', '/data/local/tmp/penguin-kvaesitso-room', DATA + '/databases/room')
    for suffix in ('-wal', '-shm'):
        adb('shell', 'su', '0', 'rm', '-f', DATA + '/databases/room' + suffix)
    before = database('before-update')
    settings_before = read_settings()
    (a.artifacts / 'settings-before-update.json').write_text(json.dumps(settings_before, indent=2))
    adb('logcat', '-b', 'crash', '-c')
    adb('install', '-r', a.patched)
    assert database('after-update') == before, 'Widget records changed during update'
    assert read_settings() == settings_before, 'Settings changed during update'
    print('PASS: same-package, same-key update preserves every widget row and setting', flush=True)

    for label, button, layout, start in [
        ('hidden-home', 'hidden', 'separate', 'home'),
        ('hidden-widget-page', 'hidden', 'separate', 'widgets'),
        ('hidden-search', 'hidden', 'separate', 'search'),
        ('visible-button', 'visible', 'separate', 'home'),
        ('combined-home', 'hidden', 'home', 'home'),
    ]:
        regression(label, button, layout, start)

    fixture = read_settings()
    fixture['homeScreenWidgets'] = False
    fixture['widgetsEditButton'] = False
    gesture_keys = [k for k in fixture if k.startswith('gestures')]
    for key in gesture_keys:
        fixture[key] = {'type': 'no_action'}
    # Test fallback navigation through a different swipe, a tap and Home button.
    for key in ('gesturesSwipeRight', 'gesturesLongPress', 'gesturesHomeButton'):
        case = dict(fixture)
        case[key] = {'type': 'widgets', 'target': 'Widgets1'}
        write_settings(case)
        regression(key)
    write_settings(fixture)
    restart()
    click('More actions')
    assert find(dump('no-widget-destination'), 'Edit widgets') is None, 'Dead action without widget destination'
    print('PASS: no dead menu action without a configured widget destination', flush=True)

    # The current widget page takes precedence over the first configured page.
    case = dict(fixture)
    case.update(widgetScreenCount=2,
                gesturesSwipeUp={'type': 'widgets', 'target': 'Widgets1'},
                gesturesSwipeRight={'type': 'widgets', 'target': 'Widgets2'})
    write_settings(case)
    restart()
    adb('shell', 'input', 'swipe', 200, 1200, 900, 1200, 350)
    time.sleep(.5)
    assert find(dump('second-page-before-edit'), markers[1]) is not None, 'Gesture did not open the second page'
    click('More actions')
    click('Edit widgets')
    page = dump('second-page-editor')
    # The existing editor shows type titles, not note contents. Page two has
    # only the seeded note; page one also has Weather/Media/Calendar.
    assert find(page, 'Done') is not None and find(page, 'Note') is not None, 'Wrong widget page selected'
    assert find(page, 'Weather') is None, 'Fell back to the first widget page'
    click('Done')
    assert find(dump('second-page-after-edit'), markers[1]) is not None, 'Editor returned to the wrong page'
    print('PASS: edit action targets the current second widget page', flush=True)

    # Restore the normal test layout and verify data survived every navigation case.
    settings_before['homeScreenWidgets'] = False
    settings_before['widgetsEditButton'] = False
    write_settings(settings_before)
    assert database('after-navigation') == before, 'Navigation changed stored widgets'
    restart()
    crashes = adb('logcat', '-b', 'crash', '-d')
    (a.artifacts / 'crash.log').write_text(crashes)
    assert 'FATAL EXCEPTION' not in crashes and 'Fatal signal' not in crashes, crashes
    print('PASS: widget records intact after navigation; no fatal exception', flush=True)
    (a.artifacts / 'summary.json').write_text(json.dumps({'result': 'passed', 'test_certificate_sha256': cert,
        'original_sha256': ORIGINAL_SHA, 'patched_sha256': hashlib.sha256(a.patched.read_bytes()).hexdigest()}, indent=2))
    editing()


if __name__ == '__main__':
    main()
