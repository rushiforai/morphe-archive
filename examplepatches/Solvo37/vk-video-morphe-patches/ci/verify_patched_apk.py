#!/usr/bin/env python3
"""Static release gate for a patched VK Video APK.

This deliberately avoids a full DEX dependency: it parses just enough of each
DEX header/type/string/class table to prove that VkVideoApplication is a class
*definition*, not merely a referenced descriptor string.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import re
import struct
import sys
import zipfile

ORIGINAL_NATIVE_PATTERN = bytes.fromhex("1f1c0072e80700f900050054")
PATCHED_NATIVE_PATTERN = bytes.fromhex("1f1c0072e80700f900040054")
APPLICATION_DESCRIPTOR = "Lcom/vk/video/app/VkVideoApplication;"
V1_SIGNATURE_RE = re.compile(r"^META-INF/(?:MANIFEST\.MF|[^/]+\.(?:SF|RSA|DSA|EC))$", re.I)


class DexError(ValueError):
    pass


def u32(data: bytes, offset: int) -> int:
    if offset < 0 or offset + 4 > len(data):
        raise DexError(f"u32 out of bounds at 0x{offset:x}")
    return struct.unpack_from("<I", data, offset)[0]


def read_uleb128(data: bytes, offset: int) -> tuple[int, int]:
    value = 0
    shift = 0
    for _ in range(5):
        if offset >= len(data):
            raise DexError("truncated ULEB128")
        byte = data[offset]
        offset += 1
        value |= (byte & 0x7F) << shift
        if (byte & 0x80) == 0:
            return value, offset
        shift += 7
    raise DexError("invalid ULEB128")


def dex_class_definitions(data: bytes) -> set[str]:
    if len(data) < 0x70:
        raise DexError("DEX shorter than header")
    if not (data.startswith(b"dex\n") or data.startswith(b"cdex")):
        raise DexError("invalid DEX magic")

    # Standard DEX header fields. Compact DEX is not expected in APK entries
    # produced here; reject it rather than pretending to verify it.
    if data.startswith(b"cdex"):
        raise DexError("compact DEX is unsupported by this verifier")

    header_size = u32(data, 0x24)
    if header_size < 0x70:
        raise DexError(f"unexpected DEX header size 0x{header_size:x}")

    file_size = u32(data, 0x20)
    if file_size > len(data):
        raise DexError(f"DEX header file_size {file_size} exceeds entry size {len(data)}")

    string_ids_size = u32(data, 0x38)
    string_ids_off = u32(data, 0x3C)
    type_ids_size = u32(data, 0x40)
    type_ids_off = u32(data, 0x44)
    class_defs_size = u32(data, 0x60)
    class_defs_off = u32(data, 0x64)

    if string_ids_off + string_ids_size * 4 > len(data):
        raise DexError("string_ids table out of bounds")
    if type_ids_off + type_ids_size * 4 > len(data):
        raise DexError("type_ids table out of bounds")
    if class_defs_off + class_defs_size * 32 > len(data):
        raise DexError("class_defs table out of bounds")

    string_cache: dict[int, str] = {}

    def get_string(string_idx: int) -> str:
        if string_idx >= string_ids_size:
            raise DexError(f"string index {string_idx} out of range")
        if string_idx in string_cache:
            return string_cache[string_idx]

        string_data_off = u32(data, string_ids_off + string_idx * 4)
        _, pos = read_uleb128(data, string_data_off)
        end = data.find(b"\x00", pos)
        if end < 0:
            raise DexError("unterminated DEX string")

        # Class descriptors are ASCII. surrogate/MUTF-8 handling is irrelevant
        # for this specific verification target.
        try:
            value = data[pos:end].decode("ascii")
        except UnicodeDecodeError as exc:
            raise DexError("non-ASCII descriptor string") from exc

        string_cache[string_idx] = value
        return value

    def get_type(type_idx: int) -> str:
        if type_idx >= type_ids_size:
            raise DexError(f"type index {type_idx} out of range")
        descriptor_idx = u32(data, type_ids_off + type_idx * 4)
        return get_string(descriptor_idx)

    classes: set[str] = set()
    for index in range(class_defs_size):
        class_idx = u32(data, class_defs_off + index * 32)
        classes.add(get_type(class_idx))

    return classes


def count_pattern(data: bytes, pattern: bytes) -> int:
    count = 0
    start = 0
    while True:
        idx = data.find(pattern, start)
        if idx < 0:
            return count
        count += 1
        start = idx + 1


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as fh:
        for chunk in iter(lambda: fh.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("apk")
    parser.add_argument("--json-out")
    args = parser.parse_args()

    apk = Path(args.apk)
    failures: list[str] = []
    report: dict[str, object] = {
        "apk": str(apk),
        "sha256": sha256(apk),
        "size_bytes": apk.stat().st_size,
    }

    with zipfile.ZipFile(apk) as zf:
        names = zf.namelist()
        dex_names = sorted(
            name for name in names
            if re.fullmatch(r"classes(?:\d+)?\.dex", name)
        )
        report["dex_files"] = dex_names
        if not dex_names:
            failures.append("APK contains no classes*.dex entries")

        app_definitions: list[str] = []
        dex_errors: dict[str, str] = {}
        for name in dex_names:
            try:
                classes = dex_class_definitions(zf.read(name))
                if APPLICATION_DESCRIPTOR in classes:
                    app_definitions.append(name)
            except DexError as exc:
                dex_errors[name] = str(exc)

        report["application_class_definitions"] = app_definitions
        report["dex_parse_errors"] = dex_errors

        if dex_errors:
            failures.append(
                "DEX parser failed for: "
                + ", ".join(f"{name}: {reason}" for name, reason in dex_errors.items())
            )
        if len(app_definitions) != 1:
            failures.append(
                f"VkVideoApplication class definition count is {len(app_definitions)}, expected 1 "
                f"(locations: {app_definitions})"
            )

        native_path = "lib/arm64-v8a/libvkcore.so"
        if native_path not in names:
            failures.append(f"missing required ARM64 native library: {native_path}")
            report["native"] = {"present": False}
        else:
            native = zf.read(native_path)
            old_count = count_pattern(native, ORIGINAL_NATIVE_PATTERN)
            new_count = count_pattern(native, PATCHED_NATIVE_PATTERN)
            report["native"] = {
                "present": True,
                "original_pattern_count": old_count,
                "patched_pattern_count": new_count,
            }
            if old_count != 0:
                failures.append(f"unpatched native signature pattern remains {old_count} time(s)")
            if new_count != 1:
                failures.append(f"patched native signature pattern count is {new_count}, expected 1")

        v1_entries = [name for name in names if V1_SIGNATURE_RE.match(name)]
        report["v1_signature_entries"] = v1_entries
        if v1_entries:
            failures.append("JAR/v1 signature entries are present: " + ", ".join(v1_entries))

    report["success"] = not failures
    report["failures"] = failures

    if args.json_out:
        Path(args.json_out).write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")

    if failures:
        for failure in failures:
            print(f"ERROR: {failure}", file=sys.stderr)
        return 1

    print(
        f"Static APK gate passed: {len(report['dex_files'])} DEX file(s), "
        f"VkVideoApplication defined in {app_definitions[0]}, native bypass verified."
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
