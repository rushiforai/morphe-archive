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


def native_profile(matrix, mask, native):
    if not mask:
        return LIBRARY_SHA, matrix['base']
    source = matrix['masks'][str(mask)]['commit']
    record = native['masks'][str(mask)]
    if record.get('source') != source:
        raise ValueError('Native report source differs from the pinned capture source')
    return record['native_sha256'], source


def reveal_menu_bottom(ui):
    previous = None
    scrolls = 0
    for _ in range(16):
        root, _ = ui.dump()
        current = [(node['text'] or node['content-desc'], node['bounds'])
                   for node in ui.labels(root)]
        if current == previous:
            return [label for label, _ in current], scrolls
        # The original menu fits completely in this portrait viewport and
        # therefore exposes no scroll action. The updated, longer menu can scroll.
        if not any(node.get('scrollable') == 'true' for node in root.iter('node')):
            return [label for label, _ in current], scrolls
        previous = current
        ui.scroll()
        scrolls += 1
    raise RuntimeError('Player menu did not reach a stable bottom position')



def exercise_reviewed_routes(ui, label):
    ui.tap('Track Menu')
    reveal_menu_bottom(ui)
    ui.tap('Queue')
    ui.find(ui.dump()[0], 'Previous Tracks')
    ui.capture(label + '-queue')
    ui.back()
    ui.find(ui.dump()[0], 'Track Menu')
    ui.tap('Track Menu')
    reveal_menu_bottom(ui)
    ui.tap('Lyrics')
    ui.find(ui.dump()[0], 'Penguin synthetic lyrics')
    ui.capture(label + '-lyrics')
    ui.tap('Track Menu')
    visible, _ = reveal_menu_bottom(ui)
    if [value for value in visible if value in ('Output', 'Queue', 'Lyrics')] != ['Output', 'Queue']:
        raise AssertionError('Lyrics menu has missing, duplicate or recursive routes')
    ui.capture(label + '-lyrics-menu')
    ui.tap('Output')
    ui.find(ui.dump()[0], 'Volume')
    ui.capture(label + '-lyrics-output')
    ui.back()
    ui.find(ui.dump()[0], 'Penguin synthetic lyrics')
    ui.tap('Track Menu')
    reveal_menu_bottom(ui)
    ui.tap('Queue')
    ui.find(ui.dump()[0], 'Previous Tracks')
    ui.capture(label + '-lyrics-queue')
    ui.back()
    ui.find(ui.dump()[0], 'Penguin synthetic lyrics')
    ui.back()
    ui.find(ui.dump()[0], 'Output Controls (Title)')
    return {'player_queue_and_lyrics_opened_and_returned': True,
            'lyrics_output_and_queue_opened_and_returned': True,
            'lyrics_recursive_route_absent': True}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('case', choices=('player', 'banner'))
    parser.add_argument('--adb', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--out-root', type=Path, default=base.OUT_ROOT,
                        help='Safety root inside this repository scratch directory')
    parser.add_argument('--label', required=True)
    parser.add_argument('--user', type=int, required=True)
    parser.add_argument('--mask', type=int, required=True)
    parser.add_argument('--native-report', type=Path)
    parser.add_argument('--source-matrix', type=Path, default=Path(__file__).with_name('native-sources.json'))
    parser.add_argument('--exercise', action='store_true', help='After capture, exercise and dismiss the fixed UI')
    parser.add_argument('--reviewed-player-actions', action='store_true',
                        help='Expand/scroll both menus and verify reviewed Output, Queue and Lyrics actions')
    args = parser.parse_args()
    if not re.fullmatch(r'[A-Za-z0-9_-]+', args.label):
        parser.error('Use a simple capture label')
    matrix = json.loads(args.source_matrix.read_text())
    if str(args.mask) not in matrix['masks']:
        parser.error('Mask is not in the pinned source matrix')
    if args.mask and not args.native_report:
        parser.error('Patched APK capture requires its verified native report')
    expected, source = native_profile(matrix, args.mask,
                                     json.loads(args.native_report.read_text()) if args.native_report else None)
    base.OUT_ROOT = args.out_root.expanduser().resolve()
    if not base.OUT_ROOT.is_relative_to((base.REPO_ROOT / '.scratch').resolve()):
        parser.error('--out-root must stay inside this repository scratch directory')
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
              'source': source,
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
        if args.reviewed_player_actions:
            visible, menu_scrolls = reveal_menu_bottom(ui)
        else:
            visible = labels(ui)
        has_output = 'Output' in visible
        if has_output != bool(args.mask & 32):
            raise AssertionError('Player menu Output access does not match the selected patch')
        ui.capture(args.label + '-menu')
        record['player_menu_output_present'] = has_output
        if args.reviewed_player_actions:
            actions = ['Output', 'Queue', 'Lyrics']
            expected_count = int(bool(args.mask & 32))
            if any(visible.count(action) != expected_count for action in actions):
                raise AssertionError('Reviewed player actions are missing or duplicated')
            if expected_count and [value for value in visible if value in actions] != actions:
                raise AssertionError('Reviewed player actions are not in Output / Queue / Lyrics order')
            if expected_count:
                root, _ = ui.dump()
                for action in actions:
                    ui.find(root, action)
            record['reviewed_actions_checked'] = actions
            record['menu_scrolls'] = menu_scrolls
            record['all_expected_actions_visible'] = True
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
            if args.reviewed_player_actions:
                record.update(exercise_reviewed_routes(ui, args.label))
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
