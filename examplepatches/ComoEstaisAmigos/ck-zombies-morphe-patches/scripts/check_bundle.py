"""Check that a built .mpp bundle carries a valid classes.dex for Morphe Manager.

Morphe Desktop loads the patches from the .class files, Morphe Manager from classes.dex, so a
bundle without the dex (or with a stale one) still works on the desktop and fails on the phone.
This checks that the dex is there, that its checksum and signature are intact, and that every
patch class in the jar has a counterpart in the dex.

usage: python scripts/check_bundle.py patches/build/libs/patches-<version>.mpp
"""
import hashlib
import struct
import sys
import zipfile
import zlib


def uleb128(data, pos):
    result, shift = 0, 0
    while True:
        byte = data[pos]
        pos += 1
        result |= (byte & 0x7F) << shift
        if byte < 0x80:
            return result, pos
        shift += 7


def dex_classes(dex):
    """Descriptors of the classes defined in a dex file."""
    string_ids_size, string_ids_off, type_ids_size, type_ids_off = struct.unpack_from("<IIII", dex, 56)
    class_defs_size, class_defs_off = struct.unpack_from("<II", dex, 96)

    def string(index):
        offset = struct.unpack_from("<I", dex, string_ids_off + 4 * index)[0]
        length, offset = uleb128(dex, offset)
        return dex[offset:dex.index(b"\x00", offset)].decode("utf-8", "replace")

    classes = set()
    for k in range(class_defs_size):
        type_index = struct.unpack_from("<I", dex, class_defs_off + 32 * k)[0]
        classes.add(string(struct.unpack_from("<I", dex, type_ids_off + 4 * type_index)[0]))
    return classes


def main(path):
    problems = []
    bundle = zipfile.ZipFile(path)
    names = bundle.namelist()
    if "classes.dex" not in names:
        print(f"FAIL: {path} has no classes.dex, so Morphe Manager cannot load it")
        return 1

    dex = bundle.read("classes.dex")
    if dex[:4] != b"dex\n":
        problems.append(f"bad dex magic {dex[:8]!r}")
    if struct.unpack_from("<I", dex, 8)[0] != zlib.adler32(dex[12:]):
        problems.append("dex checksum does not match")
    if dex[12:32] != hashlib.sha1(dex[32:]).digest():
        problems.append("dex signature does not match")
    if struct.unpack_from("<I", dex, 32)[0] != len(dex):
        problems.append("dex file_size field does not match its length")

    in_dex = dex_classes(dex)
    in_jar = {"L" + n[:-len(".class")] + ";" for n in names if n.endswith(".class")}
    patch_classes = {c for c in in_jar if c.startswith("Lapp/")}
    missing = sorted(patch_classes - in_dex)
    if missing:
        problems.append(f"{len(missing)} patch classes missing from the dex: {missing[:5]}")
    if "extensions/extension.mpe" not in names:
        problems.append("no extensions/extension.mpe")

    print(f"{path}")
    print(f"  dex {dex[4:7].decode()} {len(dex):,} bytes, {len(in_dex)} classes; "
          f"{len(patch_classes)} patch classes in the jar, all in the dex: {not missing}")
    for p in problems:
        print(f"  FAIL: {p}")
    print("PASS" if not problems else f"{len(problems)} problem(s)")
    return 1 if problems else 0


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print(__doc__)
        sys.exit(2)
    sys.exit(main(sys.argv[1]))
