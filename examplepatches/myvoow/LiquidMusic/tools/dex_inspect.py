#!/usr/bin/env python3
"""
LiquidMusic - minimal inspection of the DEX files of an APK / APKM (standard library only).

Finds, in code obfuscated by R8, the classes, fields and methods a patch has to
target, without jadx.

Examples:
    python3 -I tools/dex_inspect.py app.apkm class 'eightbitlab/com/blurview/BlurView;'
    python3 -I tools/dex_inspect.py app.apkm implements 'Leightbitlab/com/blurview/'
    python3 -I tools/dex_inspect.py app.apkm field-type 'Landroid/graphics/RenderNode;'
    python3 -I tools/dex_inspect.py app.apkm callers 'Leightbitlab/com/blurview/BlurView;' '.*'
"""

from __future__ import annotations

import argparse
import re
import struct
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from apk_triage import _uleb128, open_apks, pick_base  # noqa: E402

ACC = [(0x1, "public"), (0x2, "private"), (0x4, "protected"), (0x8, "static"), (0x10, "final"),
       (0x20, "synchronized"), (0x40, "volatile/bridge"), (0x80, "transient/varargs"), (0x100, "native"),
       (0x200, "interface"), (0x400, "abstract"), (0x1000, "synthetic"), (0x4000, "enum"),
       (0x10000, "constructor")]


def flags_str(f: int) -> str:
    return " ".join(n for b, n in ACC if f & b)


# Size of each Dalvik instruction, in 16-bit code units, by opcode.
def _insn_sizes() -> list[int]:
    s = [1] * 256
    two = [0x02, 0x05, 0x08, 0x13, 0x15, 0x16, 0x19, 0x1A, 0x1C, 0x1F, 0x20, 0x22, 0x23, 0x29, 0x2D, 0x2E, 0x2F,
           0x30, 0x31] + list(range(0x32, 0x3E)) + list(range(0x44, 0x6E)) + list(range(0x90, 0xB0)) + \
          list(range(0xD0, 0xE3)) + [0xFE, 0xFF]
    three = [0x03, 0x06, 0x09, 0x14, 0x17, 0x1B, 0x24, 0x25, 0x26, 0x2A, 0x2B, 0x2C] + list(range(0x6E, 0x73)) + \
            list(range(0x74, 0x79)) + [0xFC, 0xFD]
    for o in two:
        s[o] = 2
    for o in three:
        s[o] = 3
    s[0x18] = 5  # const-wide
    s[0xFA] = 4  # invoke-polymorphic
    s[0xFB] = 4  # invoke-polymorphic/range
    s[0x2A] = 3  # goto/32
    return s


INSN_SIZES = _insn_sizes()


class Dex:
    def __init__(self, name: str, data: bytes):
        self.name = name
        self.d = data
        h = struct.unpack_from("<8I", data, 0x38)
        (self.str_n, self.str_off, self.type_n, self.type_off, self.proto_n, self.proto_off,
         self.field_n, self.field_off) = h
        self.meth_n, self.meth_off, self.cls_n, self.cls_off = struct.unpack_from("<4I", data, 0x58)
        self._strings: dict[int, str] = {}

    def string(self, i: int) -> str:
        s = self._strings.get(i)
        if s is None:
            sdo = struct.unpack_from("<I", self.d, self.str_off + 4 * i)[0]
            _n, p = _uleb128(self.d, sdo)
            s = self.d[p : self.d.index(b"\x00", p)].decode("utf-8", "replace")
            self._strings[i] = s
        return s

    def type(self, i: int) -> str:
        return self.string(struct.unpack_from("<I", self.d, self.type_off + 4 * i)[0])

    def proto(self, i: int) -> str:
        _shorty, ret, params_off = struct.unpack_from("<III", self.d, self.proto_off + 12 * i)
        params = []
        if params_off:
            n = struct.unpack_from("<I", self.d, params_off)[0]
            params = [self.type(struct.unpack_from("<H", self.d, params_off + 4 + 2 * k)[0]) for k in range(n)]
        return f"({''.join(params)}){self.type(ret)}"

    def field(self, i: int) -> tuple[str, str, str]:
        cls, typ, name = struct.unpack_from("<HHI", self.d, self.field_off + 8 * i)
        return self.type(cls), self.string(name), self.type(typ)

    def method(self, i: int) -> tuple[str, str, str]:
        cls, proto, name = struct.unpack_from("<HHI", self.d, self.meth_off + 8 * i)
        return self.type(cls), self.string(name), self.proto(proto)

    def classes(self):
        for k in range(self.cls_n):
            (cidx, access, sup, ifaces_off, _src, _ann, data_off, _sv) = struct.unpack_from(
                "<8I", self.d, self.cls_off + 32 * k)
            yield cidx, access, sup, ifaces_off, data_off

    def interfaces(self, off: int) -> list[str]:
        if not off:
            return []
        n = struct.unpack_from("<I", self.d, off)[0]
        return [self.type(struct.unpack_from("<H", self.d, off + 4 + 2 * k)[0]) for k in range(n)]

    def class_data(self, off: int):
        """-> (fields[(idx, flags, static)], methods[(idx, flags, code_off)])"""
        if not off:
            return [], []
        d = self.d
        sf, p = _uleb128(d, off)
        inf, p = _uleb128(d, p)
        dm, p = _uleb128(d, p)
        vm, p = _uleb128(d, p)
        fields, methods = [], []
        for count, static in ((sf, True), (inf, False)):
            idx = 0
            for _ in range(count):
                diff, p = _uleb128(d, p)
                fl, p = _uleb128(d, p)
                idx += diff
                fields.append((idx, fl, static))
        for count in (dm, vm):
            idx = 0
            for _ in range(count):
                diff, p = _uleb128(d, p)
                fl, p = _uleb128(d, p)
                code, p = _uleb128(d, p)
                idx += diff
                methods.append((idx, fl, code))
        return fields, methods

    def code_refs(self, code_off: int):
        """Yields (kind, index) for the instructions that reference methods, fields, types or strings."""
        if not code_off:
            return
        d = self.d
        insns_size = struct.unpack_from("<I", d, code_off + 12)[0]
        p = code_off + 16
        end = p + 2 * insns_size
        while p < end:
            unit = struct.unpack_from("<H", d, p)[0]
            op = unit & 0xFF
            if op == 0x00 and unit != 0:  # pseudo-instructions (switch / array data)
                ident = unit
                if ident == 0x0100:
                    n = struct.unpack_from("<H", d, p + 2)[0]
                    p += (4 + n * 2) * 2
                elif ident == 0x0200:
                    n = struct.unpack_from("<H", d, p + 2)[0]
                    p += (2 + n * 4) * 2
                elif ident == 0x0300:
                    w, n = struct.unpack_from("<HI", d, p + 2)
                    p += ((n * w + 1) // 2 + 4) * 2
                else:
                    p += 2
                continue
            if (0x6E <= op <= 0x78 and op != 0x73) or op in (0xFA, 0xFB):
                yield "invoke", struct.unpack_from("<H", d, p + 2)[0]
            elif 0x52 <= op <= 0x6D:
                yield ("iget" if op < 0x59 else "iput" if op < 0x60 else "sget" if op < 0x67 else "sput"), \
                    struct.unpack_from("<H", d, p + 2)[0]
            elif op == 0x1A:
                yield "string", struct.unpack_from("<H", d, p + 2)[0]
            elif op == 0x1B:
                yield "string", struct.unpack_from("<I", d, p + 2)[0]
            elif op in (0x1C, 0x1F, 0x20, 0x22, 0x23):
                yield "type", struct.unpack_from("<H", d, p + 2)[0]
            p += INSN_SIZES[op] * 2


def load_dexes(path: str) -> list[Dex]:
    apks = open_apks(path)
    _n, base = pick_base(apks)
    names = sorted((n for n in base.namelist() if re.fullmatch(r"classes\d*\.dex", n)),
                   key=lambda n: int(re.sub(r"\D", "", n) or 1))
    return [Dex(n, base.read(n)) for n in names]


def describe_class(dex: Dex, cidx, access, sup, ifaces_off, data_off, with_code=False) -> str:
    out = [f"{flags_str(access)} {dex.type(cidx)}  [{dex.name}]"]
    if sup != 0xFFFFFFFF:
        out.append(f"  extends {dex.type(sup)}")
    for i in dex.interfaces(ifaces_off):
        out.append(f"  implements {i}")
    fields, methods = dex.class_data(data_off)
    for idx, fl, _st in fields:
        _c, name, typ = dex.field(idx)
        out.append(f"  field  {flags_str(fl):<24} {name}: {typ}")
    for idx, fl, code in methods:
        _c, name, proto = dex.method(idx)
        out.append(f"  method {flags_str(fl):<24} {name}{proto}")
        if with_code:
            for kind, ref in dex.code_refs(code):
                if kind == "invoke":
                    c, n, pr = dex.method(ref)
                    out.append(f"      -> {c}->{n}{pr}")
                elif kind in ("iget", "iput", "sget", "sput"):
                    c, n, t = dex.field(ref)
                    out.append(f"      {kind} {c}->{n}:{t}")
                elif kind == "string":
                    out.append(f"      str {dex.string(ref)!r:.120}")
                elif kind == "type":
                    out.append(f"      type {dex.type(ref)}")
    return "\n".join(out)


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("package")
    sub = ap.add_subparsers(dest="cmd", required=True)
    p = sub.add_parser("class", help="describes the classes whose descriptor matches the regex")
    p.add_argument("regex")
    p.add_argument("--code", action="store_true", help="lists the references of each method")
    p = sub.add_parser("implements", help="classes that extend or implement a matching type")
    p.add_argument("regex")
    p = sub.add_parser("field-type", help="fields whose type matches the regex")
    p.add_argument("regex")
    p = sub.add_parser("callers", help="methods that call <class regex>-><method regex>")
    p.add_argument("cls")
    p.add_argument("meth")
    p = sub.add_parser("string-users", help="methods that load a string matching the regex")
    p.add_argument("regex")
    args = ap.parse_args()

    dexes = load_dexes(args.package)
    if args.cmd == "class":
        rx = re.compile(args.regex)
        for dex in dexes:
            for c in dex.classes():
                if rx.search(dex.type(c[0])):
                    print(describe_class(dex, *c, with_code=args.code))
                    print()
    elif args.cmd == "implements":
        rx = re.compile(args.regex)
        for dex in dexes:
            for cidx, access, sup, ifo, _do in dex.classes():
                parents = ([dex.type(sup)] if sup != 0xFFFFFFFF else []) + dex.interfaces(ifo)
                hit = [t for t in parents if rx.search(t)]
                if hit:
                    print(f"{dex.type(cidx)}  <:  {', '.join(hit)}   [{dex.name}]")
    elif args.cmd == "field-type":
        rx = re.compile(args.regex)
        for dex in dexes:
            for cidx, _a, _s, _i, data_off in dex.classes():
                fields, _m = dex.class_data(data_off)
                for idx, fl, _st in fields:
                    c, n, t = dex.field(idx)
                    if rx.search(t):
                        print(f"{c}->{n}: {t}  ({flags_str(fl)})  [{dex.name}]")
    elif args.cmd in ("callers", "string-users"):
        if args.cmd == "callers":
            rc, rm = re.compile(args.cls), re.compile(args.meth)
        else:
            rs = re.compile(args.regex)
        for dex in dexes:
            for cidx, _a, _s, _i, data_off in dex.classes():
                _f, methods = dex.class_data(data_off)
                for idx, _fl, code in methods:
                    hits = set()
                    for kind, ref in dex.code_refs(code):
                        if args.cmd == "callers" and kind == "invoke":
                            c, n, pr = dex.method(ref)
                            if rc.search(c) and rm.search(n):
                                hits.add(f"{c}->{n}{pr}")
                        elif args.cmd == "string-users" and kind == "string":
                            s = dex.string(ref)
                            if rs.search(s):
                                hits.add(repr(s[:100]))
                    if hits:
                        c, n, pr = dex.method(idx)
                        print(f"{c}->{n}{pr}  [{dex.name}]")
                        for h in sorted(hits):
                            print(f"      {h}")


if __name__ == "__main__":
    main()
