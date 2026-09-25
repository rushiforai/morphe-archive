#!/usr/bin/env python3
"""Compare an acceptance hook inventory with another APK, without patching that APK.

Only a unique structural match is reported as a relocation. Ambiguity and missing
hooks remain explicit. This report never changes the supported-version allowlist.
"""
import argparse
import hashlib
import json
import re
import zipfile
from collections import defaultdict
from pathlib import Path

OBFUSCATED = re.compile(r'L(?:X|Y)/[^;]+;|Lkotlin/jvm/internal/(?:A[^;]+);?')
MEMBER = re.compile(r'^(\[*L[^;]+;|\[+[ZBCSIJFD])->([^(: ]+)(.*)$')


def normalized_type(value):
    return OBFUSCATED.sub('L?;', value)


def normalized_member(owner, name):
    return name if owner.startswith(('Landroid/', 'Ljava/', 'Ljavax/')) else '*'


def method_tokens(method):
    descriptor = method.get_descriptor().replace(' ', '')
    tokens = [normalized_type(descriptor[1:])]
    for instruction in method.get_instructions():
        detail = ''
        for operand in instruction.get_operands():
            if len(operand) < 3:
                continue
            value = str(operand[2])
            opcode = instruction.get_name()
            if opcode.startswith('const-string'):
                # Androguard's operand value is the actual string, without output quoting.
                detail = 's:' + value
            elif opcode.startswith(('invoke-', 'iget', 'iput', 'sget', 'sput')):
                match = MEMBER.match(value)
                if not match:
                    raise ValueError('Unsupported reference format: ' + value)
                owner, name, tail = match.groups()
                if opcode.startswith('invoke-'):
                    detail = 'm:' + normalized_type(owner) + '->' + normalized_member(owner, name) + normalized_type(tail.replace(' ', ''))
                else:
                    detail = 'f:' + normalized_type(owner) + '->' + normalized_member(owner, name) + ':' + normalized_type(tail.strip(' :'))
            elif value.startswith(('L', '[')):
                detail = 't:' + normalized_type(value)
            break
        tokens.append(instruction.get_name().replace('/', '-').replace('_', '-') + ' ' + detail)
    return tokens


def digest(tokens):
    # DEX uses UTF-16 strings. Join valid surrogate pairs and match the JVM's
    # UTF-8 replacement byte ('?') for isolated surrogates in obfuscated strings.
    value = '\n'.join(tokens).encode('utf-16-le', 'surrogatepass').decode('utf-16-le', 'surrogatepass')
    return hashlib.sha256(value.encode('utf-8', 'replace')).hexdigest()


def classify(hook, candidates):
    if not hook.get('structuralSha256'):
        return 'baseline-unresolved'
    if not candidates:
        return 'missing-or-changed'
    if len(candidates) != 1:
        return 'ambiguous'
    candidate = candidates[0]
    return 'same' if (candidate['owner'], candidate['name']) == (hook['owner'], hook['name']) else 'relocated'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('baseline', type=Path)
    parser.add_argument('apk', type=Path)
    parser.add_argument('--output', type=Path, default=Path('tiktok-hook-migration.json'))
    parser.add_argument('--verify-baseline', action='store_true', help='Require each resolved baseline method to occur in the candidate set (same-APK CI check).')
    args = parser.parse_args()
    report = json.loads(args.baseline.read_text())
    if report.get('schema') != 1:
        parser.error('Unsupported hook report schema')
    wanted = {h['structuralSha256'] for h in report['fingerprints'] if h.get('structuralSha256')}
    from loguru import logger
    logger.remove()
    from androguard.core.dex import DEX
    found = defaultdict(list)
    sha = hashlib.sha256()
    with args.apk.open('rb') as file:
        for block in iter(lambda: file.read(1024 * 1024), b''):
            sha.update(block)
    with zipfile.ZipFile(args.apk) as archive:
        for name in sorted(archive.namelist()):
            if not re.fullmatch(r'classes\d*\.dex', name):
                continue
            dex = DEX(archive.read(name))
            for method in dex.get_encoded_methods():
                if method.get_code() is None:
                    continue
                key = digest(method_tokens(method))
                if key in wanted:
                    found[key].append({'dex': name, 'owner': method.get_class_name(), 'name': method.get_name(), 'descriptor': method.get_descriptor().replace(' ', '')})
            del dex
    rows = []
    invalid = []
    for hook in report['fingerprints']:
        candidates = found.get(hook.get('structuralSha256'), [])
        rows.append({'hook': hook['hook'], 'status': classify(hook, candidates), 'candidates': candidates})
        if args.verify_baseline and hook.get('structuralSha256') and not any(
                c['owner'] == hook['owner'] and c['name'] == hook['name'] and c['descriptor'] == '(' + ''.join(hook['parameters']) + ')' + hook['returns'] for c in candidates):
            invalid.append(hook['hook'])
    args.output.write_text(json.dumps({'schema': 1, 'apkSha256': sha.hexdigest(), 'hooks': rows}, indent=2))
    print(json.dumps({status: sum(row['status'] == status for row in rows) for status in sorted({row['status'] for row in rows})}))
    if invalid:
        raise SystemExit('Baseline methods missing from discovery: ' + ', '.join(invalid))


if __name__ == '__main__':
    main()
