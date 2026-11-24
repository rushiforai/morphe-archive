"""Restore one archived comparison dump, without overwriting an existing file."""
import gzip
import hashlib
import json
from pathlib import Path
import shutil
import sys

def main():
    if len(sys.argv) != 2:
        raise SystemExit('Usage: python restore-dump.py <absolute-path-to-file.gz>')
    archive = Path(sys.argv[1]).resolve(strict=True)
    skills = Path(__file__).resolve().parents[2]
    evidence = (skills / 'inspection-evidence').resolve()
    if not archive.is_relative_to(evidence) or archive.suffix != '.gz':
        raise SystemExit('Expected a .gz archive inside Skills/inspection-evidence.')
    records = json.loads((skills / 'maintenance/compressed-dumps.json').read_text(encoding='utf-8'))
    record = next((r for r in records if Path(r['archive']).resolve() == archive), None)
    if record is None:
        raise SystemExit('Archive is not in the verified cleanup manifest.')
    destination = archive.with_suffix('')
    if destination.exists():
        raise SystemExit(f'Refusing to overwrite {destination}')
    with gzip.open(archive, 'rb') as stream:
        digest = hashlib.file_digest(stream, 'sha256').hexdigest()
    if digest != record['sha256']:
        raise SystemExit('Archive checksum verification failed.')
    created = False
    try:
        with gzip.open(archive, 'rb') as src, destination.open('xb') as dst:
            created = True
            shutil.copyfileobj(src, dst)
        with destination.open('rb') as stream:
            if hashlib.file_digest(stream, 'sha256').hexdigest() != record['sha256']:
                raise RuntimeError('Restored file checksum verification failed.')
    except Exception:
        if created:
            destination.unlink(missing_ok=True)
        raise
    print(f'Restored {destination}')

if __name__ == '__main__':
    main()
