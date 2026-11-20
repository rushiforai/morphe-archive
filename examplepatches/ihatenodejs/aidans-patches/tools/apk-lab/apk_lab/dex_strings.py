from __future__ import annotations

import re
import struct
import zipfile
from collections.abc import Iterator
from dataclasses import dataclass
from pathlib import Path

from apk_lab.archives import materialize_artifact_apks
from apk_lab.inspection import inspect_artifact


@dataclass(frozen=True)
class DexStringMatch:
    split: str
    dex_name: str
    string: str


def read_uleb128(data: bytes, offset: int) -> tuple[int, int]:
    """Decodes an unsigned LEB128 integer and returns (value, bytes_read)."""
    result = 0
    shift = 0
    size = 0
    while offset + size < len(data):
        byte = data[offset + size]
        size += 1
        result |= (byte & 0x7F) << shift
        if (byte & 0x80) == 0:
            return result, size
        shift += 7
    raise IndexError("Truncated ULEB128 sequence in binary data")


def extract_strings_from_dex_bytes(dex_bytes: bytes) -> Iterator[str]:
    """Parses string_ids table directly from DEX binary bytes."""
    if len(dex_bytes) < 0x70 or dex_bytes[:4] != b"dex\n":
        return

    string_ids_size = struct.unpack_from("<I", dex_bytes, 0x38)[0]
    string_ids_off = struct.unpack_from("<I", dex_bytes, 0x3C)[0]

    for i in range(string_ids_size):
        off = string_ids_off + i * 4
        if off + 4 > len(dex_bytes):
            break
        data_off = struct.unpack_from("<I", dex_bytes, off)[0]
        if data_off >= len(dex_bytes):
            continue
        try:
            _utf16_size, uleb_len = read_uleb128(dex_bytes, data_off)
        except IndexError:
            continue
        str_start = data_off + uleb_len
        # Read until null terminator
        null_pos = dex_bytes.find(b"\x00", str_start)
        if null_pos != -1:
            raw_bytes = dex_bytes[str_start:null_pos]
            try:
                yield raw_bytes.decode("utf-8", errors="replace")
            except Exception:  # noqa: BLE001, S112
                continue


def search_artifact_strings(
    artifact_path: Path | str,
    query: str | None = None,
    dex_filter: str | None = None,
    ignore_case: bool = True,
) -> list[DexStringMatch]:
    """Scans all DEX files in an artifact for string literals matching a query."""
    path = Path(artifact_path).resolve()
    insp = inspect_artifact(path)
    pattern = None
    if query:
        flags = re.IGNORECASE if ignore_case else 0
        pattern = re.compile(query, flags)

    matches: list[DexStringMatch] = []

    with materialize_artifact_apks(path, insp) as apks:
        for apk in apks:
            with zipfile.ZipFile(apk.path, "r") as zf:
                for entry_name in sorted(zf.namelist()):
                    if not entry_name.endswith(".dex"):
                        continue
                    if dex_filter and dex_filter not in entry_name:
                        continue
                    dex_bytes = zf.read(entry_name)
                    for s in extract_strings_from_dex_bytes(dex_bytes):
                        if pattern is None or pattern.search(s):
                            matches.append(
                                DexStringMatch(
                                    split=apk.split_name,
                                    dex_name=entry_name,
                                    string=s,
                                )
                            )
    return matches
