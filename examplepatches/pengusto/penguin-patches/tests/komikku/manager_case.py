#!/usr/bin/env python3
# SPDX-License-Identifier: GPL-3.0-only
"""Select and apply Komikku through the actual Morphe Manager UI.

Start with the official original APK loaded at the one-patch selection screen.
No patcher API calls, fabricated reports or direct writes to Manager data.
"""
import argparse
import json
import re
import time
import ui as fixture

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--adb', required=True)
a = p.parse_args()
base = fixture.base
base.PACKAGE = 'app.morphe.manager'
ui = base.Android(adb=a.adb, out=base.OUT_ROOT / 'ui')
name = 'Keep local manga in exclusion searches'
root, _ = ui.dump()
initially_enabled = any(n.get('content-desc') == name + ', Enabled' for n in root.iter('node'))
if initially_enabled:
    ui.tap(name, class_name='android.widget.TextView')
    root, _ = ui.dump()
ui.find(root, name + ', Disabled')
ui.capture('manager-patch-disabled')
ui.tap(name, class_name='android.widget.TextView')
root, _ = ui.dump()
ui.find(root, name + ', Enabled')
ui.capture('manager-patch-selected')
ui.adb('logcat', '-c')
ui.tap('Patch', class_name='android.widget.TextView')
deadline = time.monotonic() + 180
while time.monotonic() < deadline:
    root, _ = ui.dump()
    if any(n.get('text') == 'Not now' for n in root.iter('node')):
        ui.tap('Not now', class_name='android.widget.TextView')
        continue
    if any(n.get('text') == 'Patched' for n in root.iter('node')): break
    time.sleep(0.5)
else: raise RuntimeError('Manager did not report a successful patch')
ui.capture('manager-patch-success')
log = ui.adb('logcat', '-d', '-v', 'threadtime')
runtime = re.findall(r'Morphe Patcher: Runtime: name=([a-z]+)', log)
assert runtime, 'Actual patcher runtime missing from logcat'
base.OUT_ROOT.mkdir(exist_ok=True)
(base.OUT_ROOT / 'manager-logcat.txt').write_text(log)
record = {'uiSelectionDisabledObserved': True, 'uiSelectionEnabledObserved': True, 'uiPatchedObserved': True,
          'runtime': runtime[-1], 'patch': name, 'initiallyEnabled': initially_enabled}
(base.OUT_ROOT / 'manager-case.json').write_text(json.dumps(record, indent=2) + '\n')
print(json.dumps(record))
