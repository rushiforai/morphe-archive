#!/usr/bin/env python3
"""Capture #1355/#1756 from verified installed APKs on the disposable Finamp AVD.

Configure the fixture/theme through the normal UI first. Player starts paused
on the synthetic Output Controls track, with bottom actions hidden and gestures
disabled. Banner starts on the music screen in a fresh, owned synthetic profile.
No patcher, data reset, account mutation, or image editing is performed here.
"""
import argparse
import hashlib
import io
import json
from pathlib import Path
import re
import zipfile

import android_acceptance as base
from build_native_payloads import ENGINE_SHA, LIBRARY_SHA

BANNER = 'Check out some commonly changed settings!'


def labels(ui):
    return [node['text'] or node['content-desc'] for node in ui.labels(ui.dump()[0])]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('case', choices=('player', 'banner'))
    parser.add_argument('--adb', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--label', required=True)
    parser.add_argument('--user', type=int, required=True)
    parser.add_argument('--mask', type=int, required=True)
    parser.add_argument('--native-report', type=Path)
    parser.add_argument('--source-matrix', type=Path, default=Path(__file__).with_name('native-sources.json'))
    parser.add_argument('--exercise', action='store_true', help='After capture, exercise and dismiss the fixed UI')
    args = parser.parse_args()
    if not re.fullmatch(r'[A-Za-z0-9_-]+', args.label):
        parser.error('Use a simple capture label')
    matrix = json.loads(args.source_matrix.read_text())
    if str(args.mask) not in matrix['masks']:
        parser.error('Mask is not in the pinned source matrix')
    if args.mask and not args.native_report:
        parser.error('Patched APK capture requires its verified native report')
    ui = base.Android(out=args.out, adb=args.adb)
    receipt_path = ui.out / (args.label + '-acceptance.json')
    if receipt_path.exists():
        raise ValueError('Refusing to overwrite an existing acceptance receipt')
    if ui.adb('shell', 'am', 'get-current-user').strip() != str(args.user):
        raise RuntimeError('Different Android profile is active')
    installed = ui.installed()
    if not installed:
        raise RuntimeError('No installed Finamp APK')
    apk = ui.adb('exec-out', 'cat', installed['path'], binary=True)
    assert hashlib.sha256(apk).hexdigest() == installed['sha256']
    expected = LIBRARY_SHA if not args.mask else json.loads(args.native_report.read_text())['masks'][str(args.mask)]['native_sha256']
    with zipfile.ZipFile(io.BytesIO(apk)) as archive:
        native_sha = hashlib.sha256(archive.read('lib/arm64-v8a/libapp.so')).hexdigest()
        engine_sha = hashlib.sha256(archive.read('lib/arm64-v8a/libflutter.so')).hexdigest()
        if engine_sha != ENGINE_SHA:
            raise ValueError('Installed APK has an unsupported Flutter engine')
    if native_sha != expected:
        raise ValueError('Installed native output does not match the requested selection')
    ui.hide_ime()
    record = {'case': args.case, 'mask': args.mask, 'user': args.user,
              'installed_apk_sha256': installed['sha256'], 'native_sha256': native_sha, 'engine_sha256': engine_sha,
              'source': matrix['base'] if not args.mask else matrix['masks'][str(args.mask)]['commit'],
              'display_size': ui.adb('shell', 'wm', 'size').strip(),
              'display_density': ui.adb('shell', 'wm', 'density').strip(),
              'raw_unedited_adb_captures': True, 'captured_at': base.utc()}
    if args.case == 'player':
        root, _ = ui.dump()
        ui.find(root, 'Output Controls (Title)')
        ui.find(root, 'Track Menu')
        visible = labels(ui)
        if any(value in visible for value in ('Output', 'Queue', 'Lyrics')):
            raise AssertionError('Player bottom actions are not hidden')
        ui.capture(args.label + '-player')
        ui.tap('Track Menu')
        visible = labels(ui)
        has_output = 'Output' in visible
        if has_output != bool(args.mask & 32):
            raise AssertionError('Player menu Output access does not match the selected patch')
        ui.capture(args.label + '-menu')
        record['player_menu_output_present'] = has_output
        if args.exercise:
            if not has_output:
                raise ValueError('Only the fixed player menu can exercise Output')
            ui.tap('Output')
            root, _ = ui.dump()
            ui.find(root, 'Volume')
            ui.capture(args.label + '-output-sheet')
            ui.back()
            root, _ = ui.dump()
            ui.find(root, 'Track Menu')
            if 'Volume' in labels(ui):
                raise AssertionError('Output sheet did not close back to Player')
            record['real_output_sheet_opened_and_dismissed'] = True
    else:
        root, _ = ui.dump()
        ui.find(root, BANNER)
        ui.capture(args.label + '-banner')
        if args.exercise:
            if not args.mask & 64:
                raise ValueError('Exercise the fixed banner after its comparison capture')
            ui.tap(BANNER)
            root, _ = ui.dump()
            ui.find(root, 'Quick Settings')
            ui.capture(args.label + '-quick-settings')
            ui.back()
            if BANNER in labels(ui):
                raise AssertionError('Banner remained visible after opening Quick Settings')
            ui.launch(restart=True)
            if BANNER in labels(ui):
                raise AssertionError('Banner dismissal was not retained after restart')
            record['quick_settings_opened_and_dismissal_retained'] = True
    base.write_json(receipt_path, record)
    print(json.dumps(record), flush=True)


if __name__ == '__main__':
    main()
