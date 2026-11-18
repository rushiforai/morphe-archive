#!/usr/bin/env python3
"""Freeze/compare original DEX warning bindings; never claim runtime acceptance.

Uses the project's cached dexlib2/Guava/Gson dependencies and a temporary Java
build, without installing tools, modifying APKs or running application code.
"""
import argparse
import json
import os
from pathlib import Path
import subprocess
import tempfile


def verify_contract(actual, expected):
    """Compare all recorded bodies, references, ABI, enums and artifact identity."""
    for key in sorted(actual.keys() | expected.keys()):
        if actual.get(key) != expected.get(key) or key not in actual or key not in expected:
            raise ValueError(f'Native binding contract differs: {key}')


def _verify_disposition(label, row, require_complete):
    status = row.get('status')
    if status not in ('exported', 'excluded', 'unsupported'):
        raise ValueError(f'{label}: invalid coverage status')
    if status == 'exported':
        evidence = row.get('evidence')
        if not isinstance(evidence, list) or not evidence or not all(
                isinstance(item, str) and item.strip() for item in evidence):
            raise ValueError(f'{label}: exported without evidence')
    elif not isinstance(row.get('reason'), str) or not row['reason'].strip():
        raise ValueError(f'{label}: missing exclusion/gap reason')
    if require_complete and status == 'unsupported':
        raise ValueError(f'{label}: unsupported native warning blocks completion')


def verify_coverage(contract, coverage, *, require_complete):
    """An exhaustive inventory may contain gaps; a complete claim may not."""
    enums = contract['enums']
    if enums.keys() != coverage.keys():
        raise ValueError('Coverage enum families differ from the artifact inventory')
    for owner, values in enums.items():
        rows = coverage[owner]
        difference = set(values) ^ rows.keys()
        if difference:
            raise ValueError(f'{owner}: missing or unexpected values: {sorted(difference)}')
        for value in values:
            _verify_disposition(f'{owner}.{value}', rows[value], require_complete)


def verify_manifest(contract, manifest, *, require_complete):
    if manifest.get('format') != 1 or manifest.get('artifact_sha256') != contract['artifact_sha256']:
        raise ValueError('Coverage manifest format/artifact identity differs')
    verify_coverage(contract, manifest['enums'], require_complete=require_complete)
    entries = manifest.get('entry_points')
    if not isinstance(entries, list) or not entries:
        raise ValueError('Coverage manifest needs explicit native entry points')
    required = set(contract.get('warning_entry_points', []))
    if not required or {row.get('method') for row in entries} != required:
        raise ValueError('Coverage native entry points differ from the frozen contract')
    seen = set()
    for row in entries:
        method = row.get('method')
        if method not in contract['methods'] or method in seen:
            raise ValueError(f'Missing or duplicate native entry point contract: {method}')
        seen.add(method)
        _verify_disposition(method, row, require_complete)


def resolve_classpath():
    cache = Path(os.environ.get('GRADLE_USER_HOME', Path.home() / '.gradle')) / 'caches/modules-2/files-2.1'
    coordinates = [
        ('com.github.MorpheApp.smali', 'smali-dexlib2'),
        ('com.google.guava', 'guava'), ('com.google.code.gson', 'gson')]
    jars = []
    for group, name in coordinates:
        candidates = sorted(p for p in (cache / group / name).glob('*/*/*.jar')
                            if not p.name.endswith(('-sources.jar', '-javadoc.jar')))
        if not candidates:
            raise ValueError(f'Missing cached {group}:{name}; run the project Gradle dependency resolution or pass --classpath')
        jars.append(str(candidates[-1]))
    return os.pathsep.join(jars)


def inspect(artifact, selection, *, classpath=None):
    classpath = classpath if classpath is not None else resolve_classpath()
    source = Path(__file__).with_name('InspectBindings.java')
    with tempfile.TemporaryDirectory(prefix='native-warning-bindings-') as tmp:
        subprocess.run(['javac', '-cp', classpath, '-d', tmp, str(source)], check=True)
        try:
            result = subprocess.run(['java', '-Xmx2g', '-cp', tmp + os.pathsep + classpath,
                                     'InspectBindings', str(artifact), str(selection)],
                                    check=True, capture_output=True, text=True)
        except subprocess.CalledProcessError as error:
            raise ValueError(f'Native inspector failed: {error.stderr.strip()}') from error
    return json.loads(result.stdout)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--artifact', type=Path, required=True)
    parser.add_argument('--selection', type=Path, required=True)
    parser.add_argument('--expect', type=Path)
    parser.add_argument('--coverage', type=Path)
    parser.add_argument('--require-complete', action='store_true')
    parser.add_argument('--output', type=Path)
    parser.add_argument('--classpath', help='Explicit dexlib2/Guava/Gson classpath')
    args = parser.parse_args()
    if args.require_complete and args.coverage is None:
        parser.error('--require-complete needs --coverage')
    actual = inspect(args.artifact, args.selection, classpath=args.classpath)
    if args.expect:
        verify_contract(actual, json.loads(args.expect.read_text()))
    if args.coverage:
        verify_manifest(actual, json.loads(args.coverage.read_text()), require_complete=args.require_complete)
    if args.output:
        args.output.write_text(json.dumps(actual, indent=2, ensure_ascii=False) + '\n')
    print(json.dumps({'artifact_sha256': actual['artifact_sha256'],
                      'methods': len(actual['methods']), 'enum_families': len(actual['enums']),
                      'contract_checked': args.expect is not None,
                      'coverage_inventory_checked': args.coverage is not None,
                      'static_coverage_complete_checked': args.require_complete,
                      'runtime_acceptance': 'not_tested'}))


if __name__ == '__main__':
    main()
