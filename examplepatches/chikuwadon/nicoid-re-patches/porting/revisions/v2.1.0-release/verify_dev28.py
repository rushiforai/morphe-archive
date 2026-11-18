#!/usr/bin/env python3
"""Verify the user-tested v2.1.0-dev.28 source bundle, before any release operation.

Every input part and the complete archive are content-addressed. This script
never downloads artifacts or treats an unreviewed MPP as a release candidate.
"""
from __future__ import annotations
import hashlib
import io
import json
import struct
import tarfile
import zlib
from pathlib import Path
from zipfile import ZipFile

ROOT = Path(__file__).resolve().parent
EXPECTED_SHA256 = 'e6fb7401d27b0d0425ae84509c0117934e1346a4cf3b2209b9525e296962761c'
EXPECTED_MPP_SHA256 = '02339ca4fdc967c763ac81c4ffe7f46d82024d01b2544d1bc0fa2216d68e673c'
EXPECTED_SOURCE_ZIP_SHA256 = '1bcf66d5c7bbb5b2fc7650dd0b0532aa97cce6b741dcde521dee3592d8a13a74'
PART_SIZE = 786432
PARTS = 16

def require(cond: bool, msg: str) -> None:
    if not cond:
        raise ValueError(msg)

def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()

def verified_archive(root: Path = ROOT) -> bytes:
    paths = [root / f'approved-inputs.part{i:02d}' for i in range(PARTS)]
    for p in paths:
        require(p.is_file(), f'Missing reviewed source chunk: {p.name}')
    chunks = [p.read_bytes() for p in paths]
    require(all(len(x) == PART_SIZE for x in chunks[:-1]), 'Source chunks unexpectedly resized')
    require(len(chunks[-1]) == 253068, 'Trailing source chunk unexpectedly resized')
    archive = b''.join(chunks)
    require(sha256(archive) == EXPECTED_SHA256, 'Reviewed v2.1.0-dev.28 source archive checksum mismatch')
    return archive

def safe_members(tf: tarfile.TarFile) -> dict[str, tarfile.TarInfo]:
    members = {m.name:m for m in tf.getmembers()}
    require(len(members) == len(tf.getmembers()), 'Duplicate archive paths')
    for m in members.values():
        require(not m.name.startswith('/') and '..' not in Path(m.name).parts, 'Unsafe path in reviewed archive')
        require(m.isdir() or m.isfile(), 'Links or special entries are forbidden')
    return members

def dex_check(blob: bytes, name: str) -> None:
    require(blob.startswith(b'dex\n03'), f'Not a DEX: {name}')
    require(struct.unpack_from('<I',blob,8)[0] == zlib.adler32(blob[12:]), f'DEX Adler-32 mismatch: {name}')
    require(blob[12:32] == hashlib.sha1(blob[32:]).digest(), f'DEX SHA-1 mismatch: {name}')
    require(struct.unpack_from('<I',blob,32)[0] == len(blob), f'DEX length mismatch: {name}')

def verify(root: Path = ROOT) -> dict:
    data = verified_archive(root)
    with tarfile.open(fileobj=io.BytesIO(data),mode='r:gz') as tf:
        entries = safe_members(tf)
        mpp_path = 'nicoid-re-v2.1.0-dev.28.mpp'
        require(mpp_path in entries, 'Missing reviewed MPP')
        mpp = tf.extractfile(mpp_path).read()
        require(sha256(mpp) == EXPECTED_MPP_SHA256, 'Reviewed MPP mismatch')
        helper = [p for p in entries if p.startswith('helpers-smali/') and p.endswith('.smali')]
        native = [p for p in entries if p.startswith('native-delta-smali/') and p.endswith('.smali')]
        require(len(helper)==7434 and len(native)==159, 'Unexpected source class count')
        for name, expected_count in [('helpers-smali/e/e/a/PatchVersion237.smali',1),('helpers-smali/e/e/a/ModernShorts.smali',2)]:
            raw = tf.extractfile(name).read().decode('utf-8')
            require(raw.count('2.1.0-dev.28') == expected_count, 'Version owner changed: '+name)
        with ZipFile(io.BytesIO(mpp)) as z:
            require(z.testzip() is None,'Reviewed MPP is corrupt')
            require(b'Version: 2.1.0-dev.28\r\n' in z.read('META-INF/MANIFEST.MF'), 'Reviewed MPP has wrong version')
            for name in ('helpers.mpe','method-delta.dex'):
                dex_check(z.read('nicoid/'+name), name)
            require(z.read('nicoid/helpers.mpe').count(b'2.1.0-dev.28') == 2, 'Unexpected DEX version references')
            require(len(z.read('nicoid/resources.zip'))>1_000_000, 'Resource bundle missing')
            require(any(b'Missing original nicoid 6.49 APK entry' in z.read(name)
                        for name in z.namelist() if name.endswith(('.class','.dex')) and not name.startswith('nicoid/')),
                    'Stale Morphe Kotlin patch runtime')
    return {'source_sha256':EXPECTED_SHA256,'mpp_sha256':EXPECTED_MPP_SHA256,
            'helper_smali':7434,'native_smali':159}

if __name__=='__main__':
    print('PASS: approved v2.1.0-dev.28 sources and MPP:',json.dumps(verify(),sort_keys=True))
