"""Audit and stage a clean APKM once; reuse only hash-verified local evidence.

python scripts/prepare_coffee_update.py game.apkm --output artifacts/coffee-update
Never launches a game, changes a save, or declares a new version compatible.
"""
import argparse
import hashlib
import json
from pathlib import Path
import shutil
import time
import zipfile


def sha(path):
    with path.open('rb') as stream:
        return hashlib.file_digest(stream, 'sha256').hexdigest()


def prepare(source, output):
    started = time.perf_counter()
    identity = sha(source)
    folder = output / identity
    report_path = folder / 'prepared.json'
    if report_path.exists():
        previous = json.loads(report_path.read_text())
        if previous['source_sha256'] == identity and all(
                (folder / name).is_file() and sha(folder / name) == digest
                for name, digest in previous['files'].items()):
            return dict(previous, cache_hit=True, seconds=time.perf_counter() - started)
    folder.mkdir(parents=True, exist_ok=True)
    report_path.unlink(missing_ok=True)
    files, splits, assets, libraries = {}, [], {}, {}
    with zipfile.ZipFile(source) as archive:
        for entry in archive.infolist():
            if entry.is_dir():
                continue
            if not entry.filename.endswith('.apk'):
                with archive.open(entry) as stream:
                    while stream.read(1024 * 1024):
                        pass
                continue
            if '/' in entry.filename or '\\' in entry.filename:
                raise ValueError('Expected root-level APK splits')
            dest = folder / 'splits' / entry.filename
            dest.parent.mkdir(exist_ok=True)
            with archive.open(entry) as src, dest.open('wb') as dst:
                shutil.copyfileobj(src, dst)
            splits.append(entry.filename)
            files[dest.relative_to(folder).as_posix()] = sha(dest)
            with zipfile.ZipFile(dest) as apk:
                for item in apk.infolist():
                    if item.is_dir():
                        continue
                    with apk.open(item) as stream:
                        digest = hashlib.file_digest(stream, 'sha256').hexdigest()
                    if item.filename.startswith('assets/'):
                        old = assets.setdefault(item.filename, digest)
                        if old != digest:
                            raise ValueError('Conflicting asset: ' + item.filename)
                    if item.filename.startswith('lib/'):
                        libraries[item.filename] = digest
                    if item.filename.startswith('lib/arm64-v8a/') or (
                            entry.filename == 'base.apk' and item.filename.endswith('.dex')):
                        # The cache owns these paths; never extract arbitrary archive paths.
                        relative = Path('inputs') / Path(item.filename).name
                        target = folder / relative
                        target.parent.mkdir(exist_ok=True)
                        with apk.open(item) as src, target.open('wb') as dst:
                            shutil.copyfileobj(src, dst)
                        files[relative.as_posix()] = digest
    if 'base.apk' not in splits or not libraries or not assets:
        raise ValueError('Complete base/native/asset splits required')
    report = dict(source_sha256=identity, source_bytes=source.stat().st_size,
                  splits=splits, assets=assets, libraries=libraries, files=files)
    temporary = folder / 'prepared.json.tmp'
    temporary.write_text(json.dumps(report, indent=2) + '\n')
    temporary.replace(report_path)
    return dict(report, cache_hit=False, seconds=time.perf_counter() - started)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('apkm', type=Path)
    parser.add_argument('--output', type=Path, default=Path('artifacts/coffee-update'))
    args = parser.parse_args()
    result = prepare(args.apkm, args.output)
    print(json.dumps({k: result[k] for k in ('source_sha256', 'source_bytes', 'cache_hit', 'seconds')}, indent=2))
