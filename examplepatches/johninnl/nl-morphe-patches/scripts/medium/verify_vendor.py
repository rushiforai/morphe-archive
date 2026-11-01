#!/usr/bin/env python3
"""Verify private dependency definitions before they enter the app extension."""
from pathlib import Path
import argparse
import hashlib
import struct
import zipfile

PREFIX = "nl/johninnl/medium/vendor/"


def inspect_jar(path, app_smali=None):
    definitions = set()
    with zipfile.ZipFile(path) as archive:
        for name in archive.namelist():
            if not name.endswith(".class"):
                continue
            internal = class_name(archive.read(name))
            if name != internal + ".class":
                raise ValueError(f"Class path/internal name mismatch: {name}")
            if not internal.startswith(PREFIX):
                raise ValueError(f"Unrelocated dependency definition: {internal}")
            if internal in definitions:
                raise ValueError(f"Duplicate dependency definition: {internal}")
            definitions.add(internal)
    if not definitions:
        raise ValueError("Vendor artifact contains no classes")
    if PREFIX + "jsoup/helper/Re2jRegex" in definitions:
        required = {PREFIX + "re2j/Pattern", PREFIX + "re2j/Matcher"}
        if not required <= definitions:
            raise ValueError("jsoup RE2J backend is packaged without its isolated Pattern/Matcher dependency")
    app_types = set()
    if app_smali is not None:
        for folder in app_smali.glob("smali*"):
            for source in folder.rglob("*.smali"):
                with source.open() as handle:
                    for _ in range(5):
                        line = handle.readline()
                        if line.startswith(".class "):
                            descriptor = line.split()[-1]
                            app_types.add(descriptor[1:-1])
                            break
        if not app_types:
            raise ValueError("No original app class inventory found")
        overlaps = definitions.intersection(app_types)
        if overlaps:
            raise ValueError("Vendor/app class collision: " + ", ".join(sorted(overlaps)[:5]))
    return {"class_count": len(definitions), "app_class_count": len(app_types), "collisions": 0,
            "sha256": hashlib.sha256(path.read_bytes()).hexdigest()}


def class_name(data):
    if len(data) < 10 or data[:4] != b"\xca\xfe\xba\xbe":
        raise ValueError("Invalid JVM class header")
    pool = {}
    count = struct.unpack_from(">H", data, 8)[0]
    offset, index = 10, 1
    try:
        while index < count:
            tag = data[offset]
            offset += 1
            if tag == 1:
                length = struct.unpack_from(">H", data, offset)[0]
                offset += 2
                pool[index] = data[offset:offset + length].decode("utf-8", errors="replace")
                offset += length
            elif tag == 7:
                pool[index] = struct.unpack_from(">H", data, offset)[0]
                offset += 2
            elif tag in (3, 4, 9, 10, 11, 12, 17, 18):
                offset += 4
            elif tag in (5, 6):
                offset += 8
                index += 1
            elif tag in (8, 16, 19, 20):
                offset += 2
            elif tag == 15:
                offset += 3
            else:
                raise ValueError(f"Unknown class constant tag: {tag}")
            index += 1
        this_class = struct.unpack_from(">H", data, offset + 2)[0]
        return pool[pool[this_class]]
    except (IndexError, KeyError, struct.error) as invalid:
        raise ValueError("Truncated JVM class") from invalid


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("jar", type=Path)
    parser.add_argument("--app-smali", type=Path)
    args = parser.parse_args()
    print(inspect_jar(args.jar, args.app_smali))
