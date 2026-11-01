#!/usr/bin/env python3
"""Check extension DEX definitions and consumed app member descriptors."""
import argparse
from pathlib import Path
import json
import hashlib
import struct
import zlib


def verify(path, abi, standalone_helper=False):
    data = path.read_bytes()
    if len(data) < 112 or data[:4] != b"dex\n" or data[7] != 0:
        raise ValueError("Expected a standalone extension DEX")
    if struct.unpack_from("<I", data, 32)[0] != len(data):
        raise ValueError("DEX file size mismatch")
    if hashlib.sha1(data[32:]).digest() != data[12:32] or (zlib.adler32(data[12:]) & 0xffffffff) != struct.unpack_from("<I", data, 8)[0]:
        raise ValueError("DEX signature/checksum mismatch")
    try:
        return inventory(data, abi, standalone_helper)
    except (struct.error, IndexError, KeyError) as invalid:
        raise ValueError("Invalid or truncated DEX tables") from invalid


def inventory(data, abi, standalone_helper=False):
    def pair(offset):
        return struct.unpack_from("<II", data, offset)

    def string(offset):
        for _ in range(5):
            byte = data[offset]
            offset += 1
            if byte < 128:
                break
        else:
            raise ValueError("Invalid DEX string length")
        end = data.find(b"\x00", offset)
        if end < 0:
            raise ValueError("Unterminated DEX string")
        return data[offset:end].decode("utf-8", errors="replace")

    count, offset = pair(56)
    strings = [string(struct.unpack_from("<I", data, offset + index * 4)[0]) for index in range(count)]
    count, offset = pair(64)
    types = [strings[struct.unpack_from("<I", data, offset + index * 4)[0]] for index in range(count)]
    count, offset = pair(72)
    prototypes = []
    for index in range(count):
        _, returned, parameters_offset = struct.unpack_from("<III", data, offset + index * 12)
        parameters = []
        if parameters_offset:
            length = struct.unpack_from("<I", data, parameters_offset)[0]
            parameters = [types[struct.unpack_from("<H", data, parameters_offset + 4 + item * 2)[0]] for item in range(length)]
        prototypes.append("(" + "".join(parameters) + ")" + types[returned])

    count, offset = pair(96)
    definitions = {types[struct.unpack_from("<I", data, offset + index * 32)[0]] for index in range(count)}
    if not definitions:
        raise ValueError("Extension has no definitions")
    allowed = ("Lnl/johninnl/medium/reader/", "Lnl/johninnl/medium/privacy/", "Lnl/johninnl/medium/vendor/", "LMediumReader")
    unscoped = sorted(item for item in definitions if not item.startswith(allowed))
    if unscoped:
        raise ValueError("Unscoped or bundled app definition: " + ", ".join(unscoped[:5]))
    if standalone_helper and any(not item.startswith("Lnl/johninnl/medium/privacy/") for item in definitions):
        raise ValueError("Standalone privacy helper contains unrelated definitions")
    originals = abi["classes"]
    collisions = definitions.intersection(originals)
    if collisions:
        raise ValueError("App definition bundled into extension: " + ", ".join(sorted(collisions)[:5]))

    verified = set()
    count, offset = pair(80)
    for index in range(count):
        owner_index, type_index, name_index = struct.unpack_from("<HHI", data, offset + index * 8)
        owner, name, descriptor = types[owner_index], strings[name_index], types[type_index]
        if owner not in originals:
            if owner.startswith("Lcom/medium/"):
                raise ValueError("Unknown app ABI field owner: " + owner)
            continue
        field = originals[owner]["fields"].get(name)
        if field is None or field["type"] != descriptor:
            raise ValueError("Missing or mismatched app field: " + owner + "->" + name + ":" + descriptor)
        verified.add((owner, name, descriptor))

    count, offset = pair(88)
    for index in range(count):
        owner_index, proto_index, name_index = struct.unpack_from("<HHI", data, offset + index * 8)
        owner, name, descriptor = types[owner_index], strings[name_index], prototypes[proto_index]
        if owner not in originals:
            if owner.startswith("Lcom/medium/"):
                raise ValueError("Unknown app ABI method owner: " + owner)
            continue
        methods = originals[owner]["methods"]
        if not any(item["name"] == name and "(" + "".join(item["parameters"]) + ")" + item["returns"] == descriptor for item in methods):
            raise ValueError("Missing or mismatched app method: " + owner + "->" + name + descriptor)
        verified.add((owner, name, descriptor))
    if standalone_helper and verified:
        raise ValueError("Standalone privacy helper unexpectedly consumes app ABI")
    if not verified and not standalone_helper:
        raise ValueError("No consumed app members were verified")
    return {"definitions": len(definitions), "verified_app_members": len(verified), "collisions": 0,
            "sha256": hashlib.sha256(data).hexdigest()}


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("dex", type=Path)
    parser.add_argument("--abi", type=Path, required=True)
    parser.add_argument("--standalone-helper", action="store_true", help="Require privacy-only definitions and no app ABI dependencies")
    args = parser.parse_args()
    print(json.dumps(verify(args.dex, json.loads(args.abi.read_text()), args.standalone_helper), indent=2))
