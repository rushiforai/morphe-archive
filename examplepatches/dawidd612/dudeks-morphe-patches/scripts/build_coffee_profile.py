"""Generate version-specific resources from reviewed private evidence.

Protected inputs: two equal string snapshots, two-run reconstructed native
libraries and recovered startup/SDK DEX. Unprotected builds need only the audited
split set. Does not register compatibility.
"""
import argparse
import base64
import gzip
import hashlib
import io
import json
from pathlib import Path
import zipfile
from build_pizza_native_delta import encode


def build(evidence, splits, output, first, second, protected_initialization=True):
    rows = []
    generated = {}
    if protected_initialization:
        values = json.loads((evidence / (first + '-values.json')).read_text())
        if values != json.loads((evidence / (second + '-values.json')).read_text()):
            raise ValueError('Independent string snapshots differ')
        for owner, fields in values.items():
            for field, value in fields.items():
                if value is None:
                    raise ValueError('Uninitialized constant: ' + owner + '.' + field)
                rows.append('L' + owner.replace('.', '/') + ';\t' + field + '\t' + base64.b64encode(value.encode()).decode())
        generated['strings.tsv.gz'] = gzip.compress(('\n'.join(rows) + '\n').encode(), mtime=0)
        for name in ('libunity.so', 'libil2cpp.so'):
            generated[name + '.delta.gz'] = encode((evidence / name).read_bytes(), (evidence / (name + '-restored')).read_bytes())
        for name in ('startup-methods.dex', 'sdk-receivers.dex'):
            generated[name] = (evidence / name).read_bytes()
    # Extract the SDK's original embedded classes, without changing any JNI code.
    firebase = list((splits.parent / 'inputs').glob('libFirebaseCppApp-*.so'))
    if len(firebase) != 1:
        raise ValueError('Expected one Firebase C++ app library')
    raw = firebase[0].read_bytes()
    start = raw.index(b'PK\x03\x04')
    end = raw.index(b'PK\x05\x06', start)
    with zipfile.ZipFile(io.BytesIO(raw[start:end + 22])) as jar:
        generated['firebase-app.dex'] = jar.read('classes.dex')
    assets = {}
    for split in sorted(splits.glob('*Unity*.apk')):
        with zipfile.ZipFile(split) as apk:
            for item in apk.infolist():
                if not item.is_dir() and item.filename.startswith('assets/'):
                    with apk.open(item) as stream:
                        digest = hashlib.file_digest(stream, 'sha256').hexdigest()
                    if assets.setdefault(item.filename, digest) != digest:
                        raise ValueError('Conflicting pack asset: ' + item.filename)
    if not assets:
        raise ValueError('Missing Unity asset packs')
    generated['asset-packs.tsv.gz'] = gzip.compress(('\n'.join(n + '\t' + h for n, h in assets.items()) + '\n').encode(), mtime=0)
    output.mkdir(parents=True, exist_ok=True)
    for name, data in generated.items():
        (output / name).write_bytes(data)
    (output / 'sha256.json').write_text(json.dumps({n: hashlib.sha256(d).hexdigest() for n, d in generated.items()}, indent=2) + '\n')
    print(json.dumps({'strings': len(rows), 'pack_assets': len(assets), 'resources': len(generated)}))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('evidence', type=Path)
    parser.add_argument('--splits', required=True, type=Path)
    parser.add_argument('--output', required=True, type=Path)
    parser.add_argument('--first', default='native-2')
    parser.add_argument('--second', default='native-3')
    parser.add_argument('--unprotected', action='store_true', help='Generate only common resources; no initialization capture is required')
    args = parser.parse_args()
    build(args.evidence, args.splits, args.output, args.first, args.second, not args.unprotected)
