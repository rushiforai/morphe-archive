import argparse
import hashlib
import json
import struct
import zipfile
from pathlib import Path

from apk_profiles import BUNDLE, LIBRARY, identify_apk

NOP = bytes.fromhex("1f2003d5")
ORIGINAL_ROW = 'type:t.type},t.type)})]})'
PATCHED_ROW = 'type:t.type},t.type)}),(0,r(d[8]).jsx)(r(90001).Button,{style:(O||h.some(function(t){return t.support}))&&{marginLeft:24}},"local-server")]})'
MODULE_MARKER = "__d(function(g,r,i,a,module,exports,d){"
STARTUP = "__r(48);\n__r(0);"
SIGNING_ENTRIES = {"META-INF/MANIFEST.MF", "META-INF/ROBOROCK.RSA", "META-INF/ROBOROCK.SF"}


def dex_classes(data):
    def uint(offset):
        return struct.unpack_from("<I", data, offset)[0]

    string_count, string_offset, type_count, type_offset = struct.unpack_from("<IIII", data, 56)
    class_count, class_offset = struct.unpack_from("<II", data, 96)
    strings = []
    for index in range(string_count):
        offset = uint(string_offset + 4 * index)
        while data[offset] & 0x80:
            offset += 1
        offset += 1
        strings.append(data[offset:data.index(b"\0", offset)])
    types = [strings[uint(type_offset + 4 * index)] for index in range(type_count)]
    return {types[uint(class_offset + 32 * index)].decode("ascii") for index in range(class_count)}


def verify(original, patched):
    version, profile = identify_apk(original)
    with zipfile.ZipFile(original) as source, zipfile.ZipFile(patched) as result:
        source_names = set(source.namelist())
        result_names = set(result.namelist())
        if len(source_names) != len(source.namelist()) or len(result_names) != len(result.namelist()):
            raise ValueError("Duplicate ZIP entries")
        changed = sorted(
            name for name in source_names & result_names
            if source.read(name) != result.read(name)
        )
        if changed != sorted([BUNDLE, profile["dex"], LIBRARY]):
            raise ValueError(f"Unexpected modified APK entries: {changed}")
        added = sorted(result_names - source_names)
        removed = sorted(source_names - result_names)
        if set(added) - SIGNING_ENTRIES != {profile["new_dex"]} or removed:
            raise ValueError(f"Unexpected added/removed APK entries: {added}, {removed}")

        expected = bytearray(source.read(LIBRARY))
        if hashlib.sha256(expected).hexdigest() != profile["library_sha256"]:
            raise ValueError("Unsupported original native library")
        note = struct.pack("<III", 4, 20, 3) + b"GNU\0" + bytes.fromhex(profile["build_id"])
        if expected.count(note) != 1:
            raise ValueError("Unexpected GNU build ID")
        for offset, original_hex in profile["checks"].items():
            if expected[offset:offset + 4] != bytes.fromhex(original_hex):
                raise ValueError(f"Unexpected original instruction at {hex(offset)}")
            expected[offset:offset + 4] = NOP
        if bytes(expected) != result.read(LIBRARY):
            raise ValueError("Native library differs beyond the verified instructions")

        original_bundle = source.read(BUNDLE).decode()
        if hashlib.sha256(source.read(BUNDLE)).hexdigest() != profile["bundle_sha256"]:
            raise ValueError("Unsupported original login bundle")
        bundle = result.read(BUNDLE).decode()
        module_end = "},90001,[" + ",".join(map(str, profile["dependencies"])) + "]);"
        if bundle.count(PATCHED_ROW) != 1 or bundle.count(module_end) != 1 or bundle.count(MODULE_MARKER) != 1:
            raise ValueError("The local-login module or login row button is missing or duplicated")
        start = bundle.index(MODULE_MARKER)
        end = bundle.index(module_end, start) + len(module_end)
        if bundle[end:end + 1] != "\n" or bundle[end + 1:] != STARTUP:
            raise ValueError("The injected module must be registered directly before startup")
        line_start = bundle.rfind("\n", 0, start) + 1
        if bundle[line_start:start].strip():
            raise ValueError("Unexpected code before injected module registration")
        restored = (bundle[:line_start] + bundle[end + 1:]).replace(PATCHED_ROW, ORIGINAL_ROW)
        if restored != original_bundle:
            raise ValueError("Login bundle differs beyond login row button and module injection")

        saved_class = profile["saved_url_class"]
        original_classes = dex_classes(source.read(profile["dex"]))
        if saved_class not in original_classes:
            raise ValueError("Saved server URL class missing from original DEX")
        if dex_classes(result.read(profile["dex"])) != original_classes - {saved_class}:
            raise ValueError("Unexpected classes stripped from original DEX")
        if dex_classes(result.read(profile["new_dex"])) != {saved_class}:
            raise ValueError("Unexpected classes in replacement DEX")
        return {
            "version": version,
            "version_code": profile["version_code"],
            "apk_sha256": hashlib.sha256(patched.read_bytes()).hexdigest(),
            "modified_entries": changed,
            "added_entries": added,
            "removed_entries": removed,
            "native_build_id": profile["build_id"],
            "native_patch_offsets": [hex(offset) for offset in profile["checks"]],
            "saved_url_class": saved_class,
        }


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("original", type=Path)
    parser.add_argument("patched", type=Path)
    args = parser.parse_args()
    print(json.dumps(verify(args.original, args.patched), indent=2))
