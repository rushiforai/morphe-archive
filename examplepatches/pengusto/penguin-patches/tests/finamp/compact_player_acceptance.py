#!/usr/bin/env python3
# SPDX-License-Identifier: GPL-3.0-only
"""Exercise adaptive Player menu routes on the owned API35 synthetic fixture.

The original display size and hide-bottom preference are restored in finally.
The app must already be logged into Fixture Music with paused Output Controls.
"""
import argparse
import hashlib
import io
import json
from pathlib import Path
import re
import signal
import time
import zipfile
import android_acceptance as b
from build_native_payloads import ENGINE_SHA
from ui_fixes_acceptance import native_profile

def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--adb', type=Path, required=True)
    p.add_argument('--native-report', type=Path, required=True)
    p.add_argument('--source-matrix', type=Path, default=Path(__file__).with_name('native-sources.json'))
    p.add_argument('--mask', type=int, choices=range(1, 128), default=32)
    p.add_argument('--out-root', type=Path, required=True)
    p.add_argument('--out', type=Path, required=True)
    p.add_argument('--size', default='1100x680')
    args = p.parse_args()
    if not args.mask & 32 or not re.fullmatch('[1-9][0-9]{2,3}x[1-9][0-9]{2,3}', args.size):
        p.error('Select a player-patch mask and a numeric compact display size')
    b.OUT_ROOT = args.out_root.resolve()
    if not b.OUT_ROOT.is_relative_to((b.REPO_ROOT / '.scratch').resolve()):
        p.error('Output root must stay inside repository scratch')
    args.out = args.out.resolve()
    if (args.out / 'visibility-results.json').exists():
        raise ValueError('Use a fresh evidence directory')
    u = b.Android(out=args.out, adb=args.adb)
    if u.adb('shell', 'am', 'get-current-user').strip() != '0':
        raise RuntimeError('Use the owned synthetic profile0')
    (expected, source) = native_profile(json.loads(args.source_matrix.read_text()), args.mask, json.loads(args.native_report.read_text()))
    installed = u.installed()
    if not installed:
        raise RuntimeError('No installed Finamp fixture')
    raw = u.adb('exec-out', 'cat', installed['path'], binary=True)
    with zipfile.ZipFile(io.BytesIO(raw)) as archive:
        actual = hashlib.sha256(archive.read('lib/arm64-v8a/libapp.so')).hexdigest()
        engine = hashlib.sha256(archive.read('lib/arm64-v8a/libflutter.so')).hexdigest()
    if actual != expected or engine != ENGINE_SHA:
        raise ValueError('Installed native/engine does not match the pinned source')
    original_size = u.adb('shell', 'wm', 'size').strip()
    original_override = next(iter(re.findall('Override size: ([0-9]+x[0-9]+)', original_size)), None)
    initial_hidden = None
    s = object.__new__(b.Acceptance)
    s.ui = u
    s.features = args.mask
    s.results = {}
    u.launch()
    s.home()
    u.find(u.dump()[0], 'Fixture Music')
    u.find(u.dump()[0], 'Open Player Screen\nOutput Controls', contains=True)
    actions = ('Output', 'Queue', 'Lyrics')
    result = {'mask': args.mask, 'source': source, 'native_sha256': actual, 'engine_sha256': engine, 'installed_apk_sha256': installed['sha256'], 'compact_size': args.size, 'bundle_sha256': json.loads(args.native_report.read_text())['bundle_sha256'], 'raw_unedited_adb_captures': True, 'captured_at': b.utc()}

    def current(root):
        return [n['text'] or n['content-desc'] for n in u.labels(root)]

    def hidden(value):
        nonlocal initial_hidden
        s.ui = u
        s.settings()
        u.scroll_to('Layout & Theme')
        u.tap('Layout & Theme')
        u.tap('Player Screen')
        u.scroll_to('Hide bottom actions', contains=True)
        node = u.find(u.dump()[0], 'Hide bottom actions', contains=True, class_name='android.widget.Switch')
        if initial_hidden is None:
            initial_hidden = node.get('checked') == 'true'
        if (node.get('checked') == 'true') != value:
            u.tap('Hide bottom actions', contains=True, class_name='android.widget.Switch')
        assert u.find(u.dump()[0], 'Hide bottom actions', contains=True, class_name='android.widget.Switch').get('checked') == str(value).lower()
        u.capture('preference-' + str(value).lower())
        s.home()
        u.tap('Open Player Screen', contains=True)

    def seek(action):
        steps = []
        for attempt in range(24):
            (root, _) = u.dump()
            header = u.find(root, 'Output Controls')
            header_bottom = u.bounds(header)[3]
            seen = current(root)
            if action in seen:
                node = next((n for n in root.iter('node') if action in (n.get('text'), n.get('content-desc'))))
                raw_bounds = u.bounds(node)
                try:
                    (l, t, r, bot) = u.tap_bounds(node)
                    center = (t + bot) // 2
                    if header_bottom + 10 < center < u.viewport[3] - 10:
                        return steps
                    direction = 'down' if center <= header_bottom + 10 else 'up'
                except ValueError:
                    direction = 'up' if raw_bounds[3] > u.viewport[3] else 'down'
            else:
                direction = 'down' if any((x in seen and actions.index(x) > actions.index(action) for x in actions)) else 'up'
            if not any((x in seen for x in actions)):
                u.scroll(direction)
                steps.append({'direction': direction, 'method': 'large pre-action scroll'})
                continue
            scrolls = [n for n in root.iter('node') if n.get('scrollable') == 'true']
            assert scrolls
            (l, t, r, bot) = max((u.bounds(n) for n in scrolls), key=lambda z: (z[2] - z[0]) * (z[3] - z[1]))
            top = max(t, header_bottom + 8, u.viewport[1] + 8)
            bottom = min(bot, u.viewport[3] - 8)
            assert bottom - top >= 32
            step = min(64, (bottom - top) // 2)
            x = (l + r) // 2
            start = bottom - 10 if direction == 'up' else top + 10
            end = start - step if direction == 'up' else start + step
            u.adb('shell', 'input', 'swipe', x, start, x, end, 300)
            steps.append({'direction': direction, 'points': [x, start, x, end], 'method': 'short scroll below pinned header'})
        raise RuntimeError('Could not expose compact menu action ' + action)
    try:
        hidden(False)
        u.adb('shell', 'wm', 'size', args.size)
        time.sleep(1)
        u = b.Android(out=args.out / 'compact', adb=u.adb_path)
        (root, _) = u.dump()
        if 'Track Menu' not in current(root):
            u.tap('Open Player Screen', contains=True)
        assert not any((x in current(u.dump()[0]) for x in actions))
        u.capture('automatically-hidden-actions')
        result['actual_routes'] = {}
        for (action, marker) in [('Output', 'Volume'), ('Queue', 'Previous Tracks'), ('Lyrics', 'Penguin synthetic lyrics')]:
            u.tap('Track Menu')
            steps = seek(action)
            u.capture('menu-' + action.lower())
            u.tap(action)
            u.find(u.dump()[0], marker)
            u.capture('route-' + action.lower())
            u.back()
            u.find(u.dump()[0], 'Track Menu')
            result['actual_routes'][action] = {'opened_and_returned': True, 'scrolls': steps}
        result['preference_false_and_adaptive_actions_hidden'] = True
        result['installed'] = u.installed()
    finally:
        signal.signal(signal.SIGINT, signal.SIG_IGN)
        u.adb('shell', 'wm', 'size', original_override or 'reset')
        time.sleep(1)
        u = b.Android(out=args.out, adb=u.adb_path)
        s.ui = u
        hidden(initial_hidden) if initial_hidden is not None else None
        result['display_and_preference_restored'] = u.adb('shell', 'wm', 'size').strip() == original_size
    (u.out / 'visibility-results.json').write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps(result))
if __name__ == '__main__':
    main()
