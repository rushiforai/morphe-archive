#!/usr/bin/env python3
"""Bounded, fresh-hierarchy controls for the disposable Morphe acceptance AVD.

Reuses Android target/viewport guards. Does not invoke a patcher API: patch
selection, patching, export and signer setup are performed through actual UI.
"""
import argparse
import json
from pathlib import Path
import re
import time

import android_acceptance as base


PACKAGES = ('app.morphe.manager', 'com.android.documentsui', 'com.android.settings',
            'com.android.packageinstaller', 'com.android.permissioncontroller',
            'com.google.android.permissioncontroller', 'android')


def ensure_install_source(ui):
    """Enable Morphe's install source only when its observed control is off."""
    root, _ = ui.dump()
    ui.find(root, 'Morphe', class_name='android.widget.TextView')
    caption = ui.find(root, 'Allow from this source', class_name='android.widget.TextView')
    parents = {child: parent for parent in root.iter() for child in parent}
    control = caption
    while control.get('checkable') != 'true' and control in parents:
        control = parents[control]
    before = control.get('checked') if control.get('checkable') == 'true' else None
    if before not in ('true', 'false'):
        raise RuntimeError('Install-source control has no unambiguous checked state')
    if before == 'false':
        ui.tap('Allow from this source', class_name='android.widget.TextView')
    # Android can immediately return to its installer after enabling this row.
    # Verify the actual permission without assuming Settings remains foreground.
    permission = ui.adb('shell', 'cmd', 'appops', 'get', 'app.morphe.manager', 'REQUEST_INSTALL_PACKAGES')
    if not re.search(r'\bREQUEST_INSTALL_PACKAGES: allow\b', permission):
        raise RuntimeError('Morphe install-source permission is not enabled')
    return {'before_checked': before == 'true', 'after_allowed': True,
            'toggled': before == 'false', 'permission_verified': permission.strip()}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--adb', type=Path)
    parser.add_argument('--package', choices=PACKAGES, default=PACKAGES[0])
    parser.add_argument('--out-root', type=Path, default=base.REPO_ROOT / '.scratch/finamp/manager-2.2.0')
    parser.add_argument('--out', type=Path, default=None)
    sub = parser.add_subparsers(dest='command', required=True)
    inspect = sub.add_parser('inspect')
    inspect.add_argument('--contains', default='')
    inspect.add_argument('--limit', type=int, choices=range(1, 51), default=30)
    sub.add_parser('back')
    sub.add_parser('hide-ime')
    sub.add_parser('launch', help='Open Manager using the observed active Android user')
    sub.add_parser('ensure-install-source', help='Enable the observed Morphe install source without toggling an active control off')
    capture = sub.add_parser('capture')
    capture.add_argument('label')
    wait = sub.add_parser('wait')
    wait.add_argument('label')
    wait.add_argument('--contains', action='store_true')
    wait.add_argument('--timeout', type=int, choices=range(1, 181), default=45)
    tap = sub.add_parser('tap')
    tap.add_argument('label', nargs='?')
    tap.add_argument('--class-name')
    tap.add_argument('--index', type=int)
    tap.add_argument('--contains', action='store_true')
    text = sub.add_parser('type')
    text.add_argument('value')
    text.add_argument('--label')
    text.add_argument('--index', type=int)
    text.add_argument('--replace', action='store_true')
    text.add_argument('--class-name', choices=('android.widget.EditText', 'android.widget.AutoCompleteTextView'), default='android.widget.EditText')
    text.add_argument('--masked', action='store_true', help='Synthetic password; validate mask length, not plaintext')
    scroll = sub.add_parser('scroll')
    scroll.add_argument('direction', choices=('up', 'down'))
    args = parser.parse_args()
    base.PACKAGE = args.package
    base.OUT_ROOT = args.out_root.expanduser().resolve()
    if not base.OUT_ROOT.is_relative_to((base.REPO_ROOT / '.scratch').resolve()):
        parser.error('--out-root must stay inside this repository scratch directory')
    ui = base.Android(out=args.out or base.OUT_ROOT / "ui", adb=args.adb)
    if args.command == 'ensure-install-source':
        if args.package != 'com.android.settings':
            parser.error('ensure-install-source requires the observed Android Settings page')
        print(json.dumps(ensure_install_source(ui)))
    elif args.command == 'launch':
        if args.package != PACKAGES[0]:
            parser.error('launch is limited to Morphe Manager')
        ui.launch()
    elif args.command == 'capture':
        ui.capture(args.label)
    elif args.command == 'wait':
        deadline = time.monotonic() + args.timeout
        while time.monotonic() < deadline:
            root, _ = ui.dump()
            try:
                ui.find(root, args.label, contains=args.contains)
                print(json.dumps({'observed': args.label}))
                break
            except RuntimeError:
                time.sleep(0.3)
        else:
            raise RuntimeError('Expected visible UI label did not appear: ' + args.label)
    elif args.command == 'inspect':
        labels = ui.labels(ui.dump()[0])
        filtered = [n for n in labels if args.contains in n['text'] or args.contains in n['content-desc']]
        compact = [{'label': n['text'] or n['content-desc'], 'class': n['class'].split('.')[-1],
                    'bounds': n['bounds'], **({'checked': n['checked']} if n['checkable'] == 'true' else {})}
                   for n in filtered[:args.limit]]
        print(json.dumps({'count': len(labels), 'matches': len(filtered), 'labels': compact}, ensure_ascii=False))
    elif args.command == 'back':
        ui.back()
    elif args.command == 'hide-ime':
        ui.hide_ime()
    elif args.command == 'tap':
        ui.tap(args.label, contains=args.contains, class_name=args.class_name, index=args.index)
    elif args.command == 'type':
        if args.class_name == 'android.widget.AutoCompleteTextView':
            if args.package != 'com.android.documentsui' or args.masked or not re.fullmatch(r'[A-Za-z0-9_.-]+', args.value):
                raise ValueError('Autocomplete typing is limited to synthetic DocumentsUI file searches')
            root, _ = ui.dump()
            field = ui.find(root, args.label, class_name=args.class_name, index=args.index)
            x, y, right, bottom = ui.tap_bounds(field)
            # Generic tap hides the IME first, which closes an empty picker search.
            if field.get('focused') != 'true':
                ui.adb('shell', 'input', 'tap', (x + right) // 2, (y + bottom) // 2)
            previous = field.get('text', '')
            if previous in ('Search…', 'Search...'):
                previous = ''
            if args.replace and previous:
                ui.adb('shell', 'input', 'keyevent', 'KEYCODE_MOVE_END')
                ui.adb('shell', 'input', 'keyevent', *(['KEYCODE_DEL'] * len(previous)))
            ui.adb('shell', 'input', 'text', args.value)
            field = ui.find(ui.dump()[0], class_name=args.class_name, index=args.index)
            if field.get('text') != args.value:
                raise RuntimeError('Picker search did not retain the requested file query')
        elif args.masked:
            if not re.fullmatch(r'[A-Za-z0-9]*', args.value):
                raise ValueError('Only synthetic alphanumeric passwords are supported')
            root, _ = ui.dump()
            field = ui.find(root, args.label, class_name='android.widget.EditText', index=args.index)
            if field.get('password') != 'true':
                raise ValueError('Masked input requires an actual password field')
            previous = len(field.get('text', ''))
            ui.tap(args.label, class_name='android.widget.EditText', index=args.index)
            if args.replace:
                ui.adb('shell', 'input', 'keyevent', 'KEYCODE_MOVE_END')
                ui.adb('shell', 'input', 'keyevent', *(['KEYCODE_DEL'] * (previous + 2)))
            ui.adb('shell', 'input', 'text', args.value)
            time.sleep(0.2)
            root, _ = ui.dump()
            fields = [n for n in root.iter('node') if n.get('package') == args.package
                      and n.get('class') == 'android.widget.EditText' and n.get('focused') == 'true']
            expected = len(args.value) + (0 if args.replace else previous)
            if len(fields) != 1 or fields[0].get('password') != 'true' or len(fields[0].get('text', '')) != expected:
                raise RuntimeError('Password control did not retain the expected masked length')
        else:
            ui.type_text(args.value, args.label, index=args.index, replace=args.replace)
    elif args.command == 'scroll':
        ui.scroll(args.direction)


if __name__ == '__main__':
    main()
