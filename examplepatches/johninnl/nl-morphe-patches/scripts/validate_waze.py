#!/usr/bin/env python3
"""Apply the Waze catalog together and independently to the supplied 5.26.90.901 APKM.

Requires a built MPP and the Morphe desktop CLI. Keeps reports and logs in --output;
does not install anything or change release metadata.
"""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import zipfile


PATCHES = (
    'Alert distances', 'All moods', 'Allow high refresh rate', 'Auto zoom', 'Average speed zone bar', 'Bigger alert pins',
    'Bigger speedometer', 'Broadcast navigation data', 'Car alerts as notifications',
    'Car reconnect grace period', 'Car traffic meter', 'Change app name', 'Extra map info', 'Flock cameras', 'Full black',
    'Hide ads', 'Hide recent destinations', 'Lane guidance', 'Map skin', 'Native camera and hazard controls', 'Navigation distances', 'No AI reporting',
    'No Google Assistant', 'Open without device location', 'Remove permissions',
    'Remove sign-in prompts', 'Remove telemetry', 'Report speed limit',
    'Share alerts with Maps', 'Skip consent screens', 'SoundCloud in Waze', 'Speed bump controls', 'Speed camera alerts',
    'Speed camera sound at any speed', 'Speed cameras everywhere',
    'Speed limit controls', 'Speed limit sign', 'Stay awake in the background',
    'Support Gearslip', 'YT Music Morphe in Waze',
)


def check_report(report, expected):
    """The CLI may report success=true even when --continue-on-error skipped patches."""
    if (not report.get('success') or report.get('failedPatches')
            or not {'PATCHING', 'REBUILDING'} <= {step['step'] for step in report.get('stepResults', [])}
            or any(not step['success'] for step in report.get('stepResults', []))
            or set(report.get('appliedPatches', [])) != set(expected)):
        raise ValueError('Incomplete patch run: ' + json.dumps(report))
    if (report.get('packageName'), report.get('packageVersion')) != ('com.waze', '5.26.90.901'):
        raise ValueError('Unexpected Waze target')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('apkm', type=Path)
    parser.add_argument('mpp', type=Path)
    parser.add_argument('cli', type=Path)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--combined-only', action='store_true')
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    base = args.output / 'base.apk'
    with zipfile.ZipFile(args.apkm) as archive:
        base.write_bytes(archive.read('base.apk'))
    runs = [('combined', PATCHES)]
    if not args.combined_only:
        runs.extend((f'{i:02d}', (name,)) for i, name in enumerate(PATCHES))
    for label, names in runs:
        report_path = args.output / f'{label}.json'
        apk = args.output / f'{label}.apk'
        command = ['java', '-jar', str(args.cli.resolve()), 'patch', str(base.resolve()),
                   '-p', str(args.mpp.resolve()), '--exclusive', '--validate', '--unsigned',
                   '-o', str(apk.resolve()), '-r', str(report_path.resolve())]
        for name in names:
            command.extend(['-e', name])
        with (args.output / f'{label}.log').open('w') as log:
            subprocess.run(command, stdout=log, stderr=subprocess.STDOUT, check=True)
        check_report(json.loads(report_path.read_text()), names)
        print(f'PASS {label}: {", ".join(names)}', flush=True)
        if label != 'combined':
            apk.unlink()
    with args.apkm.open('rb') as source, args.mpp.open('rb') as bundle:
        apkm_hash = hashlib.file_digest(source, 'sha256').hexdigest()
        bundle_hash = hashlib.file_digest(bundle, 'sha256').hexdigest()
    evidence = {
        'target': 'com.waze 5.26.90.901',
        'apkm_sha256': apkm_hash,
        'mpp_sha256': bundle_hash,
        'patches': list(PATCHES), 'runs': len(runs),
        'runtime_verified': False,
    }
    (args.output / 'summary.json').write_text(json.dumps(evidence, indent=2) + '\n')


if __name__ == '__main__':
    main()
