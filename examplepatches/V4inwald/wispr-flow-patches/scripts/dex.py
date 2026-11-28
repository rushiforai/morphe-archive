"""Structural checks for DEX files, used by the build verification.

Deliberately limited to what can be validated without ambiguity:

* the header (magic, declared size, adler32 checksum, SHA-1 signature);
* the map list (every declared section lies inside the file).

Semantic verification — "is the injected instruction really in this method?" — is
**not** done here. That needs a full dex reader, and getting one subtly wrong is
worse than not having one: an earlier hand-written reader in this project silently
mis-decoded the string table, which made the checker report an *unpatched* dex as
patched. `scripts/verify_apk.py` therefore disassembles the dex with baksmali (from
apktool.jar) and reads the real instructions, which is authoritative.

Header layout (DEX 040), little-endian:

    0   magic "dex\\n040"        8   checksum (adler32 of bytes 12..)
    12  signature (sha1 of 32..) 32  file_size
    36  header_size              52  map_off
    56  string_ids_size/off      64  type_ids_size/off
    80  field_ids_size/off       88  method_ids_size/off
    96  class_defs_size/off      104 data_size, 108 data_off
"""
from __future__ import annotations

import hashlib
import struct
import zlib


class DexError(Exception):
    """Raised when the input is not a dex file at all."""


def is_dex(data: bytes) -> bool:
    return data[:4] == b"dex\n"


def check_header(data: bytes, label: str = "dex") -> list[str]:
    """Return a list of integrity problems; an empty list means the header is sound."""
    problems: list[str] = []
    if not is_dex(data):
        return [f"{label}: not a dex file"]
    if len(data) < 0x70:
        return [f"{label}: too short to hold a dex header"]

    declared_size = struct.unpack_from("<I", data, 32)[0]
    if declared_size != len(data):
        problems.append(f"{label}: header declares {declared_size} bytes, found {len(data)}")

    stored_checksum = struct.unpack_from("<I", data, 8)[0]
    if zlib.adler32(data[12:]) & 0xFFFFFFFF != stored_checksum:
        problems.append(f"{label}: adler32 checksum mismatch")

    if hashlib.sha1(data[32:]).digest() != data[12:32]:
        problems.append(f"{label}: sha1 signature mismatch")

    header_size = struct.unpack_from("<I", data, 36)[0]
    if header_size != 0x70:
        problems.append(f"{label}: unexpected header size {header_size:#x}")

    sections = {
        "string_ids": struct.unpack_from("<II", data, 56),
        "type_ids": struct.unpack_from("<II", data, 64),
        "proto_ids": struct.unpack_from("<II", data, 72),
        "field_ids": struct.unpack_from("<II", data, 80),
        "method_ids": struct.unpack_from("<II", data, 88),
        "class_defs": struct.unpack_from("<II", data, 96),
    }
    for name, (count, offset) in sections.items():
        if not count:
            continue
        if not header_size <= offset < len(data):
            problems.append(f"{label}: {name} offset {offset} outside the file")
        elif offset % 4:
            problems.append(f"{label}: {name} offset {offset} is not 4-byte aligned")

    data_size, data_off = struct.unpack_from("<II", data, 104)
    if data_off + data_size > len(data):
        problems.append(f"{label}: data section runs past the end of the file")

    return problems


def check_map(data: bytes, label: str = "dex") -> list[str]:
    """Return a list of problems found while walking the map list."""
    problems: list[str] = []
    if not is_dex(data) or len(data) < 0x70:
        return [f"{label}: not a dex file"]

    map_off = struct.unpack_from("<I", data, 52)[0]
    if not 0 < map_off < len(data) - 4:
        return [f"{label}: map offset {map_off} outside the file"]

    size = struct.unpack_from("<I", data, map_off)[0]
    for i in range(size):
        item_off = map_off + 4 + i * 12
        if item_off + 12 > len(data):
            problems.append(f"{label}: map list runs past the end of the file")
            break
        type_code, _unused, item_size, item_offset = struct.unpack_from("<HHII", data, item_off)
        if item_size and item_offset + item_size > len(data):
            problems.append(
                f"{label}: map item 0x{type_code:04x} at {item_offset} "
                f"(size {item_size}) runs past the end of the file"
            )
    return problems
