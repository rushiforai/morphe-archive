#!/usr/bin/env python3
"""Independently verify an emitted Twitch Hermes bundle and its runtime edit manifest.

Usage (with hermes-dec installed in this Python environment):
    python tests/twitch/test_hermes.py stock.bundle patched.apk
    python tests/twitch/test_hermes.py stock.bundle patched.bundle manifest.json

This reads artifacts only. It validates bytecode structure and reversible toggles;
it does not execute React Native or replace device playback tests.
"""
import argparse
from hashlib import sha1, sha256
from io import BytesIO
import json
from pathlib import Path
import re
import struct
from zipfile import is_zipfile, ZipFile

from hermes_dec.parsers.hbc_bytecode_parser import parse_hbc_bytecode
from hermes_dec.parsers.hbc_file_parser import HBCReader

STOCK_SHA256 = "059f4713e0cea80b58e68b675fb05d63053056869e2ac60c79f5d57567a3e583"


def footer(data):
    return bytes(data[:-20]) + sha1(data[:-20]).digest()


def decoded(reader, header, data):
    reader.file_buffer = BytesIO(data)
    instructions = list(parse_hbc_bytecode(header, reader))
    assert instructions and instructions[-1].next_pos == header.bytecodeSizeInBytes, "Truncated instruction"
    boundaries = {instruction.original_pos for instruction in instructions}
    for instruction in instructions:
        for index, operand in enumerate(instruction.inst.operands, start=1):
            if operand.operand_type.name in ("Addr8", "Addr32"):
                target = instruction.original_pos + getattr(instruction, f"arg{index}")
                assert target in boundaries, f"Branch target {target:#x} is not an instruction boundary"
        if getattr(instruction, "switch_jump_table", None):
            assert set(instruction.switch_jump_table) <= boundaries, "Invalid switch target"
    return instructions


def verify(stock, embedded, manifest):
    assert sha256(stock).hexdigest() == STOCK_SHA256, "Unexpected stock asset"
    assert manifest["format"] == 1 and manifest["version"] == 98, "Unexpected manifest format"
    assert manifest["sourceSha256"] == STOCK_SHA256, "Manifest source differs"
    assert sha256(embedded).hexdigest() == manifest["embeddedSha256"], "Embedded hash differs"
    append = manifest.get("append")
    if append:
        from verify_delayed_hermes import verify as verify_append
        verify_append(stock, embedded, manifest)
    else:
        assert len(embedded) == len(stock), "Bundle length changed without append manifest"
    assert footer(embedded) == embedded, "Invalid embedded SHA-1 footer"
    edits = manifest["edits"]
    assert edits, "No registered edits"
    expected = bytearray(stock)
    previous_end = 0
    for edit in edits:
        assert re.fullmatch(r"[a-z][a-z0-9_]*", edit["key"]), "Invalid setting key"
        for field in ("original", "replacement"):
            assert re.fullmatch(r"(?:[0-9a-f]{2})+", edit[field]), "Invalid lowercase byte encoding"
        original, replacement = bytes.fromhex(edit["original"]), bytes.fromhex(edit["replacement"])
        offset = edit["offset"]
        assert len(original) == len(replacement), "Relocating edit"
        assert previous_end <= offset and offset + len(original) <= len(stock) - 20, "Overlapping or unbounded edits"
        previous_end = offset + len(original)
        assert stock[offset:previous_end] == original, "Original bytes differ"
        assert type(edit["default"]) is bool, "Default is not a boolean"
        if edit["default"]:
            expected[offset:previous_end] = replacement
    if append:
        expected = expected[:-20] + bytes.fromhex(append["tail"]) + bytes(20)
        expected[append["headerOffset"]:append["headerOffset"]+12] = bytes.fromhex(append["replacementHeader"])
        struct.pack_into('<I',expected,32,len(expected))
    assert footer(expected) == embedded, "Embedded content differs outside declared edits"

    reader = HBCReader()
    reader.read_whole_file(BytesIO(stock))
    assert reader.header.version == 98
    affected = set()
    for edit in edits:
        owners = [index for index, header in enumerate(reader.function_headers)
                  if header.offset <= edit["offset"] and
                  edit["offset"] + len(bytes.fromhex(edit["original"])) <= header.offset + header.bytecodeSizeInBytes]
        assert len(owners) == 1, "Edit is not contained in one unique function"
        affected.add(owners[0])

    keys = sorted({edit["key"] for edit in edits})
    if append and append["key"] not in keys:
        keys.append(append["key"])
    # All off, all on, and each toggle alone must remain valid independently.
    states = [set(), set(keys)] + [{key} for key in keys]
    for enabled in states:
        selected = bytearray(embedded)
        for edit in edits:
            value = bytes.fromhex(edit["replacement"] if edit["key"] in enabled else edit["original"])
            selected[edit["offset"]:edit["offset"] + len(value)] = value
        if append and append["key"] not in enabled:
            selected = selected[:append["originalLength"]]
            selected[append["headerOffset"]:append["headerOffset"]+12] = bytes.fromhex(append["originalHeader"])
            struct.pack_into('<I',selected,32,len(selected))
        selected = footer(selected)
        if not enabled:
            assert selected == stock, "All-off failed to restore stock byte for byte"
        for index in affected:
            header = reader.function_headers[index]
            decoded(reader, header, selected)

    privacy = [edit for edit in edits if edit["key"] == "disable_analytics"]
    assert len(privacy) == 2, "Both enqueue and flush need guards"
    names = set()
    for edit in privacy:
        header = next(h for h in reader.function_headers if h.offset == edit["offset"])
        names.add(reader.strings[header.functionName])
        instructions = decoded(reader, header, embedded)
        assert [i.inst.name for i in instructions[:2]] == ["LoadConstUndefined", "Ret"]
        assert instructions[0].arg1 == instructions[1].arg1
        assert all(i.inst.name == "Unreachable" for i in instructions[2:] if i.original_pos < len(bytes.fromhex(edit["replacement"])))
    assert names == {"enqueue", "flush"}

    print(f"PASS: {len(edits)} edits in {len(affected)} functions; {len(keys)} independent settings; "
          "all-off exact restoration, declared layout, valid instruction boundaries and branches")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("stock", type=Path)
    parser.add_argument("patched", type=Path)
    parser.add_argument("manifest", nargs="?", type=Path)
    args = parser.parse_args()
    if is_zipfile(args.patched):
        with ZipFile(args.patched) as apk:
            embedded = apk.read("assets/index.android.bundle")
            manifest = json.loads(apk.read("assets/lurk-hermes.json"))
    else:
        if args.manifest is None:
            parser.error("manifest is required for a raw bytecode file")
        embedded = args.patched.read_bytes()
        manifest = json.loads(args.manifest.read_text())
    verify(args.stock.read_bytes(), embedded, manifest)
