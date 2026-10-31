#!/usr/bin/env python3
"""Fresh UI observations on the isolated Komikku acceptance AVD only."""
import argparse
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'finamp'))
import android_acceptance as base

base.SERIAL = 'emulator-5584'
base.AVD = 'komikku'
base.OUT_ROOT = base.REPO_ROOT / '.scratch/komikku/android'

def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--adb', default=str(Path.home() / 'Library/Android/sdk/platform-tools/adb'))
    p.add_argument('--package', default='app.morphe.manager')
    p.add_argument('action', choices=['inspect', 'tap', 'type', 'back', 'hide', 'capture', 'scroll'])
    p.add_argument('value', nargs='?')
    p.add_argument('--index', type=int)
    p.add_argument('--class-name')
    a = p.parse_args()
    base.PACKAGE = a.package
    ui = base.Android(adb=a.adb, out=base.OUT_ROOT / 'ui')
    if a.action == 'inspect':
        print(json.dumps(ui.labels(ui.dump()[0]), ensure_ascii=False))
    elif a.action == 'tap': ui.tap(a.value, index=a.index, class_name=a.class_name)
    elif a.action == 'type': ui.type_text(a.value, index=a.index or 0, replace=True)
    elif a.action == 'back': ui.back()
    elif a.action == 'hide': ui.hide_ime()
    elif a.action == 'capture': ui.capture(a.value)
    elif a.action == 'scroll': ui.scroll(a.value)

if __name__ == '__main__': main()
