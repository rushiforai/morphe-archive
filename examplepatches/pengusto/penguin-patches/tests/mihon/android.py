#!/usr/bin/env python3
"""Fresh UI controls on an explicitly named, disposable Mihon test AVD."""
import argparse
import json
from pathlib import Path
import sys
import time
import re

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'finamp'))
import android_acceptance as base


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--serial', required=True)
    p.add_argument('--avd', required=True)
    p.add_argument('--adb', type=Path)
    p.add_argument('--package', default='app.mihon', choices=('app.mihon', 'app.morphe.manager',
        'com.android.documentsui', 'com.android.settings', 'com.android.packageinstaller', 'android'))
    s = p.add_subparsers(dest='command', required=True)
    s.add_parser('inspect'); s.add_parser('launch'); s.add_parser('back'); s.add_parser('hide-ime')
    c = s.add_parser('capture'); c.add_argument('label')
    c = s.add_parser('wait'); c.add_argument('label')
    c = s.add_parser('tap'); c.add_argument('label'); c.add_argument('--contains', action='store_true')
    c.add_argument('--class-name'); c.add_argument('--index', type=int)
    c = s.add_parser('type'); c.add_argument('value'); c.add_argument('--replace', action='store_true')
    c.add_argument('--index', type=int); c.add_argument('--class-name', default='android.widget.EditText')
    c.add_argument('--masked', action='store_true')
    c = s.add_parser('scroll'); c.add_argument('direction', choices=('up', 'down'))
    args = p.parse_args()
    if not args.serial.startswith('emulator-'):
        p.error('Only a named disposable emulator is supported')
    base.SERIAL, base.AVD, base.PACKAGE = args.serial, args.avd, args.package
    base.OUT_ROOT = base.REPO_ROOT / '.scratch/mihon/android'
    ui = base.Android(out=base.OUT_ROOT / 'ui', adb=args.adb)
    if args.command == 'inspect':
        root, _ = ui.dump()
        print(json.dumps([{'label': n['text'] or n['content-desc'], 'class': n['class'].split('.')[-1], 'bounds': n['bounds'], **({'checked': n['checked']} if n['checkable']=='true' else {})} for n in ui.labels(root)], ensure_ascii=False))
    elif args.command == 'launch': ui.launch(restart=True)
    elif args.command == 'capture': ui.capture(args.label)
    elif args.command == 'back': ui.back()
    elif args.command == 'hide-ime': ui.hide_ime()
    elif args.command == 'scroll': ui.scroll(args.direction)
    elif args.command == 'tap':
        ui.tap(args.label, contains=args.contains, class_name=args.class_name, index=args.index)
    elif args.command == 'type':
        if args.class_name == 'android.widget.EditText' and not args.masked:
            ui.type_text(args.value, index=args.index, replace=args.replace)
            return
        if not re.fullmatch(r'[A-Za-z0-9 :/._-]*', args.value): raise ValueError('Synthetic ASCII only')
        node = ui.find(ui.dump()[0], class_name=args.class_name, index=args.index)
        if args.masked and node.get('password') != 'true': raise ValueError('Actual password field required')
        previous = node.get('text', '')
        x, y, right, bottom = ui.tap_bounds(node)
        # Do not hide an empty DocumentsUI search keyboard: that closes search.
        ui.adb('shell', 'input', 'tap', (x+right)//2, (y+bottom)//2)
        if args.replace:
            ui.adb('shell', 'input', 'keyevent', 'KEYCODE_MOVE_END')
            ui.adb('shell', 'input', 'keyevent', *(['KEYCODE_DEL'] * (len(previous)+2)))
        ui.adb('shell', 'input', 'text', args.value.replace(' ', '%s'))
        actual = ui.find(ui.dump()[0], class_name=args.class_name, index=args.index).get('text', '')
        expected = args.value if args.replace else previous + args.value
        if (len(actual) != len(expected) if args.masked else actual != expected):
            raise RuntimeError('Synthetic input was not retained')
    elif args.command == 'wait':
        deadline = time.monotonic() + 60
        while time.monotonic() < deadline:
            try:
                ui.find(ui.dump()[0], args.label)
                return
            except RuntimeError: time.sleep(0.3)
        raise RuntimeError('Expected visible label absent: ' + args.label)


if __name__ == '__main__': main()
