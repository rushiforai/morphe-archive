"""Capture N33 inputs and immutable historical deliveries/evidence before implementation."""
from pathlib import Path
import hashlib, json, subprocess

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.verification/n33/baseline'

def record(path):
    with path.open('rb') as stream:
        digest = hashlib.file_digest(stream, 'sha256').hexdigest().upper()
    return {'path': str(path), 'bytes': path.stat().st_size, 'sha256': digest}

def main():
    OUT.mkdir(parents=True, exist_ok=False)
    historical = json.loads((ROOT / '.verification/n33-planner/rollback-delivery-artifacts-before.json').read_text(encoding='utf-8'))
    actual = [record(Path(item['path'])) for item in historical]
    assert actual == historical, 'Historical deliveries changed before N33'
    candidates = {p.resolve() for p in (ROOT / 'build').rglob('*') if p.is_file() and p.suffix in {'.apk', '.mpp', '.mpe'}}
    evidence = {p.resolve() for p in (ROOT / '.verification').rglob('*') if p.is_file() and any(part.startswith(('n31', 'n32', 'n33-planner')) for part in p.relative_to(ROOT / '.verification').parts)}
    paths = candidates | evidence | {ROOT / 'patches-1.45.0.mpp'}
    records = [record(p) for p in sorted(paths)]
    (OUT / 'historical-identities.json').write_text(json.dumps(records, ensure_ascii=False, indent=2), encoding='utf-8')
    (OUT / 'historical-80.json').write_text(json.dumps(actual, ensure_ascii=False, indent=2), encoding='utf-8')
    source = {str(p.relative_to(ROOT)): record(p) for folder in ('extensions/extension/src', 'patches/src', 'localization') for p in (ROOT / folder).rglob('*') if p.is_file()}
    (OUT / 'n30-source.json').write_text(json.dumps(source, ensure_ascii=False, indent=2), encoding='utf-8')
    for arguments, name in [(['rev-parse', 'HEAD'], 'head.txt'), (['status', '--short'], 'status.txt'), (['diff', '--name-status', 'd5ca720', '--', '.', ':(exclude)docs', ':(exclude)tools/n33'], 'product-diff.txt')]:
        result = subprocess.run(['git', *arguments], cwd=ROOT, capture_output=True, check=True)
        (OUT / name).write_bytes(result.stdout)
    print(f'CAPTURED {len(actual)} deliveries; {len(records)} historical files; {len(source)} N30 source inputs')

if __name__ == '__main__':
    main()
