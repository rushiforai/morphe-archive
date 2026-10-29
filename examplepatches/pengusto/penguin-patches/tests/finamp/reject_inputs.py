#!/usr/bin/env python3
"""Prove version/native guards fail closed through the real Morphe CLI."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import shutil
import zipfile

from build_native_payloads import APK_SHA
from patch_matrix import NAMES


def mutant(source, destination, kind):
    with zipfile.ZipFile(source) as original, zipfile.ZipFile(destination, 'w') as output:
        for item in original.infolist():
            if kind == 'missing-arm64' and item.filename == 'lib/arm64-v8a/libapp.so':
                continue
            data = original.read(item)
            target = {'wrong-app': 'lib/arm64-v8a/libapp.so', 'wrong-engine': 'lib/arm64-v8a/libflutter.so'}.get(kind)
            if item.filename == target:
                data = data[:256] + bytes([data[256] ^ 1]) + data[257:]
            if kind == 'wrong-version' and item.filename == 'AndroidManifest.xml':
                candidates = [(b'1.0.1', b'1.0.2'), ('1.0.1'.encode('utf-16le'), '1.0.2'.encode('utf-16le'))]
                matches = [(old, new) for old, new in candidates if data.count(old) == 1]
                if len(matches) != 1:
                    raise ValueError('Cannot safely identify the original version-name string')
                data = data.replace(*matches[0], 1)
            output.writestr(item, data)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ['java', 'desktop', 'bundle', 'original-apk', 'output-dir']:
        parser.add_argument('--' + name, type=Path, required=True)
    parser.add_argument('--discard-verified-inputs', action='store_true',
                        help='After recording a complete successful rejection, discard that owned mutant APK and work directory')
    args = parser.parse_args()
    if hashlib.sha256(args.original_apk.read_bytes()).hexdigest() != APK_SHA:
        raise ValueError('Wrong official APK input')
    output = args.output_dir.resolve()
    if output.exists():
        raise ValueError('Choose a fresh negative-test output directory')
    output.mkdir(parents=True)
    results = {}
    cases = [('wrong-app', 'unsupported or already patched ARM64 libapp.so'),
             ('wrong-engine', 'unsupported ARM64 libflutter.so'),
             ('missing-arm64', 'missing required ARM64 libapp.so'),
             ('wrong-version', 'unsupported app; use the original official Finamp 1.0.1 APK')]
    for kind, expected in cases:
        apk = output / (kind + '.apk')
        mutant(args.original_apk, apk, kind)
        result = output / (kind + '-patcher.json')
        target = output / (kind + '-output.apk')
        command = [str(args.java.resolve()), '-Xmx3g', '-jar', str(args.desktop.resolve()), 'patch', str(apk),
                   '-p', str(args.bundle.resolve()), '--exclusive', '--force', '--unsigned',
                   '-o', str(target), '-r', str(result), '-t', str(output / (kind + '-work'))]
        for name in NAMES.values():
            command += ['-e', name]
        completed = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
        (output / (kind + '.log')).write_text(completed.stdout)
        if expected not in completed.stdout or target.exists():
            raise ValueError('Unsafe or unexpected rejection for ' + kind + ': ' + completed.stdout[-1200:])
        status = json.loads(result.read_text())
        if completed.returncode == 0 or not status.get('failedPatches'):
            raise ValueError('Failure was not signaled for ' + kind)
        failed_names = [
            failure if isinstance(failure, str) else failure.get('name', failure.get('patch', {}).get('name'))
            for failure in status.get('failedPatches', [])]
        selected_failures = sorted(set(failed_names) & set(NAMES.values()))
        if not selected_failures:
            # Manager 2.x ignores unselected dependency failures. "Unknown" is
            # insufficient even if Desktop itself aborts without an output.
            raise ValueError('Guard failure is not attributed to a selected patch for ' + kind)
        results[kind] = {'rejected': True, 'output_created': False, 'exit_code': completed.returncode,
                         'mutant_sha256': hashlib.sha256(apk.read_bytes()).hexdigest(), 'guard': expected,
                         'patcher_report_json_valid': True, 'selected_failure_names': selected_failures,
                         'mutant_retained': not args.discard_verified_inputs}
        checkpoint = output / 'rejection-report.json.tmp'
        checkpoint.write_text(json.dumps(results, indent=2) + '\n')
        checkpoint.replace(output / 'rejection-report.json')
        if args.discard_verified_inputs:
            apk.unlink()
            temporary = output / (kind + '-work')
            if temporary.is_dir():
                shutil.rmtree(temporary)
        print('Verified fail-closed guard: ' + kind, flush=True)


if __name__ == '__main__':
    main()
