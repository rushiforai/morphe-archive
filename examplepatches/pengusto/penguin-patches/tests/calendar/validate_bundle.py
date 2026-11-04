#!/usr/bin/env python3
"""Validate Calendar patch application in the actual release bundle.

This is a release gate, not a replacement for installed-APK/Manager tests.
It requires the two exact official APKs and Morphe Desktop 1.19.1.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import tempfile

ORIGINALS = {
    '1.12.0': 'd43b2df05d5702bea760a7ab03402977ba72e446e5932038efbdab248a5de987',
    '1.12.1': 'dae815ce83285facf9fd8648b8c4f039700d95126325db124521eba479b270ba',
}
DESKTOP_SHA = 'a51472252cd63b2eac635dbb5a154ff918bfc15268da89679feb3d760230c573'
HTML = 'Readable Calendar descriptions'
REMINDERS = 'Separate all-day reminder defaults'


def sha(path):
    digest = hashlib.sha256()
    with path.open('rb') as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b''):
            digest.update(chunk)
    return digest.hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ('bundle', 'original-120', 'original-121', 'desktop', 'report'):
        parser.add_argument('--' + name, type=Path, required=True)
    a = parser.parse_args()
    assert sha(a.original_120) == ORIGINALS['1.12.0'], 'Unexpected 1.12.0 input'
    assert sha(a.original_121) == ORIGINALS['1.12.1'], 'Unexpected 1.12.1 input'
    assert sha(a.desktop) == DESKTOP_SHA, 'Unexpected Morphe Desktop input'
    java = Path(os.environ.get('JAVA_HOME', '')) / 'bin' / 'java' if os.environ.get('JAVA_HOME') else 'java'
    with tempfile.TemporaryDirectory(prefix='penguin-calendar-release-') as temporary:
        root = Path(temporary)
        outcomes = {}
        for version, original, selected in [
            ('1.12.0', a.original_120, [HTML, REMINDERS]),
            ('1.12.1', a.original_121, [HTML]),
        ]:
            apk, report, scratch = root / (version + '.apk'), root / (version + '.json'), root / (version + '-work')
            command = [str(java), '-jar', str(a.desktop), 'patch', str(original), '-p', str(a.bundle), '--exclusive']
            for patch in selected: command += ['-e', patch]
            command += ['--unsigned', '-o', str(apk), '-r', str(report), '-t', str(scratch)]
            result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, timeout=300)
            assert result.returncode == 0 and report.exists() and apk.is_file(), result.stdout
            data = json.loads(report.read_text())
            assert data.get('success') and data.get('packageName') == 'org.fossify.calendar', data
            assert data.get('packageVersion') == version and set(data.get('appliedPatches', [])) == set(selected), data
            assert not data.get('failedPatches') and all(step.get('success') for step in data.get('stepResults', [])), data
            rejected, rejection = root / (version + '-reapplied.apk'), root / (version + '-reapply.json')
            command = [str(java), '-jar', str(a.desktop), 'patch', str(apk), '-p', str(a.bundle),
                       '--exclusive', '-e', HTML, '--unsigned', '-o', str(rejected), '-r', str(rejection),
                       '-t', str(root / (version + '-reapply-work'))]
            attempt = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, timeout=300)
            assert attempt.returncode != 0 and not rejected.exists() and rejection.exists(), attempt.stdout
            failure = json.loads(rejection.read_text())
            assert not failure.get('success') and failure.get('failedPatches'), failure
            outcomes[version] = {'patches': selected, 'reapplicationRejected': True, 'patchedSha256': sha(apk)}
        summary = {'bundleSha256': sha(a.bundle), 'desktopSha256': DESKTOP_SHA, 'versions': outcomes, 'outcome': 'PASS'}
        a.report.parent.mkdir(parents=True, exist_ok=True)
        a.report.write_text(json.dumps(summary, indent=2) + '\n')
        print(json.dumps(summary, indent=2))


if __name__ == '__main__':
    main()
