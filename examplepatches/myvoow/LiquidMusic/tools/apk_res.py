#!/usr/bin/env python3
"""
LiquidMusic - reads the resources of an APK / APKM (standard library only).

  * decodes resources.arsc (names and simple values, all configurations);
  * prints a compiled layout as a tree, with references resolved;
  * searches resources by name.

Examples:
    python3 -I tools/apk_res.py app.apkm layout res/layout/fragment_music_content.xml
    python3 -I tools/apk_res.py app.apkm find 'bottom_nav|mini_?player'
    python3 -I tools/apk_res.py app.apkm value color/bottom_nav_background
"""

from __future__ import annotations

import argparse
import re
import struct
import sys
import zipfile
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from apk_triage import _read_string_pool, open_apks, pick_base  # noqa: E402

TYPE_NAMES = {
    0x00: "null", 0x01: "ref", 0x02: "attr", 0x03: "string", 0x04: "float",
    0x05: "dimen", 0x06: "fraction", 0x07: "dynref", 0x10: "int", 0x11: "hex",
    0x12: "bool", 0x1C: "argb8", 0x1D: "rgb8", 0x1E: "argb4", 0x1F: "rgb4",
}
DIMEN_UNITS = ["px", "dp", "sp", "pt", "in", "mm"]
RADIX_MULT = [1.0, 1.0 / (1 << 7), 1.0 / (1 << 15), 1.0 / (1 << 23)]


def complex_to_float(data: int) -> float:
    mantissa = data >> 8
    if mantissa & 0x800000:
        mantissa -= 1 << 24
    radix = (data >> 4) & 0x3
    return mantissa * RADIX_MULT[radix]


def format_value(vtype: int, data: int, strings: list[str], table: "ResTable | None" = None) -> str:
    if vtype == 0x03:
        return repr(strings[data]) if 0 <= data < len(strings) else f"str#{data}"
    if vtype in (0x01, 0x07):
        return table.ref_name(data) if table else f"@0x{data:08x}"
    if vtype == 0x02:
        return "?" + (table.ref_name(data)[1:] if table else f"0x{data:08x}")
    if vtype in (0x1C, 0x1D, 0x1E, 0x1F):
        return f"#{data:08x}"
    if vtype == 0x05:
        return f"{complex_to_float(data):g}{DIMEN_UNITS[data & 0xF] if (data & 0xF) < len(DIMEN_UNITS) else '?'}"
    if vtype == 0x06:
        return f"{complex_to_float(data) * 100:g}%"
    if vtype == 0x04:
        return f"{struct.unpack('<f', struct.pack('<I', data))[0]:g}"
    if vtype == 0x12:
        return "true" if data else "false"
    if vtype == 0x10:
        return str(data if data < 0x80000000 else data - (1 << 32))
    if vtype == 0x11:
        return f"0x{data:x}"
    if vtype == 0x00:
        return "@null"
    return f"<{TYPE_NAMES.get(vtype, vtype)}:{data}>"


def describe_config(cfg: bytes) -> str:
    """Readable qualifiers for the most useful fields of ResTable_config."""
    if len(cfg) < 8:
        return "default"
    parts = []
    size = struct.unpack_from("<I", cfg, 0)[0]
    if size >= 12:
        lang = cfg[8:10]
        if lang[0] and not lang[0] & 0x80:
            parts.append(lang.decode("ascii", "replace"))
    if size >= 16:
        orientation = cfg[12]
        density = struct.unpack_from("<H", cfg, 14)[0]
        if orientation:
            parts.append({1: "port", 2: "land"}.get(orientation, f"orient{orientation}"))
        if density:
            parts.append({120: "ldpi", 160: "mdpi", 213: "tvdpi", 240: "hdpi", 320: "xhdpi", 480: "xxhdpi",
                          640: "xxxhdpi", 0xFFFE: "anydpi", 0xFFFF: "nodpi"}.get(density, f"{density}dpi"))
    if size >= 32:
        ui_mode = cfg[29]
        sw = struct.unpack_from("<H", cfg, 30)[0]
        if ui_mode & 0x30 == 0x20:
            parts.append("night")
        elif ui_mode & 0x30 == 0x10:
            parts.append("notnight")
        if sw:
            parts.append(f"sw{sw}dp")
    if size >= 36:
        w, h = struct.unpack_from("<HH", cfg, 32)
        if w:
            parts.append(f"w{w}dp")
        if h:
            parts.append(f"h{h}dp")
    if size >= 28:
        sdk = struct.unpack_from("<H", cfg, 24)[0]
        if sdk:
            parts.append(f"v{sdk}")
    return "-".join(parts) or "default"


class ResTable:
    def __init__(self, data: bytes):
        self.names: dict[int, str] = {}           # resid -> "type/name"
        self.by_name: dict[str, int] = {}
        self.values: dict[int, list[tuple[str, str]]] = {}  # resid -> [(config, value)]
        self.global_strings: list[str] = []
        self._raw_values: list[tuple[int, str, int, int, list[tuple[int, int, int]] | None]] = []
        self._parse(data)
        # formatted afterwards: references need the complete name table
        for resid, cfg, vtype, vdata, bag in self._raw_values:
            if bag is None:
                text = format_value(vtype, vdata, self.global_strings, self)
            else:
                text = "{" + ", ".join(
                    f"{self.ref_name(k)[1:]}={format_value(t, d, self.global_strings, self)}" for k, t, d in bag[:12]
                ) + (" …" if len(bag) > 12 else "") + "}"
            self.values.setdefault(resid, []).append((cfg, text))
        del self._raw_values

    def ref_name(self, resid: int) -> str:
        if resid == 0:
            return "@null"
        name = self.names.get(resid)
        if name:
            return "@" + name
        if resid >> 24 == 0x01:
            return f"@android:0x{resid:08x}"
        return f"@0x{resid:08x}"

    def _parse(self, data: bytes) -> None:
        _t, hsize, _size, _pkgs = struct.unpack_from("<HHII", data, 0)
        off = hsize
        while off < len(data):
            ctype, chsize, csize = struct.unpack_from("<HHI", data, off)
            if ctype == 0x0001:
                self.global_strings = _read_string_pool(data, off)
            elif ctype == 0x0200:
                self._parse_package(data, off, chsize, csize)
            off += csize

    def _parse_package(self, data: bytes, start: int, hsize: int, size: int) -> None:
        pkg_id = struct.unpack_from("<I", data, start + 8)[0]
        type_strings_off, _lpt, key_strings_off, _lpk = struct.unpack_from("<IIII", data, start + 8 + 4 + 256)
        type_names = _read_string_pool(data, start + type_strings_off)
        key_names = _read_string_pool(data, start + key_strings_off)
        off = start + hsize
        end = start + size
        while off < end:
            ctype, chsize, csize = struct.unpack_from("<HHI", data, off)
            if ctype == 0x0201:
                self._parse_type(data, off, chsize, pkg_id, type_names, key_names)
            off += csize

    def _parse_type(self, data, off, hsize, pkg_id, type_names, key_names) -> None:
        type_id, flags, _res, entry_count, entries_start = struct.unpack_from("<BBHII", data, off + 8)
        cfg_size = struct.unpack_from("<I", data, off + 20)[0]
        cfg = describe_config(data[off + 20 : off + 20 + cfg_size])
        tname = type_names[type_id - 1] if 0 < type_id <= len(type_names) else f"type{type_id}"
        idx_off = off + hsize
        pairs: list[tuple[int, int]] = []
        if flags & 0x01:  # FLAG_SPARSE
            for i in range(entry_count):
                idx, o = struct.unpack_from("<HH", data, idx_off + 4 * i)
                pairs.append((idx, o * 4))
        elif flags & 0x02:  # FLAG_OFFSET16
            for i in range(entry_count):
                o = struct.unpack_from("<H", data, idx_off + 2 * i)[0]
                if o != 0xFFFF:
                    pairs.append((i, o * 4))
        else:
            for i in range(entry_count):
                o = struct.unpack_from("<I", data, idx_off + 4 * i)[0]
                if o != 0xFFFFFFFF:
                    pairs.append((i, o))
        base = off + entries_start
        for idx, o in pairs:
            e = base + o
            esize, eflags = struct.unpack_from("<HH", data, e)
            resid = (pkg_id << 24) | (type_id << 16) | idx
            if eflags & 0x0008:  # FLAG_COMPACT
                key = esize
                vtype = eflags >> 8
                vdata = struct.unpack_from("<I", data, e + 4)[0]
                bag = None
            else:
                key = struct.unpack_from("<I", data, e + 4)[0]
                if eflags & 0x0001:  # FLAG_COMPLEX (style / bag)
                    _parent, count = struct.unpack_from("<II", data, e + 8)
                    bag = []
                    p = e + esize
                    for _ in range(count):
                        name, _vs, _r0, t, d = struct.unpack_from("<IHBBI", data, p)
                        bag.append((name, t, d))
                        p += 12
                    vtype = vdata = 0
                else:
                    _vs, _r0, vtype, vdata = struct.unpack_from("<HBBI", data, e + esize)
                    bag = None
            name = f"{tname}/{key_names[key] if key < len(key_names) else key}"
            self.names[resid] = name
            self.by_name.setdefault(name, resid)
            self._raw_values.append((resid, cfg, vtype, vdata, bag))


# --------------------------------------------------------------------------- #
# Layouts
# --------------------------------------------------------------------------- #


def dump_layout(raw: bytes, table: ResTable, out=sys.stdout) -> None:
    strings: list[str] = []
    res_ids: list[int] = []
    depth = 0
    off = 8
    while off < len(raw):
        ctype, hsize, csize = struct.unpack_from("<HHI", raw, off)
        if csize == 0:
            break
        if ctype == 0x0001:
            strings = _read_string_pool(raw, off)
        elif ctype == 0x0180:
            res_ids = list(struct.unpack_from(f"<{(csize - hsize) // 4}I", raw, off + hsize))
        elif ctype == 0x0102:
            _ns, name_idx, attr_start, attr_size, attr_count = struct.unpack_from("<iiHHH", raw, off + 16)
            tag = strings[name_idx]
            attrs = []
            a = off + 16 + attr_start
            for i in range(attr_count):
                _ans, aname, araw, _vs, _r0, vtype, vdata = struct.unpack_from("<iiiHBBI", raw, a + i * attr_size)
                key = strings[aname] if 0 <= aname < len(strings) else f"attr{aname}"
                if araw >= 0 and vtype == 0x03:
                    val = repr(strings[araw])
                else:
                    val = format_value(vtype, vdata, strings, table)
                attrs.append(f"{key}={val}")
            out.write("  " * depth + f"<{tag}>\n")
            for at in attrs:
                out.write("  " * depth + f"    {at}\n")
            depth += 1
        elif ctype == 0x0103:
            depth -= 1
        off += csize


def load(path: str) -> tuple[zipfile.ZipFile, ResTable]:
    apks = open_apks(path)
    _name, base = pick_base(apks)
    return base, ResTable(base.read("resources.arsc"))


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("package")
    sub = ap.add_subparsers(dest="cmd", required=True)
    p = sub.add_parser("layout", help="prints a compiled layout (res/... path or layout/xxx name)")
    p.add_argument("paths", nargs="+")
    p = sub.add_parser("find", help="searches resources with a regex on 'type/name'")
    p.add_argument("regex")
    p.add_argument("--values", action="store_true", help="also prints the values")
    p = sub.add_parser("value", help="prints every value of a 'type/name' resource")
    p.add_argument("names", nargs="+")
    args = ap.parse_args()

    base, table = load(args.package)
    if args.cmd == "layout":
        for path in args.paths:
            targets = [path]
            if not path.startswith("res/"):
                rid = table.by_name.get(path)
                targets = sorted({v.strip("'") for _c, v in table.values.get(rid, [])}) if rid else []
            for t in targets:
                print(f"===== {t} =====")
                dump_layout(base.read(t), table)
                print()
    elif args.cmd == "find":
        rx = re.compile(args.regex, re.IGNORECASE)
        for rid, name in sorted(table.names.items()):
            if rx.search(name):
                print(f"0x{rid:08x}  {name}")
                if args.values:
                    for cfg, v in table.values.get(rid, []):
                        print(f"              [{cfg}] {v}")
    elif args.cmd == "value":
        for n in args.names:
            rid = table.by_name.get(n)
            print(f"{n} = 0x{rid:08x}" if rid else f"{n}: not found")
            for cfg, v in table.values.get(rid, []) if rid else []:
                print(f"    [{cfg}] {v}")


if __name__ == "__main__":
    main()
