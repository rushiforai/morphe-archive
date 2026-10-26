#!/usr/bin/env python3
"""Check compatibility metadata, modified DEX and repeated patching, without installation."""
import argparse
import json
import subprocess
import zipfile
from pathlib import Path

PATCH = 'Zoom article images'


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ('java', 'desktop', 'mpp', 'original', 'patched', 'modified-bytecode', 'artifacts'):
        p.add_argument('--' + name, required=True, type=Path)
    a = p.parse_args(); a.artifacts.mkdir(parents=True, exist_ok=True)

    def fixture(label, original, replacement):
        path = a.artifacts / (label + '-input.apk')
        with zipfile.ZipFile(a.original) as src, zipfile.ZipFile(path, 'w') as dst:
            changed = False
            for entry in src.infolist():
                if entry.filename.startswith('META-INF/'): continue
                data = src.read(entry)
                if entry.filename == 'AndroidManifest.xml':
                    for encoding in ('utf-8', 'utf-16le'):
                        old, new = original.encode(encoding), replacement.encode(encoding)
                        if old in data:
                            assert len(old) == len(new)
                            data = data.replace(old, new); changed = True
                dst.writestr(entry, data)
            assert changed, 'Manifest string not found'
        return path

    wrong_version = fixture('wrong-version', '2.25.0', '2.24.0')
    wrong_package = fixture('wrong-package', 'com.nononsenseapps.feeder', 'com.nononsenseapps.feedez')
    results = {}
    for label, apk in [('wrong-version', wrong_version), ('wrong-package', wrong_package),
                       ('already-patched', a.patched), ('modified-bytecode', a.modified_bytecode)]:
        output, report = a.artifacts / (label + '.apk'), a.artifacts / (label + '.json')
        output.unlink(missing_ok=True); report.unlink(missing_ok=True)
        proc = subprocess.run([str(a.java), '-jar', str(a.desktop), 'patch', str(apk), '-p', str(a.mpp),
            '--exclusive', '-e', PATCH, '--unsigned', '-o', str(output), '-r', str(report),
            '-t', str(a.artifacts / (label + '-work'))], capture_output=True, text=True, timeout=180)
        log = proc.stdout + proc.stderr; (a.artifacts / (label + '.log')).write_text(log)
        data = json.loads(report.read_text())
        if label.startswith('wrong-'):
            assert not data['appliedPatches'] and not data['failedPatches'] and 'Applying 0 patches' in log, log
            with zipfile.ZipFile(apk) as before, zipfile.ZipFile(output) as after:
                dex = lambda z: {n: z.read(n) for n in z.namelist() if n.endswith('.dex')}
                assert dex(before) == dex(after), 'Incompatible DEX changed'
        else:
            assert proc.returncode != 0 and not output.exists(), log
            assert 'Unsupported or already patched Feeder bytecode' in log and data['failedPatches'] and not data['appliedPatches'], log
        results[label] = 'PASS'; print('PASS: ' + label, flush=True)
    (a.artifacts / 'summary.json').write_text(json.dumps(results, indent=2) + '\n')


if __name__ == '__main__': main()
