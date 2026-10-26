#!/usr/bin/env python3
"""Check that the Morphe patch refuses modified and incompatible APKs locally."""
import argparse
import json
import subprocess
import zipfile
from pathlib import Path


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ('java', 'desktop', 'mpp', 'patched', 'native-release', 'debug', 'artifacts'):
        p.add_argument('--' + name, type=Path, required=True)
    a = p.parse_args()
    a.artifacts.mkdir(parents=True, exist_ok=True)
    for label, apk, bytecode in (
        ('already-patched', a.patched, True),
        ('rebuilt-native', a.native_release, True),
        ('wrong-package', a.debug, False),
    ):
        assert apk.is_file(), apk
        report = a.artifacts / (label + '.json')
        output = a.artifacts / (label + '.apk')
        report.unlink(missing_ok=True)
        output.unlink(missing_ok=True)
        result = subprocess.run([
            str(a.java), '-jar', str(a.desktop), 'patch', str(apk), '-p', str(a.mpp),
            '--exclusive', '-e', 'Restore widget editing from the search menu', '--unsigned',
            '-o', str(output), '-r', str(report), '-t', str(a.artifacts / (label + '-work')),
        ], capture_output=True, text=True, timeout=180)
        log = result.stdout + result.stderr
        (a.artifacts / (label + '.log')).write_text(log)
        data = json.loads(report.read_text())
        if bytecode:
            assert not output.exists(), 'Unexpected patched output for ' + label
            assert 'Unsupported or already patched Kvaesitso bytecode' in log, log
            assert data['failedPatches'] and not data['appliedPatches'], data
        else:
            # Desktop rebuilds even when compatibility selects zero patches.
            assert not data['appliedPatches'] and not data['failedPatches'], data
            assert 'Applying 0 patches' in log, log
            with zipfile.ZipFile(apk) as original, zipfile.ZipFile(output) as rebuilt:
                dex = lambda z: {n: z.read(n) for n in z.namelist() if n.endswith('.dex')}
                assert dex(original) == dex(rebuilt), 'Wrong-package DEX changed'
        print('PASS: rejected ' + label, flush=True)


if __name__ == '__main__':
    main()
