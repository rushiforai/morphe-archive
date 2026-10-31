#!/usr/bin/env python3
# SPDX-License-Identifier: GPL-3.0-only
"""Apply every app's patches with each given Morphe Desktop, then re-patch the output.

Catches compatibility guards that depend on the patcher's bundled dexlib2 (v1.0.0 broke
on Manager 2.x / Desktop 1.19 this way). Pass at least one patcher 1.x and one 2.x jar.

Usage: patcher_matrix.py MPP APK_DIR OUT_DIR DESKTOP_JAR [DESKTOP_JAR ...]
APK_DIR holds the original official APKs named <app>.apk (SHA-256 checked below).
Infinity+ needs options and is covered by tests/infinity/.
"""
import hashlib, json, subprocess, sys
from pathlib import Path

APPS = {
    'komikku': ('5dec6178557c89944bf2ef0b5059a5c36a5ab8ebf74dab92fa9281997879d2e2',
                ['Keep local manga in exclusion searches']),
    'calendar': ('d43b2df05d5702bea760a7ab03402977ba72e446e5932038efbdab248a5de987',
                 ['Readable Calendar descriptions', 'Separate all-day reminder defaults']),
    'messages': ('af81e85e0e5442cf22d9669f43ecc42e39737389cff8fe91fd0ef58dab59703d',
                 ['Avoid notifications for visible conversations',
                  'Dismiss notifications when marking conversations read', 'Keep background conversations unread']),
    'clock': ('43cf9f0ec45f1f1ff2df47286622e5b8f3acedaeb07b7f7641b5243dbedca079', ['Choose upcoming alarm notification time']),
    'feeder': ('3e03c3f9fd3ac6131eea56e513b129c71df11dadfccb836221480f9204f50766', ['Zoom article images']),
    'tasks': ('7df9620d84a824a834598843f954943009012d75fbb16572e5ec88a414a576b9', ['Navigate to the parent task']),
    'kvaesitso': ('55e4a287f1198be22f040c2ad1443f5861b58b1d1394d7377221f1ad4448b810',
                  ['Restore widget editing from the search menu']),
    'filemanager': ('c2993c75ea7287e7ede354b061d9c8772aa9b4b050e7660ec1ebc3592dc3d051',
                    ['Keep favorites consistent after folder rename or removal']),
    'contacts': ('6a89be96b5ec39f5e2b11bd61dc7031f4b88261b324ab13af5743fbc62f0cddb', ['Show emails and notes from merged contacts']),
    'music': ('ddac49843267914b39c6340c2b050c0d6a597232d8586a34166cac34d095b1fc', ["Prefer each track's embedded cover"]),
}
# Patches that must reject their own output (class-digest compatibility guards).
GUARDED = {'komikku': 'Keep local manga in exclusion searches',
           'calendar': 'Separate all-day reminder defaults', 'clock': 'Choose upcoming alarm notification time',
           'feeder': 'Zoom article images', 'tasks': 'Navigate to the parent task',
           'kvaesitso': 'Restore widget editing from the search menu'}


def patch(jar, mpp, names, apk, out):
    cmd = ['java', '-Xmx3g', '-jar', str(jar), 'patch', '--exclusive', '-p', str(mpp)]
    for name in names: cmd += ['-e', name]
    report = out.with_suffix('.json')
    subprocess.run(cmd + ['--unsigned', '-o', str(out), '-r', str(report), str(apk)], capture_output=True)
    data = json.loads(report.read_text())
    applied = [p['name'] if isinstance(p, dict) else p for p in data.get('appliedPatches', [])]
    # Desktop 1.18 reports {patch: {name}, reason}; 1.19 reports {name, error}.
    failed = [(f.get('name') or f['patch']['name']) + ': ' + (f.get('error') or f['reason']).splitlines()[0]
              for f in data.get('failedPatches', [])]
    return applied, failed


def main():
    mpp, apks, out, *jars = map(Path, sys.argv[1:])
    assert jars, __doc__
    out.mkdir(parents=True, exist_ok=True)
    for app, (sha, names) in APPS.items():
        apk = apks / f'{app}.apk'
        assert hashlib.sha256(apk.read_bytes()).hexdigest() == sha, f'{apk} is not the original official APK'
        for jar in jars:
            target = out / f'{app}-{jar.stem}.apk'
            applied, failed = patch(jar, mpp, names, apk, target)
            assert not failed and sorted(applied) == sorted(names), f'{app} with {jar.name}: {failed}'
            if app in GUARDED:
                _, failed = patch(jar, mpp, [GUARDED[app]], target, out / f'{app}-{jar.stem}-repatch.apk')
                assert failed and 'already patched' in failed[0], f'{app} with {jar.name} accepted patched input'
            print(f'PASS: {app} with {jar.name}')


if __name__ == '__main__':
    main()
