#!/usr/bin/env python3
"""Reject stale bridge binaries without distributing the stock application."""
import argparse
import hashlib
import json
from pathlib import Path
import shutil

ROOT = Path(__file__).resolve().parent
REPO = ROOT.parents[1]
ARTIFACT = REPO / 'patches/src/main/resources/openbubbles-wear.mpe'
LOCK = ROOT / 'extension-lock.json'
SOURCE_PATHS = [
    'bridge/src/main', 'protocol/src/main', 'extension/src/extension/java',
    'scripts/prepare-embedded.py', 'build.gradle.kts', 'settings.gradle.kts',
    'gradle.properties', 'bridge/build.gradle.kts', 'protocol/build.gradle.kts',
    'extension/build.gradle.kts', 'gradle/wrapper/gradle-wrapper.properties',
]


def source_digest(root=ROOT):
    files = sorted({path for entry in SOURCE_PATHS
                    for path in ((root / entry).rglob('*') if (root / entry).is_dir()
                                 else [root / entry]) if path.is_file()})
    digest = hashlib.sha256()
    for path in files:
        digest.update(path.relative_to(root).as_posix().encode() + b'\0')
        data = path.read_bytes().replace(b'\r\n', b'\n')
        digest.update(data + b'\0')
    return digest.hexdigest()


def verify():
    expected = json.loads(LOCK.read_text(encoding='utf-8'))
    if source_digest() != expected['source_sha256']:
        raise ValueError('OpenBubbles extension sources changed. Rebuild locally, run verify-extension.py --refresh, and commit the MPE and lock.')
    if hashlib.sha256(ARTIFACT.read_bytes()).hexdigest() != expected['extension_sha256']:
        raise ValueError('OpenBubbles extension checksum mismatch. Rebuild and refresh the lock.')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--refresh', action='store_true', help='Copy a freshly built extension and record its sources/checksum')
    args = parser.parse_args()
    if args.refresh:
        ARTIFACT.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(ROOT / 'extension/build/morphe/openbubbles-wear.mpe', ARTIFACT)
        LOCK.write_text(json.dumps({
            'source_sha256': source_digest(),
            'extension_sha256': hashlib.sha256(ARTIFACT.read_bytes()).hexdigest(),
        }, indent=2) + '\n', encoding='utf-8')
    verify()
    print('OpenBubbles extension matches its sources and checksum.')


if __name__ == '__main__':
    main()
