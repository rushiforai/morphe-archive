#!/usr/bin/env python3
"""Release gate: exact official Mihon input, real patcher, bounded export, reject reapply."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import tempfile

APK_SHA = '0026bd25ce5b1c6bdc5bd2c9589a08a811ddc4fa7c994cf937729d5b7010619d'
DESKTOP_SHA = 'a51472252cd63b2eac635dbb5a154ff918bfc15268da89679feb3d760230c573'
PATCH = 'Preserve excluded Default-category downloads'


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ('bundle', 'original-apk', 'desktop', 'report'): p.add_argument('--' + name, type=Path, required=True)
    a = p.parse_args()
    for file, sha in ((a.original_apk, APK_SHA), (a.desktop, DESKTOP_SHA)):
        if hashlib.sha256(file.read_bytes()).hexdigest() != sha: p.error('Unverified input: ' + str(file))
    a.bundle = a.bundle.resolve(); a.desktop = a.desktop.resolve(); a.original_apk = a.original_apk.resolve()
    with tempfile.TemporaryDirectory(prefix='mihon-release-') as tmp:
        tmp = Path(tmp)
        def patch(source, label):
            target = tmp / (label + '.apk'); report = tmp / (label + '.json')
            cmd = ['java', '-Xmx2g', '-jar', str(a.desktop), 'patch', '--exclusive', '-p', str(a.bundle),
                   '-e', PATCH, '--unsigned', '-o', str(target), '-r', str(report), str(source)]
            result = subprocess.run(cmd, capture_output=True, text=True, timeout=180)
            if not report.is_file(): raise RuntimeError('Patcher did not produce a report: ' + result.stderr[-2000:])
            return target, json.loads(report.read_text())
        output, applied = patch(a.original_apk, 'applied')
        assert applied['success'] and applied['appliedPatches'] == [PATCH] and not applied['failedPatches'], applied
        verification = subprocess.run(['java', '-Xmx2g', '-cp', str(a.bundle) + ':' + str(a.desktop),
            str(Path(__file__).with_name('VerifyExport.java')), str(a.original_apk), str(output)],
            capture_output=True, text=True, timeout=120)
        if verification.returncode: raise RuntimeError(verification.stdout + verification.stderr)
        rejected_output, rejected = patch(output, 'rejected')
        assert not rejected['success'] and not rejected['appliedPatches'] and len(rejected['failedPatches']) == 1, rejected
        assert 'Unsupported or already patched' in rejected['failedPatches'][0]['error'], rejected
        assert not rejected_output.exists(), 'Rejected input produced an export'
        record = {'bundleSha256': hashlib.sha256(a.bundle.read_bytes()).hexdigest(), 'originalSha256': APK_SHA,
            'desktopSha256': DESKTOP_SHA, 'applied': True, 'reapplyRejected': True,
            'boundedExportVerification': verification.stdout.strip()}
        a.report.parent.mkdir(parents=True, exist_ok=True)
        a.report.write_text(json.dumps(record, indent=2) + '\n')
        print(json.dumps(record))


if __name__ == '__main__': main()
