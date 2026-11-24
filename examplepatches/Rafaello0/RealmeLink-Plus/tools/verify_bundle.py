#!/usr/bin/env python3
"""Fail the build unless this is a uniquely named, realme-only local .mpp."""
import argparse
import os
from pathlib import Path
import re
import struct
import zipfile

def dex_classes(data):
    """Read class definitions (not mere string mentions) from a compiled DEX."""
    if len(data) < 112 or data[:4] != b"dex\n":
        raise ValueError("Invalid DEX header")
    u32 = lambda off: struct.unpack_from("<I", data, off)[0]
    if u32(32) != len(data) or u32(40) != 0x12345678:
        raise ValueError("Invalid DEX size/endian")
    strings_n, strings_off, types_n, types_off = struct.unpack_from("<4I", data, 56)
    classes_n, classes_off = struct.unpack_from("<2I", data, 96)
    result = set()
    for i in range(classes_n):
        type_index = u32(classes_off + 32 * i)
        if type_index >= types_n:
            raise ValueError("Invalid class type")
        str_index = u32(types_off + 4 * type_index)
        if str_index >= strings_n:
            raise ValueError("Invalid class string")
        pos = u32(strings_off + 4 * str_index)
        for _ in range(5):
            byte = data[pos]
            pos += 1
            if byte < 128:
                break
        else:
            raise ValueError("Invalid string length")
        result.add(data[pos:data.index(0, pos)].decode("utf-8"))
    return result

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
    assert fields.get("Description", "").startswith("Five realme Link"), fields
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
    if b"experimentalSingleTapPatch" in z.read("app/morphe/patches/realmelink/modes/ModeMemoryPatchesKt.class"):
        raise SystemExit("Unsupported experimental single-tap injection still packaged")
    for name in names:
        if name.startswith("app/morphe/patches/") and name.endswith(".class"):
            rel=name.removeprefix("app/morphe/patches/")
            if not (rel.startswith("realmelink/") or rel.startswith("shared/")):
                raise SystemExit(f"Non-realme patch class inside local MPP: {name}")
    prefix = "Lapp/hxreborn/extension/realmelink/"
    runtime = dex_classes(z.read("extensions/extension.mpe"))
    expected_runtime = {prefix + name + ";" for name in (
        "ModeKeeper", "HeadsetProfileNames", "ModeSettingsUi", "ModeSettingsUi$PresenceService",
        "ModeSettingsUi$ReconnectReceiver", "ModeSettingsUi$ReconnectJob",
    )}
    if expected_runtime - runtime:
        raise SystemExit(f"Missing runtime classes: {expected_runtime - runtime}")
    print("MPP VERIFIED:",args.mpp.name,fields["Name"],fields["Version"],
          "realme-only patch classes, extension DEX, manifest and CRC OK")
