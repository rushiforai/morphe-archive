"""Verify settings navigation preserves the home scroll position; no preferences changed."""
import json
import pathlib
import re
import subprocess
import sys
import time
import xml.etree.ElementTree as ET

serial, package = sys.argv[1:3]
assert serial == 'emulator-5580'
assert re.fullmatch(r'jp\.co\.airfront\.android\.a2chMate\.haiagaru\.(settingsfix191|resumefix226|resumefix242)', package)
adb = 'C:/Users/narum/AppData/Local/Android/Sdk/platform-tools/adb.exe'
version = package[-3:]

def run(*args):
    return subprocess.check_output([adb, '-s', serial, *args])

def snapshot(label):
    time.sleep(.7)
    for attempt in range(3):
        output = run('shell', 'uiautomator', 'dump', '/sdcard/haiagaru-scroll-test.xml')
        if b'dumped to:' in output:
            break
        time.sleep(.7)
    else:
        raise AssertionError('UI hierarchy unavailable')
    data = run('shell', 'cat', '/sdcard/haiagaru-scroll-test.xml')
    pathlib.Path(f'build/settings-scroll-{version}-{label}.xml').write_bytes(data)
    return ET.fromstring(data)

def position(tree, text):
    nodes = [n for n in tree.iter('node') if n.get('text') == text]
    assert len(nodes) == 1, f'{text}: {len(nodes)} matches'
    return tuple(map(int, re.findall(r'\d+', nodes[0].get('bounds'))))

run('shell', 'su', '0', 'am', 'start', '-n', package + '/app.morphe.extension.chmate.HaiagaruSettingsActivity')
opened = snapshot('opened')
if any(n.get('text') == 'オンライン共有NGへの同意（開発中）' for n in opened.iter('node')):
    # Dismiss without granting consent or saving any submission settings.
    run('shell', 'input', 'keyevent', '4')
    snapshot('consent-dismissed')
run('shell', 'input', 'swipe', '520', '2060', '520', '800', '450')
before = snapshot('before')
target = 'バックアップ・機種変更'
bounds = position(before, target)
assert bounds[1] > 128 and bounds[3] < 2300, bounds
run('shell', 'input', 'tap', str((bounds[0]+bounds[2])//2), str((bounds[1]+bounds[3])//2))
detail = snapshot('detail')
assert any(n.get('text') == target and int(re.findall(r'\d+', n.get('bounds'))[1]) < 260
           for n in detail.iter('node')), 'category did not open'
run('shell', 'input', 'swipe', '520', '2060', '520', '800', '450')
snapshot('detail-scrolled')
run('shell', 'input', 'keyevent', '4')
after = snapshot('after')
restored = position(after, target)
assert all(abs(a-b) <= 3 for a, b in zip(bounds, restored)), (bounds, restored)
# A second visit must also keep the home position after category content scrolled.
run('shell', 'input', 'tap', str((restored[0]+restored[2])//2), str((restored[1]+restored[3])//2))
snapshot('reopened')
run('shell', 'input', 'keyevent', '4')
again = position(snapshot('after-second-visit'), target)
assert all(abs(a-b) <= 3 for a, b in zip(bounds, again)), (bounds, again)
run('shell', 'screencap', '-p', '/sdcard/haiagaru-scroll-test.png')
run('pull', '/sdcard/haiagaru-scroll-test.png', f'build/settings-scroll-{version}-after.png')
result = {'version': version, 'homeBefore': bounds, 'homeAfter': restored,
          'homeAfterSecondVisit': again, 'restored': True}
pathlib.Path(f'build/settings-scroll-{version}-result.json').write_text(json.dumps(result, indent=2), encoding='utf-8')
print(json.dumps(result))
