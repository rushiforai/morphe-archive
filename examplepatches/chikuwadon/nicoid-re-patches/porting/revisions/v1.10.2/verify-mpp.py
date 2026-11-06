#!/usr/bin/env python3
"""Verify shipped MPP identity, exact processed payload and user-visible version."""
from pathlib import Path
from zipfile import ZipFile
import glob, hashlib, struct, sys
version=sys.argv[1]
bundles=glob.glob("patches/build/libs/*.mpp")
assert len(bundles)==1, f"Expected one MPP, got {bundles}"
bundle=Path(bundles[0])
with ZipFile(bundle) as z:
    assert z.testzip() is None
    manifest=z.read("META-INF/MANIFEST.MF").decode()
    assert "Version: "+version+"\r\n" in manifest or "Version: "+version+"\n" in manifest
    for name in ("nicoid/helpers.mpe","nicoid/method-delta.dex"):
        shipped=z.read(name)
        generated=Path("patches/src/main/resources")/name
        assert shipped==generated.read_bytes(), f"MPP contained stale {name}"
    data=z.read("nicoid/helpers.mpe")
    assert data.startswith(b"dex\n")
    size,offset=struct.unpack_from("<II",data,0x38)
    strings=set()
    for i in range(size):
        pos=struct.unpack_from("<I",data,offset+4*i)[0]
        while data[pos]&0x80: pos+=1
        pos+=1
        end=data.index(b"\x00",pos)
        strings.add(data[pos:end].decode("utf-8","replace"))
    assert version in strings, "Shipped helper dex has stale PatchVersion value"
    assert "v"+version+" @chikuwadon" in strings, "Shipped helper dex has stale ModernShorts version"
    for name in ("SCROLL_RESTORES", "DIRTY_ADAPTERS", "REFRESH_ARTWORK", "updateSummaries"):
        assert name in strings, "Shipped helper DEX is missing optimized member " + name
    for name in ("Le/e/a/Dev111;","Le/e/a/Dev112;","Le/e/a/Dev115;","Le/e/a/Dev116;"):
        assert name in strings, "Shipped helper DEX missing "+name
print("PASS: shipped MPP manifest, byte-exact helper resources and runtime version",version)
