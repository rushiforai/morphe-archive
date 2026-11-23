#!/usr/bin/env python3
"""Fail the build unless this is a uniquely named, realme-only local .mpp."""
import argparse
import os
from pathlib import Path
import re
import zipfile

p=argparse.ArgumentParser()
p.add_argument("mpp",type=Path)
args=p.parse_args()

with zipfile.ZipFile(args.mpp) as z:
    if z.testzip() is not None:
        raise SystemExit("Archive CRC validation failed")
    names=set(z.namelist())
    mf=z.read("META-INF/MANIFEST.MF").decode("utf-8")
    fields=dict(re.findall(r"(?m)^([A-Za-z-]+): ([^\r\n]*)",mf))
    assert fields.get("Name")=="RealmeLink Plus", fields
    assert fields.get("Version")==os.environ.get("REALMELINK_RELEASE_VERSION", "0.3.0"), fields
    assert fields.get("Source")=="https://github.com/Rafaello0/RealmeLink-Plus", fields
    assert "Patcher-Version" in fields, fields
    required={
        "app/morphe/patches/realmelink/modes/ModeMemoryPatchesKt.class",
        "app/morphe/patches/realmelink/theme/AmoledThemePatchKt.class",
        "app/morphe/patches/realmelink/session/BypassSessionExpiryPatchKt.class",
        "app/morphe/patches/realmelink/home/CleanHomeScreenPatchKt.class",
        "extensions/extension.mpe",
        "LICENSE",
        "NOTICE",
    }
    assert not (required-names), f"Missing: {required-names}"
    for name in names:
        if name.startswith("app/morphe/patches/") and name.endswith(".class"):
            rel=name.removeprefix("app/morphe/patches/")
            if not (rel.startswith("realmelink/") or rel.startswith("shared/")):
                raise SystemExit(f"Non-realme patch class inside local MPP: {name}")
    assert z.read("extensions/extension.mpe")[:4]==b"dex\n", "Invalid runtime extension DEX"
    print("MPP VERIFIED:",args.mpp.name,fields["Name"],fields["Version"],
          "realme-only patch classes, extension DEX, manifest and CRC OK")
