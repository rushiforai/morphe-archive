#!/usr/bin/env python3
"""Locate Rambler personalization settings evidence inside a Gboard APK.

EXPERIMENTAL ANALYZER - analysis aid only, not a patcher.

Given a Gboard APK (for example the 18.6.3.x beta line), scan every
classes*.dex string table for:

  1. UI literals published in the 2026-11-05 Android Authority teardown of
     Gboard 18.6.3.10 beta ("Remember corrected words", "Contact names",
     "Voice correction list", "Clear all collected words", and the toggle
     description "Learn and use words you've corrected when voice typing
     with Rambler").
  2. Candidate key/flag strings whose names suggest they gate those
     features (see KEY_HINTS below).

The report tells a human reviewer WHERE the personalization evidence lives
so a fail-closed fingerprint profile can be reviewed and written by hand.
It does not patch anything, does not prove any feature works, and must
never be cited as evidence that a feature functions. Runtime behaviour is
proven on a device or not at all.

Stdlib only. Unreadable or unsupported DEX input exits 2 and writes no
report. This structural check is not a complete DEX verifier. DEX 041 and
APKM bundles are not supported. Compiled resources get byte-match leads,
not decoded resource identifiers.

Exit codes: 0 report written to stdout; 2 invalid input; 3 no dex found.
"""

from __future__ import annotations

import hashlib
import json
import struct
import sys
import zipfile

UI_TERMS = [
    "Remember corrected words",
    "Contact names",
    "Voice correction list",
    "Clear all collected words",
    "Learn and use words you've corrected when voice typing with Rambler",
]

# Substrings (case-insensitive) that mark candidate flag/preference keys.
# A hit here is a lead for review, not a confirmed gate.
KEY_HINTS = [
    "voice_correction",
    "corrected_words",
    "correction_list",
    "contact_names",
    "collected_words",
    "rambler_learn",
    "learn_corrected",
    "voice_typing_correction",
]

def _uleb128(data: bytes, off: int) -> tuple[int, int]:
    value = 0
    shift = 0
    for byte_index in range(5):
        if off >= len(data):
            raise ValueError("uleb128 overruns buffer")
        byte = data[off]
        off += 1
        value |= (byte & 0x7F) << shift
        if byte_index == 4 and byte > 0x0F:
            raise ValueError("uleb128 exceeds 32 bits")
        if not byte & 0x80:
            return value, off
        shift += 7
    raise ValueError("uleb128 too long")


def parse_dex_strings(blob: bytes) -> list[str]:
    """Return the decoded string table of one DEX image.

    Raises ValueError on any structural problem (fail-closed: the caller
    turns that into exit 2). This is not a complete DEX verifier.
    MUTF-8 is decoded as UTF-8 with replacement,
    which is exact for the ASCII terms this tool searches.
    """
    if (len(blob) < 0x70 or blob[:8] not in
            (b"dex\n035\0", b"dex\n037\0", b"dex\n038\0", b"dex\n039\0", b"dex\n040\0")):
        raise ValueError("not a DEX image")
    file_size, header_size, endian = struct.unpack_from("<III", blob, 0x20)
    if file_size != len(blob) or header_size != 0x70 or endian != 0x12345678:
        raise ValueError("unsupported or inconsistent DEX header")
    string_ids_size, string_ids_off = struct.unpack_from("<II", blob, 0x38)
    if string_ids_size > 1_000_000:
        raise ValueError("implausible string table size")
    if string_ids_size and (string_ids_off < 0x70 or string_ids_off % 4):
        raise ValueError("invalid string_ids offset")
    if string_ids_off + 4 * string_ids_size > len(blob):
        raise ValueError("string_ids array overruns buffer")
    data_start = string_ids_off + 4 * string_ids_size
    strings: list[str] = []
    for i in range(string_ids_size):
        (data_off,) = struct.unpack_from("<I", blob, string_ids_off + 4 * i)
        if data_off < data_start or data_off >= len(blob):
            raise ValueError("string data offset overruns buffer")
        _utf16_len, pos = _uleb128(blob, data_off)
        end = blob.find(b"\x00", pos)
        if end == -1:
            raise ValueError("unterminated string data")
        strings.append(blob[pos:end].decode("utf-8", errors="replace"))
    return strings


def scan_dex(name: str, blob: bytes) -> dict:
    strings = parse_dex_strings(blob)
    ui_hits = []
    key_candidates = []
    for index, value in enumerate(strings):
        for term in UI_TERMS:
            if term in value:
                ui_hits.append({"string_index": index, "term": term, "value": value})
        lowered = value.lower()
        for hint in KEY_HINTS:
            if hint in lowered:
                key_candidates.append({"string_index": index, "hint": hint, "value": value})
                break
    return {"dex": name, "string_count": len(strings), "ui_hits": ui_hits, "key_candidates": key_candidates}


def scan_apk(apk_path: str) -> dict:
    try:
        archive = zipfile.ZipFile(apk_path)
    except (OSError, zipfile.BadZipFile) as exc:
        raise ValueError(f"cannot open APK: {exc}") from exc
    with archive:
        names = archive.namelist()
        if len(set(names)) != len(names):
            raise ValueError("duplicate ZIP member names")
        dex_names = sorted(
            n for n in names
            if n == "classes.dex" or (n.startswith("classes") and n.endswith(".dex") and n[7:-4].isdigit())
        )
        if not dex_names:
            raise LookupError("no classes*.dex in APK; supply an APK, not an APKM bundle")
        try:
            results = [scan_dex(name, archive.read(name)) for name in dex_names]
            # UI text may be in compiled Android resources rather than DEX.
            # Byte matches are leads only; this does not decode the resource table.
            resource_hits = []
            if "resources.arsc" in names:
                data = archive.read("resources.arsc")
                for term in UI_TERMS:
                    for encoding in ("utf-8", "utf-16le"):
                        offset = data.find(term.encode(encoding))
                        if offset >= 0:
                            resource_hits.append({"term": term, "encoding": encoding, "byte_offset": offset})
        except (OSError, zipfile.BadZipFile, RuntimeError) as exc:
            raise ValueError(f"cannot read APK members: {exc}") from exc
    with open(apk_path, "rb") as source:
        checksum = hashlib.sha256()
        for chunk in iter(lambda: source.read(1024 * 1024), b""):
            checksum.update(chunk)
        digest = checksum.hexdigest()
    return {
        "apk": apk_path,
        "apk_sha256": digest,
        "dex_scanned": dex_names,
        "results": results,
        "resource_ui_hits": resource_hits,
        "note": "Analysis aid only. Hits do not prove a gate or working feature. "
                "No hits do not prove absence. No patch is produced.",
    }


def main(argv: list[str]) -> int:
    if len(argv) != 2:
        print("usage: find_personalization_flags.py <gboard.apk>", file=sys.stderr)
        return 2
    try:
        report = scan_apk(argv[1])
    except ValueError as exc:
        print(f"FAIL-CLOSED ABORT: {exc}", file=sys.stderr)
        return 2
    except LookupError as exc:
        print(f"FAIL-CLOSED ABORT: {exc}", file=sys.stderr)
        return 3
    json.dump(report, sys.stdout, indent=2)
    print()
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
