#!/usr/bin/env python3
"""Audit a Morphe-produced APK without retaining app code in the repository."""
import hashlib
import argparse
from pathlib import Path
import re
import struct
import sys
import zipfile


def check(condition, message):
    if not condition:
        raise ValueError(message)


def verify(original_path, patched_path, patches=('folder-reviews',)):
    root = (Path(__file__).resolve().parents[1] /
            'patches/src/main/kotlin/com/jcapretta/chessable')
    sources = {'folder-reviews': root / 'folders/FolderReviewEdits.kt',
               'offline-mode': root / 'offline/OfflineEdits.kt'}
    source = sources['folder-reviews'].read_text()
    expected_hash = re.search(r'ORIGINAL_SHA256 = "([0-9a-f]+)"', source).group(1)
    source = '\n'.join(sources[name].read_text() for name in patches)
    edits = re.findall(r'edit\("([^"]+)", (0x[0-9a-f]+), "([0-9a-f]+)", "([0-9a-f]+)"\)', source)
    check(edits, 'No declared edits found')
    with zipfile.ZipFile(original_path) as original_zip, zipfile.ZipFile(patched_path) as patched_zip:
        original = original_zip.read('assets/index.android.bundle')
        patched = patched_zip.read('assets/index.android.bundle')
    check(hashlib.sha256(original).hexdigest() == expected_hash, 'Unsupported original bundle')
    check(len(original) == len(patched), 'Bundle length changed')
    check(struct.unpack_from('<I', patched, 32)[0] == len(patched), 'Invalid header file length')
    check(hashlib.sha1(patched[:-20]).digest() == patched[-20:], 'Invalid Hermes footer')
    expected = bytearray(original)
    for name, offset, before, after in edits:
        offset = int(offset, 16)
        before, after = bytes.fromhex(before), bytes.fromhex(after)
        check(original[offset:offset + len(before)] == before, f'{name}: wrong original instructions')
        check(patched[offset:offset + len(after)] == after, f'{name}: patch was not applied')
        expected[offset:offset + len(before)] = after
        print(f'PASS {name}')
    expected[-20:] = hashlib.sha1(expected[:-20]).digest()
    check(patched == expected, 'Unexpected changes outside the declared edits')
    print(f'PASS bounded changes and checksum; bundle SHA-256: {hashlib.sha256(patched).hexdigest()}')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('original')
    parser.add_argument('patched')
    parser.add_argument('--patches', nargs='+', choices=('folder-reviews', 'offline-mode'),
                        default=['folder-reviews'])
    args = parser.parse_args()
    try:
        verify(args.original, args.patched, args.patches)
    except (ValueError, OSError, KeyError, zipfile.BadZipFile) as error:
        sys.exit(f'FAIL: {error}')
