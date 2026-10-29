#!/usr/bin/env python3
"""Apply/export one selection through observed Manager 2.2.0 UI, never its API.

Requires the original APK already loaded and Penguin selected. --from-result
uses the observed Home -> Finamp -> Patch path, which reuses that original.
SDK/AVD/output guards come from android_acceptance. No installer/data reset.
"""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess
import time

import android_acceptance as base
from patch_matrix import NAMES, check_contents
from build_native_payloads import APK_SHA
from manager_selection import configure_selection


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--adb', type=Path, required=True)
    parser.add_argument('--mask', type=int, choices=range(1, 128), required=True)
    parser.add_argument('--out-root', type=Path, default=base.REPO_ROOT / '.scratch/finamp/manager-2.2.0')
    parser.add_argument('--remote-prefix', default='', help='Fresh alphanumeric filename prefix for shared-storage exports')
    parser.add_argument('--export-directory', choices=('/sdcard/Download', '/sdcard/Download/finamp-manager-test'),
                        default='/sdcard/Download/finamp-manager-test', help='Actual directory selected in Android Save; searching for a source can reset it to Downloads')
    parser.add_argument('--runtime', choices=('jvm', 'art'), required=True)
    parser.add_argument('--available-mask', type=int, choices=(31, 63, 127), default=sum(NAMES),
                        help='Explicit historical/candidate source mask; the current full source is the default')
    parser.add_argument('--from-result', action='store_true')
    parser.add_argument('--recovery', action='store_true', help='Fresh export proving recovery after a rejected input')
    parser.add_argument('--original-apk', type=Path, required=True)
    parser.add_argument('--native-report', type=Path, required=True)
    args = parser.parse_args()
    if args.mask & ~args.available_mask:
        parser.error('Selected patch is absent from this source version')
    names = {bit: name for bit, name in NAMES.items() if bit & args.available_mask}
    base.PACKAGE = 'app.morphe.manager'
    base.OUT_ROOT = args.out_root.expanduser().resolve()
    if not base.OUT_ROOT.is_relative_to((base.REPO_ROOT / '.scratch').resolve()):
        parser.error('--out-root must stay inside this repository scratch directory')
    ui = base.Android(out=base.OUT_ROOT / 'ui', adb=args.adb)
    suffix = '-recovery' if args.recovery else ''
    name = f'manager-mask-{args.mask}-{args.runtime}{suffix}.apk'
    destination = base.OUT_ROOT / 'apks' / name
    if not re.fullmatch(r'[A-Za-z0-9_-]*', args.remote_prefix):
        parser.error('Use a simple shared-storage prefix')
    remote_name = args.remote_prefix + name
    remote = args.export_directory + '/' + remote_name
    if destination.exists() or ui.adb('shell', 'ls', '-d', remote, check=False).strip():
        raise ValueError('Refusing a stale output; use a fresh case')

    def wait_for(label):
        deadline = time.monotonic() + 180
        while time.monotonic() < deadline:
            root, _ = ui.dump()
            try:
                ui.find(root, label)
                return root
            except RuntimeError:
                time.sleep(0.3)
        ui.capture('case-timeout')
        raise RuntimeError('Expected Manager stage absent: ' + label)

    def runtime_lines():
        pid = ui.adb('shell', 'pidof', 'app.morphe.manager').strip()
        text = ui.adb('logcat', '-d', '--pid=' + pid, '-v', 'threadtime')
        return [line for line in text.splitlines() if 'Morphe Patcher: Runtime: name=' in line]

    if args.from_result:
        ui.tap('Home', class_name='android.view.View')
        ui.tap('Finamp', class_name='android.widget.TextView')
        ui.tap('Patch', class_name='android.widget.TextView')
    wait_for('Fix section title validation')
    cache = '/data/user/0/app.morphe.manager/app_original-apks/com.unicornsonlsd.finamp_1.0.1_original.apk'
    if ui.adb('shell', 'su', '0', 'sha256sum', cache).split()[0] != APK_SHA:
        raise ValueError('Manager original-APK cache differs from the official verified input')
    selection_states = configure_selection(ui, names, args.mask)
    ui.capture(f'mask-{args.mask}-{args.runtime}{suffix}-selection')
    previous_runtime = runtime_lines()
    ui.tap('Patch', class_name='android.widget.TextView')
    wait_for('Patched')
    ui.capture(f'mask-{args.mask}-{args.runtime}{suffix}-success')
    lines = runtime_lines()
    if not lines or lines == previous_runtime:
        raise RuntimeError('No new actual patcher invocation recorded')
    runtime = re.search(r'Runtime: name=([a-z]+)', lines[-1]).group(1)
    if runtime != args.runtime:
        raise RuntimeError('Actual runtime differs: ' + runtime)
    ui.tap('Save', class_name='android.view.View')
    base.PACKAGE = 'com.android.documentsui'
    ui.type_text(remote_name, index=0, replace=True)
    ui.tap('SAVE')
    base.PACKAGE = 'app.morphe.manager'
    wait_for('Patched')
    ui.capture(f'mask-{args.mask}-{args.runtime}{suffix}-exported')
    destination.parent.mkdir(exist_ok=True)
    ui.adb('pull', remote, destination, timeout=60)
    native = json.loads(args.native_report.read_text())['masks'][str(args.mask)]['native_sha256']
    contents = check_contents(args.original_apk, destination, native)
    record = {'mask': args.mask, 'runtime': runtime, 'runtime_log': lines[-1], 'ui_success': True,
              'apk_sha256': hashlib.sha256(destination.read_bytes()).hexdigest(), 'native_sha256': native,
              **contents}
    record['recovery'] = args.recovery
    record['available_patch_mask'] = args.available_mask
    record['actual_export_path'] = remote
    record['verified_selection_states'] = selection_states
    (base.OUT_ROOT / f'case-{args.mask}-{args.runtime}{suffix}.json').write_text(json.dumps(record, indent=2) + '\n')
    print(json.dumps(record), flush=True)


if __name__ == '__main__':
    main()
