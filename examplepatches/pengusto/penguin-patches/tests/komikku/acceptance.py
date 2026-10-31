#!/usr/bin/env python3
# SPDX-License-Identifier: GPL-3.0-only
"""Search through the installed app UI; retain raw PNG/XML and result sets."""
import argparse
import json
from pathlib import Path
import time
import ui as fixture

p = argparse.ArgumentParser(description=__doc__)
p.add_argument('--phase', choices=['original', 'patched', 'removed', 'reapplied'], required=True)
p.add_argument('--adb', required=True)
p.add_argument('--quick', action='store_true', help='Recheck only the exclusion screenshot after a lifecycle update')
a = p.parse_args()
base = fixture.base
base.PACKAGE = 'app.komikku'
android = base.Android(adb=a.adb, out=base.OUT_ROOT / 'ui')
assert android.adb('exec-out', 'su', '0', 'cat', '/data/user/0/app.komikku/files/penguin-search-fixture/.owner').strip() == 'PenguinKomikkuSearchFixture-2026-10-30'
android.adb('shell', 'am', 'start', '--user', '0', '-n', 'app.komikku/eu.kanade.tachiyomi.ui.main.MainActivity')
time.sleep(1)
root, _ = android.dump()
if not any(n.get('class') == 'android.widget.EditText' for n in root.iter('node')):
    android.tap('Search')
fixed = a.phase in ('patched', 'reapplied')
all_titles = {'Orion', 'Meteor', 'Lyra'}
cases = [
    ('-meteor', {'Orion', 'Lyra'} if fixed else {'Lyra'}),
    ('-orion', {'Meteor', 'Lyra'} if fixed else {'Lyra'}),
    ('-space', set()),
    ('-0', all_titles if fixed else {'Lyra'}),
    ('-42', {'Orion', 'Meteor'} if fixed else set()),
    ('-43', all_titles if fixed else {'Lyra'}),
    ('orion', {'Orion'}),
    ('meteor', {'Meteor'}),
    ('src:local', {'Orion', 'Meteor'}),
    ('', all_titles),
]
if a.quick: cases = cases[:1]
results = []
for query, expected in cases:
    for attempt in range(3):
        try:
            android.type_text(query, index=0, replace=True)
            break
        except RuntimeError as failure:
            # ADB key events can be reordered under emulator load. Never
            # evaluate a different query: clear the observed text and retry.
            if 'Actual field differs from requested synthetic text' not in str(failure) or attempt == 2:
                raise
            print(json.dumps({'typingRetry': attempt + 1, 'query': query}), flush=True)
    android.hide_ime()
    time.sleep(1.3)  # Includes the application's own search debounce.
    root, _ = android.dump()
    actual = {n.get('text') for n in root.iter('node') if n.get('text') in all_titles}
    assert actual == expected, (a.phase, query, sorted(expected), sorted(actual))
    results.append({'query': query, 'expected': sorted(expected), 'actual': sorted(actual), 'passed': True})
    print(json.dumps({'phase': a.phase, 'query': query, 'actual': sorted(actual), 'passed': True}), flush=True)
    if query == '-meteor': android.capture(a.phase + '-exclude-meteor-clean')
(base.OUT_ROOT / (a.phase + '-search.json')).write_text(json.dumps({'phase': a.phase, 'cases': results}, indent=2) + '\n')
print(json.dumps({'phase': a.phase, 'passed': len(results)}))
