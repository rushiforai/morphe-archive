"""Audit the actual Monet output, including the resource preflight's manifest reserialization."""
import argparse
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[1]


def resource_values(path):
    """Compare complete value records while allowing aapt's configuration reordering."""
    value = subprocess.check_output(['aapt', 'dump', '--values', 'resources', str(path)], text=True)
    headers, records = [], {}
    configuration, record = '', None
    for raw in value.splitlines():
        line = raw.strip()
        if line.startswith('config '):
            configuration = line
            record = None
            headers.append(line)
        elif line.startswith('resource '):
            key = (configuration, line.split(': t=', 1)[0])
            assert key not in records, 'Duplicate resource configuration record'
            record = records[key] = [line]
        elif line.startswith(('type ', 'Package ', 'spec resource ', 'INVALID TYPE ')):
            record = None
            headers.append(line)
        elif record is not None:
            record.append(line)
        else:
            headers.append(line)
    return sorted(headers), records


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('original', type=Path)
    parser.add_argument('patched', type=Path)
    parser.add_argument('--desktop', type=Path, required=True)
    args = parser.parse_args()
    out = ROOT / 'build/monet-wuplay-validation/verifier'
    out.mkdir(parents=True, exist_ok=True)
    classes = ROOT / 'patches/build/classes/java/main'
    classpath = str(classes) + ':' + str(args.desktop)
    subprocess.run(['javac', '--release', '11', '-cp', classpath, '-d', str(out),
                    str(ROOT / 'tests/fixtures/monet-wuplay/VerifyMonetWuplayApk.java')], check=True)
    subprocess.run(['java', '-cp', str(out) + ':' + classpath, 'patches.monet.VerifyMonetWuplayApk',
                    str(args.original), str(args.patched)], check=True)
    def manifest(path):
        value = subprocess.check_output(['aapt', 'dump', 'xmltree', str(path), 'AndroidManifest.xml'], text=True)
        return re.sub(r' \(line=\d+\)', '', value)
    assert manifest(args.original) == manifest(args.patched), 'Manifest declarations changed'
    assert resource_values(args.original) == resource_values(args.patched), 'Resource configurations/values changed'
    print('PASS: complete manifest declarations and resource configurations/values unchanged; binary serialization differs')


if __name__ == '__main__':
    main()
