#!/usr/bin/env python3
"""Read-only verifier for the supported Ski Safari 2.5 (108) APK set."""

from __future__ import annotations

import argparse
import hashlib
import zipfile

PACKAGE = "com.yodo1.skisafarigp"
VERSION = "2.5"
VERSION_CODE = 108
METADATA = "assets/bin/Data/Managed/Metadata/global-metadata.dat"
LIB = "lib/arm64-v8a/libil2cpp.so"
EXPECTED_METADATA = "b8d2786c3be10261c7c666ce8155f4d1d6d98ec994586e16334219a5fc0f5144"
EXPECTED_LIB = "b24154995803633ab95eeea21836f67d74699b305a2ed631a2600c59dfdd639a"


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def read_entry(path: str, entry: str) -> bytes:
    with zipfile.ZipFile(path) as apk:
        return apk.read(entry)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("base_apk")
    parser.add_argument("arm64_split_apk")
    args = parser.parse_args()

    metadata = read_entry(args.base_apk, METADATA)
    il2cpp = read_entry(args.arm64_split_apk, LIB)
    metadata_hash, il2cpp_hash = sha256(metadata), sha256(il2cpp)
    print(f"package={PACKAGE} version={VERSION} versionCode={VERSION_CODE}")
    print(f"global-metadata.dat sha256={metadata_hash} bytes={len(metadata)}")
    print(f"libil2cpp.so sha256={il2cpp_hash} bytes={len(il2cpp)}")

    names = (b"ShopItemHelper", b"UnlockAllItems", b"TestUnlockAll", b"GameState")
    for name in names:
        if name not in metadata:
            raise SystemExit(f"FAIL: metadata missing {name.decode()}")

    # ELF load image has p_vaddr == p_offset for the executable segment's
    # RVA-to-file translation difference of 0x4000, confirmed from readelf.
    # TestUnlockAll at RVA 0xC8FB90 is a direct B to UnlockAllItems at 0xC8DC94.
    test_file_offset = 0xC8BB90
    unlock_file_offset = 0xC89C94
    test_word = int.from_bytes(il2cpp[test_file_offset : test_file_offset + 4], "little")
    unlock_word = int.from_bytes(il2cpp[unlock_file_offset : unlock_file_offset + 4], "little")
    if test_word != 0x17FFF841:
        raise SystemExit(f"FAIL: TestUnlockAll instruction changed: 0x{test_word:08x}")
    if unlock_word != 0xD101C3FF:
        raise SystemExit(f"FAIL: UnlockAllItems prologue changed: 0x{unlock_word:08x}")
    displacement = test_word & 0x03FFFFFF
    if displacement & 0x02000000:
        displacement -= 0x04000000
    target_rva = 0xC8FB90 + (displacement << 2)
    if target_rva != 0xC8DC94:
        raise SystemExit(f"FAIL: TestUnlockAll branch target is 0x{target_rva:x}")

    if metadata_hash != EXPECTED_METADATA:
        raise SystemExit("FAIL: unsupported global-metadata.dat; no changes applied")
    if il2cpp_hash != EXPECTED_LIB:
        raise SystemExit("FAIL: unsupported libil2cpp.so; no changes applied")
    print("PASS: exact metadata/library hashes and method entry instructions verified")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
