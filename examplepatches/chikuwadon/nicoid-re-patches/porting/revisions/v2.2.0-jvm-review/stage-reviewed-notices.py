#!/usr/bin/env python3
"""Reproduce the reviewed notice-only MPP; never publish or alter its input."""
import hashlib
from pathlib import Path
import sys
import zipfile

TESTED = '151cc1e7eeed2450855de8b7f115c038a47420b6bd48ac3f5d75d28df4695aa7'
REVIEWED = 'caa29ae2e567f9799b597b0eb144245421ebca374cb951ff1567ac06726a20f9'

def sha(data):
    return hashlib.sha256(data).hexdigest()

def need(ok, message):
    if not ok:
        raise ValueError(message)

def stage(src, base, recovery, review, out):
    need(not out.exists(), 'Output already exists')
    need(sha(src.read_bytes()) == TESTED, 'Not the device-tested reconstruction')
    prefix = 'nicoid/licenses/recovered-notices/'
    hist = base / 'porting/revisions'
    notices = {name: (review / 'licenses' / name).read_bytes() for name in (
        'Commons-Lang-LICENSE.txt', 'Commons-Lang-NOTICE.txt',
        'NOTICE-SwipeRefreshLayout.txt', 'NOTICE-dev3.txt',
        'SwipeRefreshLayout-upstream-SHA256SUMS.txt', 'SwipeRefreshLayout-upstream-SOURCES.txt')}
    notices.update({
        'LICENSE-GPL-3.0.txt': (base / 'LICENSE').read_bytes(),
        'NOTICE-Morphe.txt': (base / 'NOTICE').read_bytes().split(b'\nThird-party runtime components\n', 1)[0],
        'NOTICE-MEDIA3-history.txt': (hist / 'v2.0.0-dev.1/licenses/NOTICE-MEDIA3.txt').read_bytes(),
        'NOTICE-RUNTIME-UPDATE.txt': (hist / 'v2.1.9-dev.7/licenses/NOTICE-RUNTIME-UPDATE.txt').read_bytes(),
        'THIRD_PARTY_MP3.md': (hist / 'v2.0.3-dev.11/THIRD_PARTY_MP3.md').read_bytes(),
        'Annotation-Experimental-LICENSE.txt': (recovery / 'metadata/nicoid/licenses/network238/AndroidX-annotation-LICENSE.txt').read_bytes(),
    })
    evidence = recovery / 'metadata/license-evidence/embedded-licenses'
    for p in sorted(evidence.rglob('*')):
        if p.is_file():
            rel = p.relative_to(evidence).as_posix()
            if rel in ('failureaccess-new.jar/META-INF/LICENSE', 'guava-new.jar/META-INF/LICENSE',
                       'okhttp-4.0.0-sources.jar/okhttp3/internal/publicsuffix/NOTICE',
                       'okhttp-4.12.1-sources.jar/okhttp3/internal/publicsuffix/NOTICE') or (
                rel.split('/')[0] in ('appcompat-1.8.0-sources.jar', 'appcompat-resources-1.8.0-sources.jar',
                    'core-1.19.1-sources.jar', 'lifecycle-common-2.11.1-sources.jar',
                    'lifecycle-common-jvm-2.11.1-sources.jar', 'lifecycle-runtime-2.11.1-sources.jar',
                    'lifecycle-runtime-android-2.11.1-sources.jar', 'recyclerview-1.4.0-sources.jar',
                    'swiperefreshlayout-1.2.0-sources.jar', 'viewpager-1.1.0-sources.jar') and rel.endswith('/LICENSE.txt')):
                notices['upstream-evidence/' + rel] = p.read_bytes()
    lame = (review / 'licenses/java-lame-3.98.4-LGPL-3.0.txt').read_bytes()
    need(sha(lame) == 'da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768', 'Incorrect LGPL text')
    added = {prefix + name: data for name, data in notices.items()}
    added['META-INF/java-lame-3.98.4-LGPL-3.0.txt'] = lame
    need(len(added) == 27, 'Notice set mismatch')
    with zipfile.ZipFile(src) as z:
        names = z.namelist()
        need(z.testzip() is None and len(names) == len(set(names)) == 24, 'Unexpected original MPP')
        original = {name: z.read(name) for name in names}
    need(not set(original) & set(added), 'Notice overlaps original entry')
    created = False
    try:
        with zipfile.ZipFile(out, 'x', compression=zipfile.ZIP_DEFLATED, compresslevel=9) as z:
            created = True
            for name, data in list(original.items()) + sorted(added.items()):
                info = zipfile.ZipInfo(name, (2026, 11, 27, 0, 0, 0))
                info.compress_type = zipfile.ZIP_DEFLATED
                info.external_attr = 0o100644 << 16
                z.writestr(info, data, compresslevel=9)
        with zipfile.ZipFile(out) as z:
            expected = original | added
            need(z.testzip() is None and len(z.namelist()) == len(expected), 'Bad staged ZIP')
            need(set(z.namelist()) == set(expected), 'Unexpected staged member')
            need(all(z.read(n) == b for n, b in expected.items()), 'Staged entry changed')
        need(sha(out.read_bytes()) == REVIEWED, 'Notice review candidate hash mismatch')
    except BaseException:
        if created:
            out.unlink(missing_ok=True)
        raise
    print('PASS reviewed notice-only MPP:', out.stat().st_size, REVIEWED)

if __name__ == '__main__':
    need(len(sys.argv) == 6, 'Usage: stage-reviewed-notices.py TESTED_MPP BASE_ROOT RECOVERY_ROOT REVIEW_ROOT OUTPUT_MPP')
    stage(*map(Path, sys.argv[1:]))
