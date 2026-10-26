#!/usr/bin/env python3
"""Verify Clock compatibility gates, option bounds and an already patched input."""
import argparse
import json
import re
import subprocess
import zipfile
from pathlib import Path

PATCH = 'Choose upcoming alarm notification time'


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ('java', 'desktop', 'mpp', 'original', 'patched', 'wrong-version', 'wrong-package', 'artifacts'):
        p.add_argument('--' + name, type=Path, required=True)
    a = p.parse_args(); a.artifacts.mkdir(parents=True, exist_ok=True)
    results = {}
    for label, apk, value in [('already-patched', a.patched, 120),
                              ('wrong-version', a.wrong_version, 120), ('wrong-package', a.wrong_package, 120),
                              *[('invalid-' + str(v), a.original, v) for v in (0, -1, 1441)]]:
        output, report = a.artifacts / (label + '.apk'), a.artifacts / (label + '.json')
        output.unlink(missing_ok=True); report.unlink(missing_ok=True)
        proc = subprocess.run([str(a.java), '-jar', str(a.desktop), 'patch', str(apk),
            '-p', str(a.mpp), '--exclusive', '-e', PATCH, '-O', 'leadMinutes=' + str(value),
            '--unsigned', '-o', str(output), '-r', str(report), '-t', str(a.artifacts / (label + '-work'))],
            capture_output=True, text=True, timeout=180)
        log = proc.stdout + proc.stderr
        (a.artifacts / (label + '.log')).write_text(log)
        if label.startswith('wrong-'):
            data = json.loads(report.read_text())
            assert not data['appliedPatches'] and not data['failedPatches'] and 'Applying 0 patches' in log, log
            with zipfile.ZipFile(apk) as original, zipfile.ZipFile(output) as rebuilt:
                dex = lambda z: {n: z.read(n) for n in z.namelist() if n.endswith('.dex')}
                assert dex(original) == dex(rebuilt), 'Incompatible input bytecode changed'
        elif label == 'already-patched':
            assert not output.exists() and 'Unsupported or already patched Clock bytecode' in log, log
            data = json.loads(report.read_text())
            assert data['failedPatches'] and not data['appliedPatches'], data
        else:
            assert not output.exists() and re.search(r'validat|invalid', log, re.I) and 'leadMinutes' in log, log
        results[label] = 'PASS'; print('PASS: ' + label, flush=True)
    (a.artifacts / 'summary.json').write_text(json.dumps(results, indent=2) + '\n')


if __name__ == '__main__': main()
