#!/usr/bin/env python3
"""Reversible cached-input fault injection on ONLY the disposable Manager AVD.

This is separate from the normal APK-picker acceptance. Only the independently
verified original test APK cache is replaced; its bytes/owner/mode are restored
in finally. Patching still starts through Manager's real selected-patch UI.
"""
import argparse
import hashlib
import json
from pathlib import Path
import time
import zipfile

import android_acceptance as base
from build_native_payloads import APK_SHA
from patch_matrix import NAMES
from manager_selection import configure_selection

CACHE = '/data/user/0/app.morphe.manager/app_original-apks/com.unicornsonlsd.finamp_1.0.1_original.apk'
MUTANT = '/sdcard/Download/finamp-manager-test/Finamp-invalid-engine.apk'


def selected_failure(labels, selected):
    """Accept the observed error dialog or diagnostics table, never Unknown."""
    normalized = [label.replace('\u200b', '') for label in labels]
    failed = {label.removeprefix('Failed to apply ') for label in normalized
              if label.startswith('Failed to apply ')}
    failed.update(value for caption, value in zip(normalized, normalized[1:]) if caption == 'Failed patch')
    if len(failed) != 1 or not failed <= set(selected):
        raise AssertionError('Error not attributed to one selected patch')
    return failed.pop()


def verify_mutant(original, mutant):
    if hashlib.sha256(original.read_bytes()).hexdigest() != APK_SHA:
        raise ValueError('Not the pinned official original APK')
    with zipfile.ZipFile(original) as before, zipfile.ZipFile(mutant) as after:
        keep = lambda name: not name.endswith('/') and not name.startswith('META-INF/')
        names = {name for name in before.namelist() if keep(name)}
        if names != {name for name in after.namelist() if keep(name)}:
            raise ValueError('Fault fixture must keep the original APK entries')
        changed = {name for name in names if before.read(name) != after.read(name)}
        if changed != {'lib/arm64-v8a/libflutter.so'}:
            raise ValueError('Only the ARM64 engine may differ in this fixture')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--adb', type=Path, required=True)
    parser.add_argument('--mask', type=int, choices=range(1, 128), default=31)
    parser.add_argument('--out-root', type=Path, default=base.REPO_ROOT / '.scratch/finamp/manager-2.2.0')
    parser.add_argument('--mutant-apk', type=Path, required=True)
    parser.add_argument('--original-apk', type=Path, required=True)
    args = parser.parse_args()
    verify_mutant(args.original_apk, args.mutant_apk)
    base.PACKAGE = 'app.morphe.manager'
    base.OUT_ROOT = args.out_root.expanduser().resolve()
    if not base.OUT_ROOT.is_relative_to((base.REPO_ROOT / '.scratch').resolve()):
        parser.error('--out-root must stay inside this repository scratch directory')
    ui = base.Android(out=base.OUT_ROOT / 'ui', adb=args.adb)
    expected_mutant = hashlib.sha256(args.mutant_apk.read_bytes()).hexdigest()
    def runtime_lines():
        pid = ui.adb('shell', 'pidof', 'app.morphe.manager').strip()
        log = ui.adb('logcat', '-d', '--pid=' + pid, '-v', 'threadtime')
        return [line for line in log.splitlines() if 'Morphe Patcher: Runtime: name=' in line]
    previous_runtime = runtime_lines()
    sha = lambda path: ui.adb('shell', 'su', '0', 'sha256sum', path).split()[0]
    if sha(CACHE) != APK_SHA or sha(MUTANT) != expected_mutant:
        raise ValueError('Fault fixture/cache identity mismatch; nothing changed')
    backup = CACHE + '.acceptance-backup'
    if ui.adb('shell', 'su', '0', 'ls', '-d', backup, check=False).strip():
        raise ValueError('Backup already exists; inspect instead of overwriting it')
    metadata = ui.adb('shell', 'su', '0', 'stat', '-c', '%u:%g:%a', CACHE).strip()
    ui.adb('shell', 'su', '0', 'cp', CACHE, backup)
    assert sha(backup) == APK_SHA
    report = {'method': 'controlled original-test-APK cache fault; not an APK-picker test',
              'original_cache_sha256': APK_SHA, 'fault_input_sha256': expected_mutant,
              'database_or_key_manually_modified': False, 'installed': False}
    try:
        ui.adb('shell', 'su', '0', 'cp', MUTANT, CACHE)
        assert sha(CACHE) == expected_mutant
        ui.tap('Finamp', class_name='android.widget.TextView')
        ui.tap('Patch', class_name='android.widget.TextView')
        report['verified_selection_states'] = configure_selection(ui, NAMES, args.mask)
        ui.capture('fault-art-selection')
        ui.tap('Patch', class_name='android.widget.TextView')
        deadline = time.monotonic() + 120
        while time.monotonic() < deadline:
            root, _ = ui.dump()
            labels = [n.get('text') or n.get('content-desc') or '' for n in root.iter('node')]
            if any(any(word in label.lower() for word in ('failed', 'error', 'went wrong')) for label in labels):
                if 'Patched' in labels or 'Install' in labels or 'Save' in labels:
                    raise AssertionError('Failure surface still exposes a successful output action')
                ui.capture('fault-art-error')
                report['failure_visible'] = True
                report['success_actions_absent'] = True
                report['labels'] = [label for label in labels if label]
                normalized = [label.replace('\u200b', '') for label in labels]
                failed = selected_failure(normalized, [name for bit, name in NAMES.items() if args.mask & bit])
                assert any('unsupported ARM64 libflutter.so' in label for label in normalized)
                runtime = runtime_lines()
                assert runtime != previous_runtime and 'name=art ' in runtime[-1], 'No new ART invocation'
                report.update(selected_failed_patch=failed, guard='unsupported ARM64 libflutter.so',
                              runtime='art', runtime_log=runtime[-1])
                break
            time.sleep(0.3)
        else:
            ui.capture('fault-no-error')
            raise AssertionError('No explicit failure surface after the corrupted input')
    finally:
        ui.adb('shell', 'su', '0', 'cp', backup, CACHE)
        report['original_cache_restored'] = sha(CACHE) == APK_SHA
        report['owner_mode_restored'] = ui.adb('shell', 'su', '0', 'stat', '-c', '%u:%g:%a', CACHE).strip() == metadata
        (base.OUT_ROOT / 'fault-art.json').write_text(json.dumps(report, indent=2) + '\n')
        if report['original_cache_restored'] and report['owner_mode_restored']:
            ui.adb('shell', 'su', '0', 'rm', backup)
        else:
            raise AssertionError('Original cache restoration failed; backup retained')
    print('Visible Manager failure; original cache bytes, owner and mode restored')


if __name__ == '__main__':
    main()
