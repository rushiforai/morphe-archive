#!/usr/bin/env python3
"""Read-only inspection of Ski Safari 2.5 profile copies; never edits input."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import struct


def obfuscate(data: bytes, udid: str) -> bytes:
    """Profile.Obfuscate RVA 0xBD93D0: XOR, start 3*len/4, step 2, wrap."""
    if not re.fullmatch(r"[0-9A-F]{40}", udid):
        raise ValueError("Expected the original 40-character uppercase profile ID")
    position = len(udid) * 3 // 4
    result = bytearray(data)
    for index in range(len(result)):
        result[index] ^= ord(udid[position])
        position += 2
        if position >= len(udid):
            position = 0
    return bytes(result)


def inspect(data: bytes, udid: str) -> dict:
    decoded = obfuscate(data, udid)
    if len(decoded) < 52 or decoded[:40] != udid.encode("ascii"):
        raise ValueError("Decoded header does not match profile ID; unsupported input")
    coins, count = struct.unpack_from("<ii", decoded, 40)
    if not 0 <= count <= len(decoded) // 5:
        raise ValueError("Invalid integer dictionary count")
    position = 48
    keys = set()
    for _ in range(count):
        length = shift = 0
        while True:
            if position >= len(decoded) or shift >= 35:
                raise ValueError("Invalid BinaryReader string length")
            byte = decoded[position]
            position += 1
            length |= (byte & 127) << shift
            if byte < 128:
                break
            shift += 7
        if position + length + 4 > len(decoded):
            raise ValueError("Truncated integer dictionary entry")
        key = decoded[position:position + length].decode("utf-8")
        if key in keys:
            raise ValueError("Duplicate profile key")
        keys.add(key)
        position += length + 4
    if position + 4 > len(decoded):
        raise ValueError("Missing next section")
    float_count = struct.unpack_from("<i", decoded, position)[0]
    if not 0 <= float_count <= len(decoded) // 5:
        raise ValueError("Invalid float dictionary count")
    if obfuscate(decoded, udid) != data:
        raise ValueError("XOR round-trip mismatch")
    return {
        "bytes": len(data),
        "sha256": hashlib.sha256(data).hexdigest(),
        "decoded_header_matches": True,
        "coins": coins,
        "integer_fields": count,
        "next_section_offset": position,
        "float_fields": float_count,
        "trailing_zero_bytes": len(decoded) - len(decoded.rstrip(b"\0")),
        "xor_round_trip_exact": True,
        "complete_schema_verified": False,
        "save_modified": False,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("profile", type=Path)
    arguments = parser.parse_args()
    data = arguments.profile.read_bytes()
    report = inspect(data, arguments.profile.stem)
    if arguments.profile.read_bytes() != data:
        raise ValueError("Input changed during inspection")
    print(json.dumps(report, indent=2))


if __name__ == "__main__":
    main()
