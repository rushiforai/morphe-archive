#!/usr/bin/env python3
"""Build a private three-hook Vela experiment, never a release patch/APK."""
import argparse
import copy
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import zipfile

import inspect_bindings

HELPER = 'Lnl/johninnl/warningprobe/TaggedSpeechFence;'
CTOR = 'Lpn1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZLjava/lang/Object;B)V'
DISPATCH = 'Lpn1;->invoke()Ljava/lang/Object;'
STOP = 'Lwy4;->n()V'


def without_shifted_catches(rows, shift):
    rows = copy.deepcopy(rows)
    for row in rows:
        if row[0] == 'try':
            row[1] -= shift
            for handler in row[3]:
                handler[1] -= shift
    return rows


def verify_edits(original, candidate):
    """Prove the exact inserted operations; every original instruction survives."""
    if original['enums'] != candidate['enums'] or original['methods'].keys() != candidate['methods'].keys():
        raise ValueError('Private fence changed the native contract inventory')
    for name, before in original['methods'].items():
        after = candidate['methods'][name]
        expected_dex = 'classes3.dex' if name.startswith(('Lwy4;->', 'Lpn1;->')) else before['dex']
        if after['dex'] != expected_dex:
            raise ValueError(f'Unexpected private spike DEX relocation: {name}')
        for key in ['access_flags', 'register_count']:
            if before[key] != after[key]:
                raise ValueError(f'Private fence changed native ABI: {name}.{key}')
        first = before['instructions_and_catches']
        second = after['instructions_and_catches']
        if name == CTOR:
            index = next(i for i, row in enumerate(first) if row[0] == 'RETURN_VOID')
            receiver = before['register_count'] - 7
            wanted = ['INVOKE_STATIC_RANGE', 3, ['range', receiver, 1],
                      ['reference', HELPER + '->capture(Ljava/lang/Object;)V']]
            valid = second == first[:index] + [wanted] + first[index:]
        elif name == STOP:
            receiver = before['register_count'] - 1
            wanted = ['INVOKE_STATIC_RANGE', 3, ['range', receiver, 1],
                      ['reference', HELPER + '->invalidate(Ljava/lang/Object;)V']]
            valid = second[0] == wanted and without_shifted_catches(second[1:], 3) == first
        elif name == DISPATCH:
            prefix = [
                ['INVOKE_STATIC_RANGE', 3, ['range', 9, 1], ['reference', HELPER + '->allow(Ljava/lang/Object;)Z']],
                ['MOVE_RESULT', 1, ['a', 0]], ['IF_NEZ', 2, ['a', 0], ['offset', 6]],
                ['SGET_OBJECT', 2, ['a', 0], ['reference', 'Ler4;->a:Ler4;']],
                ['RETURN_OBJECT', 1, ['a', 0]], ['NOP', 1]]
            valid = second[:6] == prefix and without_shifted_catches(second[6:], 10) == first
        else:
            original_metadata = dict(before, dex=expected_dex)
            valid = original_metadata == after
        if not valid:
            raise ValueError(f'Unexpected private fence instructions: {name}')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--sdk', type=Path, required=True)
    parser.add_argument('--original', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--key', type=Path, required=True)
    args = parser.parse_args()
    source = Path(__file__).resolve().parent
    root = source.parents[1]
    output = args.output
    output.mkdir(parents=True, exist_ok=True)
    fixture = root / 'tests/fixtures/navigation-warnings'
    selection = fixture / 'vela-selection.json'
    original = inspect_bindings.inspect(args.original, selection)
    inspect_bindings.verify_contract(original, json.loads((fixture / 'vela-contract.json').read_text()))
    detailed = json.loads(selection.read_text())
    detailed['include_instructions'] = True
    detail_selection = output / 'detail-selection.json'
    detail_selection.write_text(json.dumps(detailed))
    original_detail = inspect_bindings.inspect(args.original, detail_selection)
    jars = inspect_bindings.resolve_classpath()
    tools = args.sdk / 'build-tools/36.0.0'
    android = args.sdk / 'platforms/android-36/android.jar'
    classes, helper, tooling = output / 'helper-classes', output / 'helper-dex', output / 'tool-classes'
    for path in [classes, helper, tooling]:
        path.mkdir(exist_ok=True)

    def run(*command):
        subprocess.run([str(item) for item in command], check=True)

    run('javac', '--release', '8', '-d', classes, source / 'probe/TaggedSpeechFence.java')
    run(tools / 'd8', '--min-api', '29', '--lib', android, '--output', helper, *sorted(classes.rglob('*.class')))
    run('javac', '-cp', jars, '-d', tooling, source / 'probe/ApplyVelaFence.java')
    run('java', '-Xmx2g', '-cp', str(tooling) + os.pathsep + jars, 'ApplyVelaFence', args.original,
        output / 'classes.dex', helper / 'classes.dex', output / 'classes3.dex')
    raw = output / 'unaligned.apk'
    with zipfile.ZipFile(args.original) as before, zipfile.ZipFile(raw, 'w') as after:
        for info in before.infolist():
            if (info.filename in ('classes.dex', 'stamp-cert-sha256')
                    or re.fullmatch(r'META-INF/(?:MANIFEST\.MF|[^/]+\.(?:SF|RSA|DSA|EC))', info.filename, re.I)):
                continue
            after.writestr(info, before.read(info.filename))
        after.write(output / 'classes.dex', 'classes.dex')
        after.write(output / 'classes3.dex', 'classes3.dex')
    apk = output / 'vela-private-fenced.apk'
    run(tools / 'zipalign', '-P', '16', '-f', '4', raw, apk)
    run(tools / 'apksigner', 'sign', '--ks', args.key, '--ks-key-alias', 'native-warning-test',
        '--ks-pass', 'pass:android', '--key-pass', 'pass:android', apk)
    run(tools / 'apksigner', 'verify', apk)
    candidate_detail = inspect_bindings.inspect(apk, detail_selection)
    verify_edits(original_detail, candidate_detail)
    (output / 'candidate-instructions.json').write_text(json.dumps(candidate_detail, indent=2) + '\n')
    with apk.open('rb') as stream:
        sha = hashlib.file_digest(stream, 'sha256').hexdigest()
    print(json.dumps({'private_candidate': str(apk), 'sha256': sha, 'exact_native_edits_verified': 3,
                      'relocated_native_classes': ['Lwy4;', 'Lpn1;'],
                      'production_acceptance': 'not_established'}))


if __name__ == '__main__':
    main()
