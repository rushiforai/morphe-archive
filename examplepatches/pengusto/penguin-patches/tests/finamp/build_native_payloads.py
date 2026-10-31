#!/usr/bin/env python3
"""Rebuild pinned Finamp ARM64 snapshots and generate verified Morphe deltas.

Requires bsdiff4==1.2.6 in this Python environment. The original APK is never
modified. A dedicated local clone under --work-dir is used for the builds.
"""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import time
import zipfile

from pfd import apply_delta, make_delta

ROOT = Path(__file__).resolve().parents[2]
APK_SHA = '0fc61e5cb80d37b10a735851c2217cbc855b3f1a04bde577187658531ffef581'
LIBRARY_SHA = '83de04b43bfcad7f1ae9aa69b433044f409d89957cccdc9deb6b6b0e85789607'
ENGINE_SHA = 'd70bbedc2b157630f90123a32ca894a6fa1816ec10cda9f335bada0692b376ee'
FLUTTER_REV = 'd3b14c876900e553bc736ca19295fc09e3853e8e'
ENGINE_REV = 'a804b261645ef8c13eb3d5c44a5c2fb0340c5539'
SNAPSHOT = re.compile(rb'\xf5\xf5\xdc\xdc.{16}([0-9a-f]{32})([^\x00]*)\x00', re.S)
MASKS = range(1, 128)

PRODUCTION = ROOT / 'patches/src/main/resources/finamp/1.0.1'


def payload_output(masks, requested, work):
    complete = set(masks) == set(MASKS)
    destination = (requested or (PRODUCTION if complete else work / 'partial-payloads')).resolve()
    if not complete and (destination == PRODUCTION.resolve() or PRODUCTION.resolve() in destination.parents):
        raise ValueError('Partial rebuilds must use a private output directory')
    return destination


def sha(data):
    return hashlib.sha256(data).hexdigest()


def run(command, cwd=None, log=None):
    if log is None:
        return subprocess.check_output(command, cwd=cwd, text=True).strip()
    with log.open('w') as output:
        subprocess.run(command, cwd=cwd, stdout=output, stderr=subprocess.STDOUT, check=True)


def source_test_receipt(log):
    counts = re.findall(rb'\+(\d+): All tests passed!', log)
    if len(counts) != 1 or int(counts[0]) <= 0:
        raise ValueError('Missing successful expanded Flutter source-test summary')
    return {'passed': int(counts[0]), 'log_sha256': sha(log)}


def verify_receipts(receipts, matrix, output, original, test_logs=None):
    """Resume only hash-bound completed payloads with the same pinned source."""
    for key, receipt in receipts.items():
        if int(key) not in MASKS or receipt['source'] != matrix['masks'][key]['commit']:
            raise ValueError('Resume source does not match the pinned matrix')
        delta = (output / f'arm64-v8a/{key}.pfd').read_bytes()
        replay = apply_delta(original, delta)
        if (sha(delta) != receipt['delta_sha256'] or sha(replay) != receipt['native_sha256']
                or len(delta) != receipt['delta_bytes'] or len(replay) != receipt['native_bytes']):
            raise ValueError('Resume payload does not match its completed receipt')
        if test_logs is not None:
            log = (test_logs / f'test-{key}.log').read_bytes()
            if receipt.get('source_tests') != source_test_receipt(log):
                raise ValueError('Resume requires matching successful source-test evidence')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    for name in ['source-repo', 'source-matrix', 'flutter', 'original-apk', 'strip', 'work-dir']:
        parser.add_argument('--' + name, type=Path, required=True)
    parser.add_argument('--output', type=Path)
    parser.add_argument('--masks', default=','.join(map(str, MASKS)))
    parser.add_argument('--resume', action='store_true', help='Recheck and reuse completed receipts in this owned worker')
    parser.add_argument('--discard-intermediates', action='store_true', help='Discard compiled libraries after verified delta/checkpoint writes')
    parser.add_argument('--test-source', action='store_true', help='Run every selected source tree\'s complete Flutter suite before compilation; require its hash-bound log on resume')
    args = parser.parse_args()
    masks = [int(value) for value in args.masks.split(',')]
    if not masks or len(set(masks)) != len(masks) or any(mask not in MASKS for mask in masks):
        raise ValueError('Select unique source masks 1..127')
    output = payload_output(masks, args.output, args.work_dir.resolve())
    flutter = args.flutter.resolve()
    versions = json.loads(run([str(flutter), '--version', '--machine']))
    if versions['frameworkRevision'] != FLUTTER_REV or versions['engineRevision'] != ENGINE_REV or versions['dartSdkVersion'] != '3.13.2':
        raise ValueError('Use the verified Flutter3.47.2 / Dart3.13.2 / a804b261 engine')
    original = args.original_apk.read_bytes()
    if sha(original) != APK_SHA:
        raise ValueError('Original official universal APK SHA-256 mismatch')
    with zipfile.ZipFile(args.original_apk) as archive:
        old = archive.read('lib/arm64-v8a/libapp.so')
        if sha(old) != LIBRARY_SHA or sha(archive.read('lib/arm64-v8a/libflutter.so')) != ENGINE_SHA:
            raise ValueError('Unsupported original native libraries')
    original_header = SNAPSHOT.search(old)
    if original_header is None:
        raise ValueError('Missing original Dart snapshot header')
    matrix = json.loads(args.source_matrix.read_text())
    if matrix['base'] != '65c1a78b1d04dd8525825ecdf2cf39c7442b51e9' or matrix['flutter'] != FLUTTER_REV:
        raise ValueError('Unsupported source matrix')
    work = args.work_dir.resolve()
    work.mkdir(parents=True, exist_ok=True)
    source = work / 'source'
    source_repo = args.source_repo.resolve()
    owner = work / 'build-source-owner.json'
    if not source.exists():
        run(['git', 'clone', '--quiet', '--shared', '--no-checkout', str(source_repo), str(source)])
        owner.write_text(json.dumps({'source_repo': str(source_repo)}) + '\n')
    elif not owner.exists() or json.loads(owner.read_text())['source_repo'] != str(source_repo):
        raise ValueError('Refusing to modify an unrecognized build source checkout')
    if not (source / '.git/index').exists():
        # A --no-checkout clone has an intentionally empty index, not user edits.
        run(['git', 'checkout', '--quiet', '--detach', matrix['masks'][str(masks[0])]['commit']], cwd=source)
    output.mkdir(parents=True, exist_ok=True)
    libraries = work / 'libraries'
    libraries.mkdir(exist_ok=True)
    report = {'original_apk_sha256': APK_SHA, 'original_native_sha256': LIBRARY_SHA,
              'flutter': versions, 'masks': {}}
    report_path = work / 'native-build-report.json'
    if args.resume and report_path.exists():
        previous = json.loads(report_path.read_text())
        if any(previous.get(key) != report[key] for key in report if key != 'masks'):
            raise ValueError('Resume receipt belongs to different input/toolchain')
        verify_receipts(previous['masks'], matrix, output, old, work if args.test_source else None)
        report['masks'].update(previous['masks'])
    manifest_path = output / 'manifest.properties'
    if set(masks) == set(MASKS) and manifest_path.exists():
        manifest_path.unlink()  # A failed/incomplete rebuild cannot leave a stale publishable manifest.
    properties = ['schema=1', 'package=com.unicornsonlsd.finamp', 'version=1.0.1',
                  'flutter=3.47.2', 'dart=3.13.2', 'abi.arm64-v8a.base.sha256=' + LIBRARY_SHA,
                  'abi.arm64-v8a.engine.sha256=' + ENGINE_SHA]
    for mask in masks:
        if str(mask) in report['masks']:
            print(json.dumps({'mask': mask, 'reused_verified_receipt': True}), flush=True)
            continue
        if shutil.disk_usage(work).free < 2 * 1024**3:
            raise ValueError('Worker stopped before build: preserve at least 2 GiB of free disk space')
        started = time.monotonic()
        revision = matrix['masks'][str(mask)]['commit']
        if run(['git', 'status', '--porcelain', '--untracked-files=no'], cwd=source):
            raise ValueError('Build source has unexpected tracked changes')
        run(['git', 'checkout', '--quiet', '--detach', revision], cwd=source)
        if run(['git', 'rev-parse', 'HEAD^{tree}'], cwd=source) != matrix['masks'][str(mask)]['tree']:
            raise ValueError(f'Pinned source tree mismatch for mask {mask}')
        run([str(flutter), 'pub', 'get', '--enforce-lockfile'], cwd=source, log=work / f'pub-{mask}.log')
        run([str(flutter), 'gen-l10n'], cwd=source, log=work / f'l10n-{mask}.log')
        tested = None
        if args.test_source:
            test_log = work / f'test-{mask}.log'
            run([str(flutter), 'test', '--no-pub', '--reporter', 'expanded'], cwd=source, log=test_log)
            tested = source_test_receipt(test_log.read_bytes())
        # Output paths participate in Flutter's cache key. Reuse a fixed path
        # inside this worker, rather than retaining a kernel/AOT cache per mask.
        bundle = source / 'build/native-current'
        run([str(flutter), 'assemble', '--no-version-check', '--resource-pool-size=1', f'--output={bundle}',
             '-dTargetPlatform=android-arm64', '-dBuildMode=release', '-dTargetFile=lib/main.dart',
             '-dDartObfuscation=false', '-dTrackWidgetCreation=false', '-dTreeShakeIcons=false',
             '-dExtraGenSnapshotOptions=--deterministic', 'android_aot_bundle_release_android-arm64'],
            cwd=source, log=work / f'aot-{mask}.log')
        library = libraries / f'{mask}.so'
        shutil.copyfile(bundle / 'arm64-v8a/app.so', library)
        run([str(args.strip.resolve()), '--strip-unneeded', str(library)])
        new = library.read_bytes()
        header = SNAPSHOT.search(new)
        if header is None or header.groups() != original_header.groups():
            raise ValueError(f'Incompatible snapshot version/features for mask {mask}')
        if (b'Song artist order' in new) != bool(mask & 2) or (b'Invalid artist track count' in new) != bool(mask & 4):
            raise ValueError(f'Compiled feature markers do not match mask {mask}')
        if run(['git', 'status', '--porcelain', '--untracked-files=no'], cwd=source):
            raise ValueError('Build changed committed source or dependency lock')
        delta = make_delta(old, new)
        if apply_delta(old, delta) != new:
            raise ValueError('Native delta replay failed')
        destination = output / f'arm64-v8a/{mask}.pfd'
        destination.parent.mkdir(exist_ok=True)
        temporary = destination.with_suffix('.pfd.tmp')
        temporary.write_bytes(delta)
        temporary.replace(destination)
        record = {'source': revision, 'native_sha256': sha(new), 'native_bytes': len(new),
                  'delta_sha256': sha(delta), 'delta_bytes': len(delta), 'seconds': round(time.monotonic() - started, 2)}
        if tested is not None:
            record['source_tests'] = tested
        report['masks'][str(mask)] = record
        temporary_report = report_path.with_suffix('.json.tmp')
        temporary_report.write_text(json.dumps(report, indent=2) + '\n')
        temporary_report.replace(report_path)
        print(json.dumps({'mask': mask, **record}), flush=True)
        if args.discard_intermediates:
            library.unlink()
            shutil.rmtree(bundle)
    # A partial developer run is not a publishable matrix; never overwrite the production manifest.
    for mask in masks:
        receipt = report['masks'][str(mask)]
        prefix = f'abi.arm64-v8a.mask.{mask}'
        properties.extend([prefix + '.sha256=' + receipt['native_sha256'],
                           prefix + '.size=' + str(receipt['native_bytes']),
                           prefix + f'.resource=finamp/1.0.1/arm64-v8a/{mask}.pfd',
                           prefix + '.source=' + receipt['source']])
    if set(masks) == set(MASKS):
        manifest_path.write_text('\n'.join(properties) + '\n')
    else:
        (work / 'partial-manifest.properties').write_text('\n'.join(properties) + '\n')


if __name__ == '__main__':
    main()
