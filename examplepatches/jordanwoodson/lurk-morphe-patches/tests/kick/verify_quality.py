#!/usr/bin/env python3
"""Check the Default video quality edit and execute Kick's actual default-ceiling reducer with it.

Requires hermes-dec. Usage:
    python tests/kick/verify_quality.py stock.bundle patched.apk [--height 1080]
    python tests/kick/verify_quality.py stock.bundle patched.bundle manifest.json

Kick's player store starts every stream, and goes back on Auto, through setDefaultMaxResolution: it reduces the
stream's video tracks to the tallest one no taller than PlayerConfig.settings.defaultMaxAutoQualityHeight (720) and
makes it the player's maxResolution. The patch makes that reducer's read of the default the chosen height. The two other
reads of the default decide, in the quality picker, which picks need a signed-in account, and must stay Kick's. The
limited interpreter rejects unknown instructions. It does not replace playback device tests.
"""
import argparse
import ast
from io import BytesIO
import json
from pathlib import Path
import re
import runpy
import struct
from zipfile import is_zipfile, ZipFile

from hermes_dec.parsers.hbc_bytecode_parser import parse_hbc_bytecode
from hermes_dec.parsers.hbc_file_parser import HBCReader
from hermes_dec.parsers.serialized_literal_parser import unpack_slp_array

UNDEFINED = object()
KEY = "default_video_quality"


def verify(stock, embedded, manifest, height):
    structural = runpy.run_path(str(Path(__file__).with_name("test_hermes.py")))
    structural["verify"](stock, embedded, manifest)
    reader = HBCReader()
    reader.read_whole_file(BytesIO(stock))

    def instructions(header, data):
        reader.file_buffer = BytesIO(data)
        return list(parse_hbc_bytecode(header, reader))

    # Find every real read of the default independently of how the patch finds its own.
    property_id = reader.strings.index("defaultMaxAutoQualityHeight")
    sites = {}
    for match in re.finditer(b"\x45..." + re.escape(struct.pack("<H", property_id)), stock, re.DOTALL):
        offset = match.start()
        for h in reader.function_headers:
            if h.offset <= offset < h.offset + h.bytecodeSizeInBytes:
                if any(i.original_pos + h.offset == offset and i.inst.name == "GetById" and i.arg4 == property_id
                       for i in structural["decoded"](reader, h, stock)):
                    sites[offset] = h
    assert len(sites) == 3, f"Expected three default reads, found {len(sites)}"

    # The reducer is the closure setDefaultMaxResolution creates.
    names = [h for h in reader.function_headers if reader.strings[h.functionName] == "setDefaultMaxResolution"]
    assert len(names) == 1, "expected one setDefaultMaxResolution"
    created = [i.arg3 for i in instructions(names[0], stock) if i.inst.name == "CreateClosure"]
    reducers = [offset for offset, h in sites.items() if reader.function_headers.index(h) in created]
    assert len(reducers) == 1, "expected one default read in a closure of setDefaultMaxResolution"
    reducer_site = reducers[0]
    reducer = sites[reducer_site]

    edits = [edit for edit in manifest["edits"] if edit["key"] == KEY]
    assert len(edits) == 1, "Default video quality must edit exactly the reducer's read"
    edit = edits[0]
    before, after = bytes.fromhex(edit["original"]), bytes.fromhex(edit["replacement"])
    assert edit["offset"] == reducer_site and len(before) == len(after) == 6, "the edit isn't the reducer's read"
    assert after[:2] == bytes([0x8c, before[1]]), "changed destination or instruction"
    assert struct.unpack("<i", after[2:])[0] == height, "wrong quality option"
    assert all(not (e["offset"] <= site < e["offset"] + len(e["original"]) // 2)
               for e in manifest["edits"] for site in sites if site != reducer_site), "a picker gate was edited"
    selected = bytearray(stock)
    selected[reducer_site:reducer_site + 6] = after
    structural["decoded"](reader, reducer, selected)

    def literal(value):
        if value == "undefined":
            return UNDEFINED
        if value in ("null", "true", "false"):
            return {"null": None, "true": True, "false": False}[value]
        return ast.literal_eval(value)

    def execute(header, data, environments, params=()):
        code = {i.original_pos: i for i in instructions(header, data)}
        r, pc = {}, 0
        for _ in range(1000):
            i = code[pc]
            op = i.inst.name
            a = [getattr(i, f"arg{j}") for j in range(1, len(i.inst.operands) + 1)]
            pc = i.next_pos
            if op == "GetParentEnvironment":
                r[a[0]] = environments[a[1]]
            elif op == "LoadFromEnvironment":
                r[a[0]] = r[a[1]][a[2]]
            elif op == "LoadParam":
                r[a[0]] = params[a[1] - 1]
            elif op in ("LoadConstInt", "LoadConstUInt8"):
                r[a[0]] = a[1]
            elif op in ("GetById", "GetByIdShort"):
                r[a[0]] = r[a[1]].get(reader.strings[a[3]], UNDEFINED)
            elif op in ("NewObjectWithBuffer", "NewObjectWithBufferLong"):
                keys = reader.object_shape_keys[a[1]]
                values = unpack_slp_array(reader.literal_values[a[2]:], len(keys), 99).to_strings(reader.strings)
                r[a[0]] = {literal(k): literal(v) for k, v in zip(keys, values)}
            elif op == "PutOwnBySlotIdx":
                r[a[0]][list(r[a[0]])[a[2]]] = r[a[1]]
            elif op == "Mov":
                r[a[0]] = r[a[1]]
            elif op in ("JNotLessEqual", "JNotGreater", "JLessEqual", "JGreater"):
                left, right = r[a[1]], r[a[2]]
                holds = left <= right if "LessEqual" in op else left > right
                if holds != op.startswith("JNot"):
                    pc = i.original_pos + a[0]
            elif op == "Ret":
                return r[a[0]]
            else:
                raise AssertionError(f"Unsupported executed instruction: {op}")
        raise AssertionError("Unexpected bytecode loop")

    config = {7: {"PlayerConfig": {"settings": {"defaultMaxAutoQualityHeight": 720}}}}

    def ceiling(data, heights):
        """What setDefaultMaxResolution makes the ceiling for a stream with these heights (16:9)."""
        best = {"width": 0, "height": 0}
        for track in heights:
            best = execute(reducer, data, [config], (best, {"size": {"width": track * 16 // 9, "height": track}}))
        return best["height"]

    full = [1080, 936, 720, 480, 360, 160]
    assert ceiling(stock, full) == 720, "stock doesn't start at 720"
    assert ceiling(selected, full) == height, f"the patched reducer doesn't start at {height}p"
    without = [h for h in full if h != height]
    expected = max(h for h in without if h <= height)
    assert ceiling(selected, without) == expected, "a stream without the chosen height doesn't start at the next one down"
    assert ceiling(selected, [1440, 2160]) == 0, "a ceiling above every track"
    print(f"PASS: one edit, the default ceiling's reducer; {height}p start and Auto (next one down without it); the "
          "picker's two sign-in gates keep Kick's 720")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("stock", type=Path)
    parser.add_argument("patched", type=Path)
    parser.add_argument("manifest", nargs="?", type=Path)
    parser.add_argument("--height", type=int, default=1080, choices=(1080, 720, 480, 360, 240))
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
    verify(args.stock.read_bytes(), embedded, manifest, args.height)
