#!/usr/bin/env python3
"""Guarded real-APK captures for #1689 and #1790, on the disposable AVD only.

No signing, clearing, fixture mutation or patcher calls. APK updates use -r.
The alphabet point must be observed on a fresh screenshot; letters deliberately
have no individual accessibility nodes in the shipped app.
"""
import argparse
import hashlib
import json
from pathlib import Path
import re
import time

import android_acceptance as base


def labels(ui):
    return [node['text'] or node['content-desc'] for node in ui.labels(ui.dump()[0])]


def offline(ui, expected):
    ui.open_drawer()
    root, _ = ui.dump()
    row = ui.find(root, 'Offline Mode', class_name='android.widget.Button')
    x, y, right, bottom = ui.tap_bounds(row)
    switches = []
    for node in root.iter('node'):
        if node.get('class') != 'android.widget.Switch':
            continue
        nx, ny, nr, nb = ui.tap_bounds(node)
        if x <= nx <= nr <= right and y <= ny <= nb <= bottom:
            switches.append(node)
    if len(switches) != 1:
        raise RuntimeError('Offline switch is not uniquely anchored to its row')
    actual = switches[0].get('checked') == 'true'
    if actual != expected:
        ui.tap('Offline Mode', class_name='android.widget.Button')
    root, _ = ui.dump()
    if any(node.get('content-desc') == 'Offline Mode' and node.get('class') == 'android.widget.Button'
           for node in root.iter('node')):
        # Root Back can minimize this shipped build with its drawer visible.
        ui.tap('Fixture Music', class_name='android.widget.Button')


def sort_by_name(ui):
    visible = labels(ui)
    if 'Name' in visible:
        return
    if 'Random' not in visible:
        raise RuntimeError('Unexpected initial sort; inspect before selecting')
    ui.tap('Random')
    ui.tap('Random')
    ui.tap('Name')
    ui.back()
    if 'Name' not in labels(ui):
        raise RuntimeError('Name sort did not apply')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--adb', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--apk', type=Path, help='Explicit same-key APK update; otherwise inspect installed app')
    parser.add_argument('--label', required=True)
    sub = parser.add_subparsers(dest='case', required=True)
    artist = sub.add_parser('artist')
    artist.add_argument('--expected-count', type=int, choices=(6, 8), required=True)
    jump = sub.add_parser('jump')
    jump.add_argument('--letter', choices=list('ABCDEFGHIJKLMNOPQRSTUVWXYZ#'), required=True)
    jump.add_argument('--point', nargs=2, type=int, required=True, metavar=('X', 'Y'))
    jump.add_argument('--expected-first', required=True)
    jump.add_argument('--offline', action='store_true')
    args = parser.parse_args()
    if not re.fullmatch(r'[A-Za-z0-9_-]+', args.label):
        parser.error('Use a simple capture label')
    ui = base.Android(out=args.out, adb=args.adb)
    if args.apk:
        ui.install(args.apk, expected_sha=hashlib.sha256(args.apk.read_bytes()).hexdigest())
    installed = ui.installed()
    if not installed:
        raise RuntimeError('No installed Finamp APK')
    ui.launch(restart=True)
    offline(ui, args.case == 'artist' or args.offline)
    record = {'case': args.case, 'installed_apk_sha256': installed['sha256'], 'captured_at': base.utc()}
    if args.case == 'artist':
        ui.tap('Artists\nTab 3 of 6')
        if 'B Guest' not in labels(ui):
            ui.tap('Performing Artists')
        ui.tap('B Guest')
        expected = f'{args.expected_count} Tracks Downloaded'
        if expected not in labels(ui):
            raise AssertionError('Unexpected offline artist count: ' + repr(labels(ui)))
        ui.capture(args.label + '-header')
        ui.tap('See All')
        if 'Remove This Filter' in labels(ui):
            ui.tap('Remove This Filter')
        sort_by_name(ui)
        visible = labels(ui)
        titles = [value.split('\n')[0] for value in visible if '\nFixture Credits\n4 Seconds' in value]
        expected_titles = [f'{i:02d} - Credit Order' for i in range(1, 7)]
        if args.expected_count == 8:
            expected_titles += ['07 - Lead Solo', '08 - Album Credit Only']
        if titles != expected_titles:
            raise AssertionError('Wrong visible artist tracks: ' + repr(titles))
        if 'Favorites' in visible:
            raise AssertionError('Unexpected favorite filter in comparison capture')
        ui.capture(args.label + '-tracks')
        record.update(offline=True, expected_count=args.expected_count, visible_tracks=titles)
    else:
        ui.tap('Tracks\nTab 5 of 6')
        sort_by_name(ui)
        ui.capture(args.label + '-ready')
        x, y = args.point
        if not ui.size[0] - 90 <= x < ui.size[0] - 3 or not ui.viewport[1] < y < ui.viewport[3]:
            raise ValueError('Point is outside the observed alphabet-edge region')
        if ui.ime_visible(ui.adb('shell', 'dumpsys', 'input_method')):
            raise RuntimeError('Keyboard obscures the test surface')
        ui.adb('shell', 'input', 'tap', x, y)
        time.sleep(1)
        root, _ = ui.dump()
        rows = []
        for node in root.iter('node'):
            value = node.get('content-desc', '')
            if '\n4 Seconds' not in value or node.get('class') != 'android.widget.Button':
                continue
            try:
                _, top, _, bottom = ui.bounds(node)
            except ValueError:
                continue
            if ui.viewport[1] <= top < bottom <= ui.viewport[3]:
                rows.append((top, value.split('\n')[0]))
        rows.sort()
        if not rows or rows[0][1] != args.expected_first:
            raise AssertionError('Wrong first visible track after jump: ' + repr(rows))
        ui.capture(args.label + '-result')
        record.update(offline=args.offline, letter=args.letter, observed_point=args.point,
                      first_visible_track=rows[0][1])
    (ui.out / (args.label + '-result.json')).write_text(json.dumps(record, indent=2) + '\n')
    print(json.dumps(record), flush=True)


if __name__ == '__main__':
    main()
