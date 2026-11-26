#!/usr/bin/env python3
"""Assert that a Morphe release is loadable from Android DEX, not only JVM .class files."""
from __future__ import annotations
import sys, zipfile
from pathlib import Path

if len(sys.argv) != 2:
    raise SystemExit('Usage: verify_android_mpp.py <version>')
version = sys.argv[1]
patch = Path('patches/build/libs') / f'patches-{version}.mpp'
with zipfile.ZipFile(patch) as z:
    broken = z.testzip()
    assert broken is None, f'Corrupt patch archive: {broken}'
    files = set(z.namelist())
    assert 'classes.dex' in files, 'Missing classes.dex: Morphe Android cannot load this patch, even if Desktop can.'
    assert 'mygate_quickapprove_extension.dex' in files, 'Missing MyGate extension DEX'
    widget_dex = z.read('mygate_quickapprove_extension.dex')
    if version == '1.3.2':
        required = [
            b'Lcom/mygate/user/quickapprove/FallbackDns;',
            b'ack.mygate.in', b'104.18.14.11', b'104.18.15.11',
            b'Lokhttp3/Dns;',
            b'Lcom/mygate/user/quickapprove/QuickApproveWidget;',
        ]
        assert all(marker in widget_dex for marker in required), 'DNS fallback or widget missing from extension'
    dex = z.read('classes.dex')
    assert dex[:4] == b'dex\n', 'classes.dex has invalid DEX header'
    assert b'Lcom/mygate/quickpatch/QuickDeliveryPatchKt;' in dex, 'Patch entry point not found in Android DEX'
    manifest = z.read('META-INF/MANIFEST.MF').decode()
    assert f'Version: {version}' in manifest, 'MPP version mismatch'
    print(f'PASS: {patch} includes Android patch classes.dex, extension dex, correct version and valid ZIP')
