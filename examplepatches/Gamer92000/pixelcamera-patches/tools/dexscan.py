#!/usr/bin/env python3
# SPDX-License-Identifier: GPL-3.0-or-later
"""
dexscan.py - dependency-free static analyser for Android APKs.

Written for the "Use third-party gallery" Morphe patch so that the Pixel Camera
APK can be inspected without apktool / baksmali / jadx / the Android SDK.
Pure Python 3.9+ standard library only.

It parses the real binary formats:

  * APK (zip) container, including split/APKS/APKM/XAPK archives-of-archives
  * AndroidManifest.xml (binary AXML / ResChunk)
  * classes*.dex (header, string_ids, type_ids, proto_ids, field_ids,
    method_ids, class_defs, class_data_item, code_item)
  * Dalvik instruction stream (full opcode width table + payload handling)

Subcommands
-----------
  info       package name, versionCode/versionName, sdk levels, permissions,
             providers/authorities, exported components, split config
  strings    grep the DEX string pools
  xref       find every method that references a string / method / field / class
  dump       print a smali-like listing of a single method
  hunt       opinionated sweep for the gallery-launch code paths (the indicators
             listed in the patch investigation procedure)

Examples
--------
  python tools/dexscan.py info  PixelCamera.apk
  python tools/dexscan.py strings PixelCamera.apk --regex "apps\\.photos"
  python tools/dexscan.py xref  PixelCamera.apk --string "com.google.android.apps.photos"
  python tools/dexscan.py xref  PixelCamera.apk --method "Landroid/content/Intent;->setPackage"
  python tools/dexscan.py dump  PixelCamera.apk --class "Lcom/foo/Bar;" --method-name "onClick"
  python tools/dexscan.py hunt  PixelCamera.apk --out findings.json
"""

from __future__ import annotations

import argparse
import io
import json
import os
import re
import struct
import sys
import zipfile
from dataclasses import dataclass, field
from typing import Dict, Iterable, List, Optional, Sequence, Tuple

# --------------------------------------------------------------------------- #
# Dalvik opcode widths, in 16-bit code units, indexed by opcode byte.
# Source of truth: Dalvik bytecode format (dalvik/docs/instruction-formats).
# Index 0x00 is special-cased at decode time (nop vs. switch/array payloads).
# --------------------------------------------------------------------------- #

def _build_opcode_widths() -> List[int]:
    w = [1] * 256

    def setrange(lo: int, hi: int, size: int) -> None:
        for op in range(lo, hi + 1):
            w[op] = size

    w[0x00] = 1                       # nop / payload (handled separately)
    setrange(0x01, 0x01, 1)           # move                        12x
    setrange(0x02, 0x02, 2)           # move/from16                 22x
    setrange(0x03, 0x03, 3)           # move/16                     32x
    setrange(0x04, 0x04, 1)           # move-wide                   12x
    setrange(0x05, 0x05, 2)           # move-wide/from16            22x
    setrange(0x06, 0x06, 3)           # move-wide/16                32x
    setrange(0x07, 0x07, 1)           # move-object                 12x
    setrange(0x08, 0x08, 2)           # move-object/from16          22x
    setrange(0x09, 0x09, 3)           # move-object/16              32x
    setrange(0x0A, 0x0D, 1)           # move-result*, move-exception 11x
    setrange(0x0E, 0x11, 1)           # return*                     10x/11x
    setrange(0x12, 0x12, 1)           # const/4                     11n
    setrange(0x13, 0x13, 2)           # const/16                    21s
    setrange(0x14, 0x14, 3)           # const                       31i
    setrange(0x15, 0x15, 2)           # const/high16                21h
    setrange(0x16, 0x16, 2)           # const-wide/16               21s
    setrange(0x17, 0x17, 3)           # const-wide/32               31i
    setrange(0x18, 0x18, 5)           # const-wide                  51l
    setrange(0x19, 0x19, 2)           # const-wide/high16           21h
    setrange(0x1A, 0x1A, 2)           # const-string                21c
    setrange(0x1B, 0x1B, 3)           # const-string/jumbo          31c
    setrange(0x1C, 0x1C, 2)           # const-class                 21c
    setrange(0x1D, 0x1E, 1)           # monitor-enter/exit          11x
    setrange(0x1F, 0x1F, 2)           # check-cast                  21c
    setrange(0x20, 0x20, 2)           # instance-of                 22c
    setrange(0x21, 0x21, 1)           # array-length                12x
    setrange(0x22, 0x22, 2)           # new-instance                21c
    setrange(0x23, 0x23, 2)           # new-array                   22c
    setrange(0x24, 0x24, 3)           # filled-new-array            35c
    setrange(0x25, 0x25, 3)           # filled-new-array/range      3rc
    setrange(0x26, 0x26, 3)           # fill-array-data             31t
    setrange(0x27, 0x27, 1)           # throw                       11x
    setrange(0x28, 0x28, 1)           # goto                        10t
    setrange(0x29, 0x29, 2)           # goto/16                     20t
    setrange(0x2A, 0x2A, 3)           # goto/32                     30t
    setrange(0x2B, 0x2C, 3)           # packed-/sparse-switch       31t
    setrange(0x2D, 0x31, 2)           # cmpl-float .. cmp-long      23x
    setrange(0x32, 0x37, 2)           # if-test                     22t
    setrange(0x38, 0x3D, 2)           # if-testz                    21t
    setrange(0x3E, 0x43, 1)           # unused
    setrange(0x44, 0x51, 2)           # aget* / aput*               23x
    setrange(0x52, 0x5F, 2)           # iget* / iput*               22c
    setrange(0x60, 0x6D, 2)           # sget* / sput*               21c
    setrange(0x6E, 0x72, 3)           # invoke-kind                 35c
    setrange(0x73, 0x73, 1)           # unused
    setrange(0x74, 0x78, 3)           # invoke-kind/range           3rc
    setrange(0x79, 0x7A, 1)           # unused
    setrange(0x7B, 0x8F, 1)           # unop                        12x
    setrange(0x90, 0xAF, 2)           # binop                       23x
    setrange(0xB0, 0xCF, 1)           # binop/2addr                 12x
    setrange(0xD0, 0xD7, 2)           # binop/lit16                 22s
    setrange(0xD8, 0xE2, 2)           # binop/lit8                  22b
    setrange(0xE3, 0xF9, 1)           # unused
    setrange(0xFA, 0xFB, 4)           # invoke-polymorphic(/range)  45cc/4rcc
    setrange(0xFC, 0xFD, 3)           # invoke-custom(/range)       35c/3rc
    setrange(0xFE, 0xFF, 2)           # const-method-handle/type    21c
    return w


OPCODE_WIDTH = _build_opcode_widths()

def _build_opcode_names() -> Dict[int, str]:
    n: Dict[int, str] = {
        0x00: "nop", 0x01: "move", 0x02: "move/from16", 0x03: "move/16",
        0x04: "move-wide", 0x05: "move-wide/from16", 0x06: "move-wide/16",
        0x07: "move-object", 0x08: "move-object/from16", 0x09: "move-object/16",
        0x0A: "move-result", 0x0B: "move-result-wide", 0x0C: "move-result-object",
        0x0D: "move-exception",
        0x0E: "return-void", 0x0F: "return", 0x10: "return-wide", 0x11: "return-object",
        0x12: "const/4", 0x13: "const/16", 0x14: "const", 0x15: "const/high16",
        0x16: "const-wide/16", 0x17: "const-wide/32", 0x18: "const-wide",
        0x19: "const-wide/high16",
        0x1A: "const-string", 0x1B: "const-string/jumbo", 0x1C: "const-class",
        0x1D: "monitor-enter", 0x1E: "monitor-exit",
        0x1F: "check-cast", 0x20: "instance-of", 0x21: "array-length",
        0x22: "new-instance", 0x23: "new-array",
        0x24: "filled-new-array", 0x25: "filled-new-array/range",
        0x26: "fill-array-data", 0x27: "throw",
        0x28: "goto", 0x29: "goto/16", 0x2A: "goto/32",
        0x2B: "packed-switch", 0x2C: "sparse-switch",
        0x2D: "cmpl-float", 0x2E: "cmpg-float", 0x2F: "cmpl-double",
        0x30: "cmpg-double", 0x31: "cmp-long",
        0xFA: "invoke-polymorphic", 0xFB: "invoke-polymorphic/range",
        0xFC: "invoke-custom", 0xFD: "invoke-custom/range",
        0xFE: "const-method-handle", 0xFF: "const-method-type",
    }
    for i, s in enumerate(["eq", "ne", "lt", "ge", "gt", "le"]):
        n[0x32 + i] = f"if-{s}"
        n[0x38 + i] = f"if-{s}z"
    suffixes = ["", "-wide", "-object", "-boolean", "-byte", "-char", "-short"]
    for i, s in enumerate(suffixes):
        n[0x44 + i] = f"aget{s}"
        n[0x4B + i] = f"aput{s}"
        n[0x52 + i] = f"iget{s}"
        n[0x59 + i] = f"iput{s}"
        n[0x60 + i] = f"sget{s}"
        n[0x67 + i] = f"sput{s}"
    for i, s in enumerate(["virtual", "super", "direct", "static", "interface"]):
        n[0x6E + i] = f"invoke-{s}"
        n[0x74 + i] = f"invoke-{s}/range"
    unops = ["neg-int", "not-int", "neg-long", "not-long", "neg-float", "neg-double",
             "int-to-long", "int-to-float", "int-to-double", "long-to-int",
             "long-to-float", "long-to-double", "float-to-int", "float-to-long",
             "float-to-double", "double-to-int", "double-to-long", "double-to-float",
             "int-to-byte", "int-to-char", "int-to-short"]
    for i, s in enumerate(unops):
        n[0x7B + i] = s
    binops = ["add", "sub", "mul", "div", "rem", "and", "or", "xor", "shl", "shr", "ushr"]
    for i, t in enumerate(["int", "long"]):
        for j, s in enumerate(binops):
            n[0x90 + i * 11 + j] = f"{s}-{t}"
            n[0xB0 + i * 11 + j] = f"{s}-{t}/2addr"
    for i, t in enumerate(["float", "double"]):
        for j, s in enumerate(binops[:5]):
            n[0xA6 + i * 5 + j] = f"{s}-{t}"
            n[0xC6 + i * 5 + j] = f"{s}-{t}/2addr"
    for j, s in enumerate(["add", "rsub", "mul", "div", "rem", "and", "or", "xor"]):
        n[0xD0 + j] = f"{s}-int/lit16"
    for j, s in enumerate(["add", "rsub", "mul", "div", "rem", "and", "or", "xor",
                           "shl", "shr", "ushr"]):
        n[0xD8 + j] = f"{s}-int/lit8"
    return n


OPCODE_NAME = _build_opcode_names()

STRING_OPS = {0x1A, 0x1B}
TYPE_OPS = {0x1C, 0x1F, 0x22, 0x23, 0x24, 0x25, 0x20}
FIELD_OPS = set(range(0x52, 0x6E))          # iget..sput-short (0x6E starts invoke-*)
INVOKE_OPS = set(range(0x6E, 0x73)) | set(range(0x74, 0x79))

ACC_PUBLIC = 0x1
ACC_PRIVATE = 0x2
ACC_PROTECTED = 0x4
ACC_STATIC = 0x8
ACC_FINAL = 0x10
ACC_SYNTHETIC = 0x1000

ACCESS_NAMES = [
    (0x1, "public"), (0x2, "private"), (0x4, "protected"), (0x8, "static"),
    (0x10, "final"), (0x20, "synchronized"), (0x40, "volatile/bridge"),
    (0x80, "transient/varargs"), (0x100, "native"), (0x200, "interface"),
    (0x400, "abstract"), (0x800, "strictfp"), (0x1000, "synthetic"),
    (0x2000, "annotation"), (0x4000, "enum"), (0x10000, "constructor"),
]


def access_str(flags: int) -> str:
    return " ".join(n for bit, n in ACCESS_NAMES if flags & bit) or "(none)"


# --------------------------------------------------------------------------- #
# Low-level readers
# --------------------------------------------------------------------------- #

class Reader:
    __slots__ = ("buf", "pos")

    def __init__(self, buf: bytes, pos: int = 0) -> None:
        self.buf = buf
        self.pos = pos

    def u1(self) -> int:
        v = self.buf[self.pos]
        self.pos += 1
        return v

    def u2(self) -> int:
        v = struct.unpack_from("<H", self.buf, self.pos)[0]
        self.pos += 2
        return v

    def u4(self) -> int:
        v = struct.unpack_from("<I", self.buf, self.pos)[0]
        self.pos += 4
        return v

    def uleb128(self) -> int:
        result = 0
        shift = 0
        while True:
            b = self.buf[self.pos]
            self.pos += 1
            result |= (b & 0x7F) << shift
            if not (b & 0x80):
                break
            shift += 7
            if shift > 35:
                raise ValueError("uleb128 too long")
        return result


REPLACEMENT_CHAR = "\ufffd"  # U+FFFD, emitted for undecodable MUTF-8 bytes


def mutf8_decode(raw: bytes) -> str:
    """Decode Modified UTF-8 (DEX string encoding). Falls back gracefully."""
    try:
        return raw.decode("utf-8")
    except UnicodeDecodeError:
        pass
    out: List[str] = []
    i = 0
    n = len(raw)
    while i < n:
        b = raw[i]
        if b < 0x80:
            out.append(chr(b))
            i += 1
        elif b & 0xE0 == 0xC0 and i + 1 < n:
            out.append(chr(((b & 0x1F) << 6) | (raw[i + 1] & 0x3F)))
            i += 2
        elif b & 0xF0 == 0xE0 and i + 2 < n:
            out.append(chr(((b & 0x0F) << 12) | ((raw[i + 1] & 0x3F) << 6) | (raw[i + 2] & 0x3F)))
            i += 3
        else:
            out.append(REPLACEMENT_CHAR)
            i += 1
    return "".join(out)


# --------------------------------------------------------------------------- #
# DEX model
# --------------------------------------------------------------------------- #

@dataclass
class MethodRef:
    class_desc: str
    name: str
    proto: str

    def __str__(self) -> str:
        return f"{self.class_desc}->{self.name}{self.proto}"


@dataclass
class FieldRef:
    class_desc: str
    name: str
    type_desc: str

    def __str__(self) -> str:
        return f"{self.class_desc}->{self.name}:{self.type_desc}"


@dataclass
class MethodBody:
    method_idx: int
    access_flags: int
    code_off: int
    registers: int = 0
    ins: int = 0
    outs: int = 0
    insns: bytes = b""


@dataclass
class ClassInfo:
    descriptor: str
    access_flags: int
    superclass: str
    interfaces: List[str] = field(default_factory=list)
    source_file: Optional[str] = None
    direct_methods: List[MethodBody] = field(default_factory=list)
    virtual_methods: List[MethodBody] = field(default_factory=list)

    @property
    def methods(self) -> List[MethodBody]:
        return self.direct_methods + self.virtual_methods


class Dex:
    """Parsed classes.dex."""

    def __init__(self, data: bytes, origin: str = "classes.dex") -> None:
        if data[:4] not in (b"dex\n", b"cdex"):
            raise ValueError(f"{origin}: not a DEX (magic={data[:8]!r})")
        if data[:4] == b"cdex":
            raise ValueError(f"{origin}: CompactDex (cdex) is not supported; "
                             "extract the APK's classes*.dex instead of a vdex")
        self.data = data
        self.origin = origin

        r = Reader(data, 56)  # skip magic(8) checksum(4) signature(20) file_size(4)
                              # header_size(4) endian(4) link_size(4) link_off(4)
        # 8+4+20+4+4+4+4+4 = 52 -> map_off at 52
        r.pos = 52
        self.map_off = r.u4()
        self.string_ids_size = r.u4(); self.string_ids_off = r.u4()
        self.type_ids_size = r.u4(); self.type_ids_off = r.u4()
        self.proto_ids_size = r.u4(); self.proto_ids_off = r.u4()
        self.field_ids_size = r.u4(); self.field_ids_off = r.u4()
        self.method_ids_size = r.u4(); self.method_ids_off = r.u4()
        self.class_defs_size = r.u4(); self.class_defs_off = r.u4()

        self._strings: List[Optional[str]] = [None] * self.string_ids_size
        self._string_offs = struct.unpack_from(
            f"<{self.string_ids_size}I", data, self.string_ids_off
        ) if self.string_ids_size else ()

        self._type_idx = struct.unpack_from(
            f"<{self.type_ids_size}I", data, self.type_ids_off
        ) if self.type_ids_size else ()

        self._classes: Optional[List[ClassInfo]] = None

    # -- string pool ------------------------------------------------------- #

    def string(self, idx: int) -> str:
        if idx == 0xFFFFFFFF or idx >= self.string_ids_size:
            return ""
        cached = self._strings[idx]
        if cached is not None:
            return cached
        off = self._string_offs[idx]
        r = Reader(self.data, off)
        r.uleb128()  # utf16_size, unused (we read to NUL)
        start = r.pos
        end = self.data.index(b"\x00", start)
        s = mutf8_decode(self.data[start:end])
        self._strings[idx] = s
        return s

    def iter_strings(self) -> Iterable[Tuple[int, str]]:
        for i in range(self.string_ids_size):
            yield i, self.string(i)

    # -- type / proto / field / method pools -------------------------------- #

    def type_desc(self, idx: int) -> str:
        if idx == 0xFFFFFFFF or idx >= self.type_ids_size:
            return ""
        return self.string(self._type_idx[idx])

    def proto(self, idx: int) -> str:
        base = self.proto_ids_off + idx * 12
        _shorty, ret_idx, params_off = struct.unpack_from("<III", self.data, base)
        params: List[str] = []
        if params_off:
            size = struct.unpack_from("<I", self.data, params_off)[0]
            for i in range(size):
                t = struct.unpack_from("<H", self.data, params_off + 4 + i * 2)[0]
                params.append(self.type_desc(t))
        return "(" + "".join(params) + ")" + self.type_desc(ret_idx)

    def method(self, idx: int) -> MethodRef:
        base = self.method_ids_off + idx * 8
        class_idx, proto_idx, name_idx = struct.unpack_from("<HHI", self.data, base)
        return MethodRef(self.type_desc(class_idx), self.string(name_idx), self.proto(proto_idx))

    def field(self, idx: int) -> FieldRef:
        base = self.field_ids_off + idx * 8
        class_idx, type_idx, name_idx = struct.unpack_from("<HHI", self.data, base)
        return FieldRef(self.type_desc(class_idx), self.string(name_idx), self.type_desc(type_idx))

    # -- classes ------------------------------------------------------------ #

    @property
    def classes(self) -> List[ClassInfo]:
        if self._classes is None:
            self._classes = list(self._parse_classes())
        return self._classes

    def _parse_classes(self) -> Iterable[ClassInfo]:
        for i in range(self.class_defs_size):
            base = self.class_defs_off + i * 32
            (class_idx, access_flags, superclass_idx, interfaces_off,
             source_file_idx, _annotations_off, class_data_off,
             _static_values_off) = struct.unpack_from("<8I", self.data, base)

            ifaces: List[str] = []
            if interfaces_off:
                size = struct.unpack_from("<I", self.data, interfaces_off)[0]
                for k in range(size):
                    t = struct.unpack_from("<H", self.data, interfaces_off + 4 + k * 2)[0]
                    ifaces.append(self.type_desc(t))

            info = ClassInfo(
                descriptor=self.type_desc(class_idx),
                access_flags=access_flags,
                superclass=self.type_desc(superclass_idx),
                interfaces=ifaces,
                source_file=self.string(source_file_idx) if source_file_idx != 0xFFFFFFFF else None,
            )
            if class_data_off:
                try:
                    self._parse_class_data(class_data_off, info)
                except (IndexError, struct.error, ValueError):
                    pass  # tolerate malformed/obfuscated entries rather than abort
            yield info

    def _parse_class_data(self, off: int, info: ClassInfo) -> None:
        r = Reader(self.data, off)
        n_sf = r.uleb128()
        n_if = r.uleb128()
        n_dm = r.uleb128()
        n_vm = r.uleb128()
        idx = 0
        for _ in range(n_sf):
            idx += r.uleb128(); r.uleb128()
        idx = 0
        for _ in range(n_if):
            idx += r.uleb128(); r.uleb128()
        for target, count in ((info.direct_methods, n_dm), (info.virtual_methods, n_vm)):
            idx = 0
            for _ in range(count):
                idx += r.uleb128()
                access = r.uleb128()
                code_off = r.uleb128()
                target.append(self._read_code(idx, access, code_off))

    def _read_code(self, method_idx: int, access: int, code_off: int) -> MethodBody:
        mb = MethodBody(method_idx=method_idx, access_flags=access, code_off=code_off)
        if code_off:
            registers, ins, outs, _tries, _dbg, insns_size = struct.unpack_from(
                "<HHHHII", self.data, code_off
            )
            mb.registers, mb.ins, mb.outs = registers, ins, outs
            start = code_off + 16
            mb.insns = self.data[start:start + insns_size * 2]
        return mb


# --------------------------------------------------------------------------- #
# Instruction decoding
# --------------------------------------------------------------------------- #

@dataclass
class Insn:
    offset: int          # in code units
    opcode: int
    units: Tuple[int, ...]

    @property
    def name(self) -> str:
        return OPCODE_NAME.get(self.opcode, f"op@0x{self.opcode:02x}")

    @property
    def index_operand(self) -> Optional[int]:
        """String/type/field/method index for the common 21c/22c/35c/3rc forms."""
        op = self.opcode
        if op == 0x1B:  # const-string/jumbo, 31c
            if len(self.units) >= 3:
                return self.units[1] | (self.units[2] << 16)
            return None
        if op in STRING_OPS or op in TYPE_OPS or op in FIELD_OPS or op in INVOKE_OPS:
            return self.units[1] if len(self.units) >= 2 else None
        return None


def decode(insns: bytes) -> List[Insn]:
    """Decode a code_item instruction stream into Insn records."""
    out: List[Insn] = []
    n = len(insns) // 2
    if n == 0:
        return out
    units = struct.unpack_from(f"<{n}H", insns, 0)
    i = 0
    while i < n:
        unit = units[i]
        op = unit & 0xFF
        if op == 0x00 and unit != 0x0000:
            ident = unit >> 8
            if ident == 0x01:     # packed-switch-payload
                size = units[i + 1]
                width = size * 2 + 4
            elif ident == 0x02:   # sparse-switch-payload
                size = units[i + 1]
                width = size * 4 + 2
            elif ident == 0x03:   # fill-array-data-payload
                elem = units[i + 1]
                size = units[i + 2] | (units[i + 3] << 16)
                width = (size * elem + 1) // 2 + 4
            else:
                width = 1
        else:
            width = OPCODE_WIDTH[op]
        if width <= 0 or i + width > n:
            break
        out.append(Insn(offset=i, opcode=op, units=units[i:i + width]))
        i += width
    return out


# Formats that carry an index in unit[1] plus a register pair vA, vB (22c).
FMT_22C = set(range(0x52, 0x60)) | {0x20, 0x23}
# Formats that carry an index in unit[1] plus one register vAA (21c).
FMT_21C = set(range(0x60, 0x6E)) | {0x1A, 0x1C, 0x1F, 0x22, 0xFE, 0xFF}

BRANCH_10T = {0x28}
BRANCH_20T = {0x29}
BRANCH_30T = {0x2A}
BRANCH_21T = set(range(0x38, 0x3E))
BRANCH_22T = set(range(0x32, 0x38))


def _s(v: int, bits: int) -> int:
    """Sign-extend a `bits`-wide value."""
    m = 1 << (bits - 1)
    return (v ^ m) - m


def invoke_registers(ins: Insn) -> List[int]:
    """Register list for invoke-kind (35c) and invoke-kind/range (3rc)."""
    op = ins.opcode
    u = ins.units
    if len(u) < 3:
        return []
    if op in (0x6E, 0x6F, 0x70, 0x71, 0x72, 0x24, 0xFC):        # 35c
        count = (u[0] >> 12) & 0xF
        g = (u[0] >> 8) & 0xF
        c, d, e, f = u[2] & 0xF, (u[2] >> 4) & 0xF, (u[2] >> 8) & 0xF, (u[2] >> 12) & 0xF
        return [c, d, e, f, g][:count]
    if op in (0x74, 0x75, 0x76, 0x77, 0x78, 0x25, 0xFD):        # 3rc
        count = (u[0] >> 8) & 0xFF
        first = u[2]
        return list(range(first, first + count))
    return []


def branch_target(ins: Insn) -> Optional[int]:
    """Absolute target offset (in code units) for a branch instruction."""
    op, u = ins.opcode, ins.units
    if op in BRANCH_10T:
        return ins.offset + _s((u[0] >> 8) & 0xFF, 8)
    if op in BRANCH_20T and len(u) >= 2:
        return ins.offset + _s(u[1], 16)
    if op in BRANCH_30T and len(u) >= 3:
        return ins.offset + _s(u[1] | (u[2] << 16), 32)
    if op in BRANCH_21T and len(u) >= 2:
        return ins.offset + _s(u[1], 16)
    if op in BRANCH_22T and len(u) >= 2:
        return ins.offset + _s(u[1], 16)
    if op in (0x2B, 0x2C, 0x26) and len(u) >= 3:
        return ins.offset + _s(u[1] | (u[2] << 16), 32)
    return None


def _regs(ins: Insn) -> str:
    op, u = ins.opcode, ins.units
    if op in FMT_21C or op == 0x1B:
        return f"v{(u[0] >> 8) & 0xFF}"
    if op in FMT_22C:
        return f"v{(u[0] >> 8) & 0xF}, v{(u[0] >> 12) & 0xF}"
    if op in BRANCH_21T:
        return f"v{(u[0] >> 8) & 0xFF}"
    if op in BRANCH_22T:
        return f"v{(u[0] >> 8) & 0xF}, v{(u[0] >> 12) & 0xF}"
    if op in (0x0A, 0x0B, 0x0C, 0x0D, 0x0F, 0x10, 0x11, 0x1D, 0x1E, 0x27):
        return f"v{(u[0] >> 8) & 0xFF}"
    if op in (0x01, 0x04, 0x07, 0x21):
        return f"v{(u[0] >> 8) & 0xF}, v{(u[0] >> 12) & 0xF}"
    return ""


def render(dex: Dex, ins: Insn) -> str:
    """Render one instruction in a smali-like form, with registers."""
    op = ins.opcode
    idx = ins.index_operand
    regs = _regs(ins)
    pre = f"{ins.name} {regs}, " if regs else f"{ins.name} "

    if op in STRING_OPS and idx is not None:
        return f'{pre}"{dex.string(idx)}"'
    if op in INVOKE_OPS and idx is not None:
        rl = ", ".join(f"v{r}" for r in invoke_registers(ins))
        return f"{ins.name} {{{rl}}}, {dex.method(idx)}"
    if op in FIELD_OPS and idx is not None:
        return f"{pre}{dex.field(idx)}"
    if op in TYPE_OPS and idx is not None:
        return f"{pre}{dex.type_desc(idx)}"

    tgt = branch_target(ins)
    if tgt is not None:
        return f"{pre}:{tgt:04x}"

    if op == 0x12:
        return f"const/4 v{(ins.units[0] >> 8) & 0xF}, 0x{_s((ins.units[0] >> 12) & 0xF, 4) & 0xFFFFFFFF:x}"
    if op == 0x14 and len(ins.units) >= 3:
        return f"const v{ins.units[0] >> 8}, 0x{ins.units[1] | (ins.units[2] << 16):x}"
    if op == 0x15 and len(ins.units) >= 2:
        return f"const/high16 v{ins.units[0] >> 8}, 0x{ins.units[1] << 16:x}"
    if op in (0x13, 0x16, 0x19) and len(ins.units) >= 2:
        return f"{ins.name} v{ins.units[0] >> 8}, 0x{ins.units[1]:x}"
    if op == 0x0E:
        return "return-void"
    return (pre if regs else ins.name).rstrip(", ")


# --------------------------------------------------------------------------- #
# APK container
# --------------------------------------------------------------------------- #

@dataclass
class ApkPart:
    name: str
    manifest: Optional["Manifest"]
    dexes: List[Dex]


class Apk:
    """One or more APKs (handles .apks/.apkm/.xapk archives-of-APKs)."""

    def __init__(self, path: str) -> None:
        self.path = path
        self.parts: List[ApkPart] = []
        self._load(path)

    def _load(self, path: str) -> None:
        with open(path, "rb") as fh:
            blob = fh.read()
        self._load_bytes(blob, os.path.basename(path))

    def _load_bytes(self, blob: bytes, label: str) -> None:
        try:
            zf = zipfile.ZipFile(io.BytesIO(blob))
        except zipfile.BadZipFile as exc:
            raise SystemExit(f"{label}: not a zip/APK ({exc})") from exc
        names = zf.namelist()

        inner = [n for n in names if n.lower().endswith(".apk")]
        if inner and "AndroidManifest.xml" not in names:
            # .apks / .apkm / .xapk bundle: recurse into each contained APK
            for n in sorted(inner):
                self._load_bytes(zf.read(n), f"{label}!{n}")
            return

        manifest = None
        if "AndroidManifest.xml" in names:
            try:
                manifest = Manifest(zf.read("AndroidManifest.xml"))
            except Exception as exc:  # noqa: BLE001 - diagnostics only
                print(f"warn: {label}: manifest parse failed: {exc}", file=sys.stderr)

        dexes: List[Dex] = []
        for n in sorted(names):
            if re.fullmatch(r"classes\d*\.dex", n):
                try:
                    dexes.append(Dex(zf.read(n), origin=f"{label}!{n}"))
                except ValueError as exc:
                    print(f"warn: {exc}", file=sys.stderr)
        self.parts.append(ApkPart(name=label, manifest=manifest, dexes=dexes))

    @property
    def dexes(self) -> List[Dex]:
        return [d for p in self.parts for d in p.dexes]

    @property
    def base_manifest(self) -> Optional["Manifest"]:
        for p in self.parts:
            if p.manifest and not p.manifest.split:
                return p.manifest
        for p in self.parts:
            if p.manifest:
                return p.manifest
        return None


# --------------------------------------------------------------------------- #
# Binary AndroidManifest.xml (AXML)
# --------------------------------------------------------------------------- #

RES_STRING_POOL_TYPE = 0x0001
RES_XML_TYPE = 0x0003
RES_XML_START_NAMESPACE = 0x0100
RES_XML_END_NAMESPACE = 0x0101
RES_XML_START_ELEMENT = 0x0102
RES_XML_END_ELEMENT = 0x0103
RES_XML_CDATA = 0x0104
RES_XML_RESOURCE_MAP = 0x0180

TYPE_REFERENCE = 0x01
TYPE_STRING = 0x03
TYPE_FLOAT = 0x04
TYPE_INT_DEC = 0x10
TYPE_INT_HEX = 0x11
TYPE_INT_BOOLEAN = 0x12


@dataclass
class XmlNode:
    tag: str
    attrs: Dict[str, str]
    children: List["XmlNode"] = field(default_factory=list)

    def find_all(self, tag: str) -> List["XmlNode"]:
        out: List[XmlNode] = []
        if self.tag == tag:
            out.append(self)
        for c in self.children:
            out.extend(c.find_all(tag))
        return out


class Manifest:
    def __init__(self, data: bytes) -> None:
        self.root = self._parse(data)
        m = self.root
        self.package = m.attrs.get("package", "")
        self.version_code = m.attrs.get("android:versionCode", "")
        self.version_name = m.attrs.get("android:versionName", "")
        self.split = m.attrs.get("split", "")
        self.shared_user_id = m.attrs.get("android:sharedUserId", "")

    # -- string pool -------------------------------------------------------- #

    @staticmethod
    def _read_string_pool(data: bytes, off: int) -> List[str]:
        (_type, header_size, _size, count, style_count, flags,
         strings_start, _styles_start) = struct.unpack_from("<HHIIIIII", data, off)
        utf8 = bool(flags & (1 << 8))
        offsets = struct.unpack_from(f"<{count}I", data, off + header_size) if count else ()
        base = off + strings_start
        out: List[str] = []
        for o in offsets:
            p = base + o
            if utf8:
                n1 = data[p]; p += 1
                if n1 & 0x80:
                    p += 1
                n2 = data[p]; p += 1
                if n2 & 0x80:
                    n2 = ((n2 & 0x7F) << 8) | data[p]; p += 1
                out.append(data[p:p + n2].decode("utf-8", "replace"))
            else:
                n = struct.unpack_from("<H", data, p)[0]; p += 2
                if n & 0x8000:
                    n = ((n & 0x7FFF) << 16) | struct.unpack_from("<H", data, p)[0]; p += 2
                out.append(data[p:p + n * 2].decode("utf-16-le", "replace"))
        _ = style_count
        return out

    def _parse(self, data: bytes) -> XmlNode:
        magic, header_size, _total = struct.unpack_from("<HHI", data, 0)
        if magic != RES_XML_TYPE:
            raise ValueError(f"not binary AXML (type=0x{magic:04x})")
        pos = header_size
        strings: List[str] = []
        ns_map: Dict[str, str] = {}
        root = XmlNode(tag="#document", attrs={})
        stack: List[XmlNode] = [root]

        def sref(i: int) -> str:
            return strings[i] if 0 <= i < len(strings) else ""

        while pos + 8 <= len(data):
            ctype, chdr, csize = struct.unpack_from("<HHI", data, pos)
            if csize <= 0:
                break
            if ctype == RES_STRING_POOL_TYPE:
                strings = self._read_string_pool(data, pos)
            elif ctype == RES_XML_START_NAMESPACE:
                p = pos + chdr
                prefix, uri = struct.unpack_from("<II", data, p)
                ns_map[sref(uri)] = sref(prefix)
            elif ctype == RES_XML_START_ELEMENT:
                p = pos + chdr
                _ns, name, attr_start, attr_size, attr_count = struct.unpack_from("<IIHHH", data, p)
                node = XmlNode(tag=sref(name), attrs={})
                ap = pos + chdr + attr_start - 0  # attr_start is relative to node struct start
                ap = p + attr_start
                for i in range(attr_count):
                    a = ap + i * attr_size
                    a_ns, a_name, a_raw = struct.unpack_from("<III", data, a)
                    _vsize, _res0, vtype, vdata = struct.unpack_from("<HBBI", data, a + 12)
                    key = sref(a_name)
                    if a_ns != 0xFFFFFFFF:
                        pfx = ns_map.get(sref(a_ns), "")
                        if pfx:
                            key = f"{pfx}:{key}"
                    if a_raw != 0xFFFFFFFF:
                        val = sref(a_raw)
                    elif vtype == TYPE_STRING:
                        val = sref(vdata)
                    elif vtype == TYPE_INT_BOOLEAN:
                        val = "true" if vdata else "false"
                    elif vtype == TYPE_INT_HEX:
                        val = f"0x{vdata:x}"
                    elif vtype == TYPE_REFERENCE:
                        val = f"@0x{vdata:08x}"
                    else:
                        val = str(struct.unpack("<i", struct.pack("<I", vdata))[0])
                    node.attrs[key] = val
                stack[-1].children.append(node)
                stack.append(node)
            elif ctype == RES_XML_END_ELEMENT:
                if len(stack) > 1:
                    stack.pop()
            pos += csize

        return root.children[0] if root.children else root

    # -- convenience -------------------------------------------------------- #

    def permissions(self) -> List[str]:
        return [n.attrs.get("android:name", "") for n in self.root.find_all("uses-permission")]

    def declared_permissions(self) -> List[Dict[str, str]]:
        return [
            {"name": n.attrs.get("android:name", ""),
             "protectionLevel": n.attrs.get("android:protectionLevel", "")}
            for n in self.root.find_all("permission")
        ]

    def providers(self) -> List[Dict[str, str]]:
        return [
            {"name": n.attrs.get("android:name", ""),
             "authorities": n.attrs.get("android:authorities", ""),
             "exported": n.attrs.get("android:exported", "")}
            for n in self.root.find_all("provider")
        ]

    def uses_libraries(self) -> List[Dict[str, str]]:
        return [
            {"name": n.attrs.get("android:name", ""),
             "required": n.attrs.get("android:required", "")}
            for n in self.root.find_all("uses-library")
        ]

    def sdk(self) -> Dict[str, str]:
        for n in self.root.find_all("uses-sdk"):
            return {"minSdkVersion": n.attrs.get("android:minSdkVersion", ""),
                    "targetSdkVersion": n.attrs.get("android:targetSdkVersion", "")}
        return {}

    def activities(self) -> List[Dict[str, str]]:
        out = []
        for n in self.root.find_all("activity") + self.root.find_all("activity-alias"):
            actions = [a.attrs.get("android:name", "")
                       for f in n.find_all("intent-filter") for a in f.find_all("action")]
            out.append({"name": n.attrs.get("android:name", ""),
                        "exported": n.attrs.get("android:exported", ""),
                        "actions": ",".join(actions)})
        return out

    def queries(self) -> List[str]:
        out: List[str] = []
        for q in self.root.find_all("queries"):
            for p in q.find_all("package"):
                out.append("package=" + p.attrs.get("android:name", ""))
            for it in q.find_all("intent"):
                acts = [a.attrs.get("android:name", "") for a in it.find_all("action")]
                out.append("intent=" + ",".join(acts))
            for pr in q.find_all("provider"):
                out.append("provider=" + pr.attrs.get("android:authorities", ""))
        return out


# --------------------------------------------------------------------------- #
# Cross-reference engine
# --------------------------------------------------------------------------- #

@dataclass
class Hit:
    dex: str
    klass: str
    method: str
    access: str
    insn_offset: int
    text: str
    context: List[str] = field(default_factory=list)


def _method_label(dex: Dex, mb: MethodBody) -> str:
    m = dex.method(mb.method_idx)
    return f"{m.name}{m.proto}"


def xref(apk: Apk,
         string_pat: Optional[re.Pattern] = None,
         method_pat: Optional[re.Pattern] = None,
         field_pat: Optional[re.Pattern] = None,
         type_pat: Optional[re.Pattern] = None,
         class_filter: Optional[re.Pattern] = None,
         context: int = 0) -> List[Hit]:
    hits: List[Hit] = []
    for dex in apk.dexes:
        # Pre-resolve which pool indices match, so the hot loop is integer compares.
        str_idx = {i for i, s in dex.iter_strings() if string_pat and string_pat.search(s)} \
            if string_pat else set()
        meth_idx = {i for i in range(dex.method_ids_size)
                    if method_pat.search(str(dex.method(i)))} if method_pat else set()
        fld_idx = {i for i in range(dex.field_ids_size)
                   if field_pat.search(str(dex.field(i)))} if field_pat else set()
        typ_idx = {i for i in range(dex.type_ids_size)
                   if type_pat.search(dex.type_desc(i))} if type_pat else set()

        if not (str_idx or meth_idx or fld_idx or typ_idx):
            continue

        for cls in dex.classes:
            if class_filter and not class_filter.search(cls.descriptor):
                continue
            for mb in cls.methods:
                if not mb.insns:
                    continue
                decoded = decode(mb.insns)
                for pos, ins in enumerate(decoded):
                    idx = ins.index_operand
                    if idx is None:
                        continue
                    op = ins.opcode
                    matched = (
                        (op in STRING_OPS and idx in str_idx)
                        or (op in INVOKE_OPS and idx in meth_idx)
                        or (op in FIELD_OPS and idx in fld_idx)
                        or (op in TYPE_OPS and idx in typ_idx)
                    )
                    if not matched:
                        continue
                    ctx: List[str] = []
                    if context:
                        lo = max(0, pos - context)
                        hi = min(len(decoded), pos + context + 1)
                        ctx = [f"{decoded[k].offset:04x}: {render(dex, decoded[k])}"
                               for k in range(lo, hi)]
                    hits.append(Hit(
                        dex=dex.origin,
                        klass=cls.descriptor,
                        method=_method_label(dex, mb),
                        access=access_str(mb.access_flags),
                        insn_offset=ins.offset,
                        text=render(dex, ins),
                        context=ctx,
                    ))
    return hits


# --------------------------------------------------------------------------- #
# Commands
# --------------------------------------------------------------------------- #

def cmd_info(args: argparse.Namespace) -> int:
    apk = Apk(args.apk)
    print(f"file: {args.apk}")
    print(f"parts: {len(apk.parts)}")
    for p in apk.parts:
        m = p.manifest
        print(f"  - {p.name}: dex={len(p.dexes)} "
              f"split={(m.split if m else '?') or '(base)'}")
    m = apk.base_manifest
    if not m:
        print("no parsable AndroidManifest.xml found")
        return 1
    print()
    print(f"package     : {m.package}")
    print(f"versionCode : {m.version_code}")
    print(f"versionName : {m.version_name}")
    print(f"sharedUserId: {m.shared_user_id or '(none)'}")
    print(f"sdk         : {m.sdk()}")
    print(f"total dex   : {len(apk.dexes)}")
    total_classes = sum(d.class_defs_size for d in apk.dexes)
    total_strings = sum(d.string_ids_size for d in apk.dexes)
    print(f"classes     : {total_classes}")
    print(f"strings     : {total_strings}")

    print("\n-- uses-permission --")
    for perm in m.permissions():
        print(f"  {perm}")
    decl = m.declared_permissions()
    if decl:
        print("\n-- <permission> declared (collision risk when renaming) --")
        for d in decl:
            print(f"  {d['name']}  protectionLevel={d['protectionLevel']}")
    prov = m.providers()
    if prov:
        print("\n-- <provider> authorities (collision risk when renaming) --")
        for pr in prov:
            print(f"  {pr['name']}\n      authorities={pr['authorities']} exported={pr['exported']}")
    libs = m.uses_libraries()
    if libs:
        print("\n-- uses-library --")
        for lib in libs:
            print(f"  {lib['name']} required={lib['required']}")
    q = m.queries()
    if q:
        print("\n-- <queries> (package visibility) --")
        for entry in q:
            print(f"  {entry}")
    return 0


def cmd_strings(args: argparse.Namespace) -> int:
    apk = Apk(args.apk)
    pat = re.compile(args.regex, 0 if args.case_sensitive else re.IGNORECASE)
    seen = set()
    count = 0
    for dex in apk.dexes:
        for _i, s in dex.iter_strings():
            if pat.search(s) and s not in seen:
                seen.add(s)
                count += 1
                print(f"{dex.origin}: {s!r}")
                if args.limit and count >= args.limit:
                    return 0
    print(f"\n{count} unique matching string(s)", file=sys.stderr)
    return 0


def _opt_pattern(v: Optional[str], literal: bool) -> Optional[re.Pattern]:
    if v is None:
        return None
    return re.compile(re.escape(v) if literal else v)


def cmd_xref(args: argparse.Namespace) -> int:
    apk = Apk(args.apk)
    hits = xref(
        apk,
        string_pat=_opt_pattern(args.string, args.literal),
        method_pat=_opt_pattern(args.method, args.literal),
        field_pat=_opt_pattern(args.field, args.literal),
        type_pat=_opt_pattern(args.type, args.literal),
        class_filter=_opt_pattern(args.in_class, False),
        context=args.context,
    )
    for h in hits:
        print(f"{h.klass}->{h.method}   [{h.access}]  ({h.dex})")
        print(f"    {h.insn_offset:04x}: {h.text}")
        for line in h.context:
            print(f"        {line}")
    print(f"\n{len(hits)} hit(s)", file=sys.stderr)
    return 0


def cmd_dump(args: argparse.Namespace) -> int:
    apk = Apk(args.apk)
    cls_pat = re.compile(args.klass)
    name_pat = re.compile(args.method_name) if args.method_name else None
    printed = 0
    for dex in apk.dexes:
        for cls in dex.classes:
            if not cls_pat.search(cls.descriptor):
                continue
            for mb in cls.methods:
                mref = dex.method(mb.method_idx)
                if name_pat and not name_pat.search(mref.name):
                    continue
                print(f"\n.class {cls.descriptor}  ({access_str(cls.access_flags)})")
                print(f".super {cls.superclass}")
                if cls.interfaces:
                    print(f".implements {' '.join(cls.interfaces)}")
                print(f".method {access_str(mb.access_flags)} {mref.name}{mref.proto}")
                print(f"    .registers {mb.registers}  .ins {mb.ins}  .outs {mb.outs}")
                for ins in decode(mb.insns):
                    print(f"    {ins.offset:04x}: {render(dex, ins)}")
                print(".end method")
                printed += 1
                if args.limit and printed >= args.limit:
                    return 0
    if printed == 0:
        print("no matching method", file=sys.stderr)
        return 1
    return 0


# Indicators from the patch investigation procedure.
HUNT_STRINGS = [
    r"com\.google\.android\.apps\.photos",
    r"android\.intent\.action\.VIEW",
    r"com\.android\.camera\.action\.REVIEW",
    r"android\.intent\.action\.REVIEW",
    r"content://",
    r"external/(images|video)",
    r"image/\*|video/\*|\*/\*",
    r"\.fileprovider",
    r"(?i)photos",
    r"(?i)gallery",
    r"(?i)filmstrip",
    r"(?i)thumbnail",
]

HUNT_METHODS = [
    r"Landroid/content/Intent;->setPackage",
    r"Landroid/content/Intent;->setComponent",
    r"Landroid/content/Intent;->setClassName",
    r"Landroid/content/Intent;->setDataAndType",
    r"Landroid/content/Intent;->setData",
    r"Landroid/content/Intent;->setType",
    r"Landroid/content/Intent;->addFlags",
    r"Landroid/content/Intent;->setFlags",
    r"Landroid/content/Intent;->resolveActivity",
    r"Landroid/content/Intent;-><init>",
    r"Landroid/content/pm/PackageManager;->getPackageInfo",
    r"Landroid/content/pm/PackageManager;->getApplicationInfo",
    r"Landroid/content/pm/PackageManager;->getApplicationEnabledSetting",
    r"Landroid/content/pm/PackageManager;->queryIntentActivities",
    r"Landroid/content/pm/PackageManager;->resolveActivity",
    r"Landroid/content/Context;->startActivity",
    r"Landroid/app/Activity;->startActivity",
    r"Landroid/app/Activity;->startActivityForResult",
    r"Landroid/content/Context;->grantUriPermission",
]

HUNT_TYPES = [
    r"Landroid/content/ActivityNotFoundException;",
    r"Landroid/provider/MediaStore",
]


def cmd_hunt(args: argparse.Namespace) -> int:
    apk = Apk(args.apk)
    m = apk.base_manifest
    report: Dict[str, object] = {
        "apk": args.apk,
        "package": m.package if m else None,
        "versionCode": m.version_code if m else None,
        "versionName": m.version_name if m else None,
        "parts": [p.name for p in apk.parts],
        "dexCount": len(apk.dexes),
        "strings": {},
        "methodXrefs": {},
        "typeXrefs": {},
        "candidateMethods": [],
    }

    print("== literal string presence ==")
    strings_found: Dict[str, List[str]] = {}
    for pat_src in HUNT_STRINGS:
        pat = re.compile(pat_src)
        found = []
        for dex in apk.dexes:
            for _i, s in dex.iter_strings():
                if pat.search(s) and s not in found:
                    found.append(s)
        strings_found[pat_src] = found[:60]
        print(f"  {pat_src:45s} -> {len(found)} unique")
    report["strings"] = strings_found

    # Score methods: a method that both builds an Intent AND references a
    # media URI / MIME / Photos string is the interesting one.
    print("\n== method cross-references ==")
    method_hits: Dict[str, List[str]] = {}
    scored: Dict[Tuple[str, str, str], Dict[str, object]] = {}

    def note(h: Hit, kind: str, key: str) -> None:
        k = (h.dex, h.klass, h.method)
        entry = scored.setdefault(k, {
            "dex": h.dex, "class": h.klass, "method": h.method,
            "access": h.access, "signals": [],
        })
        sig = f"{kind}:{key}"
        signals = entry["signals"]
        assert isinstance(signals, list)
        if sig not in signals:
            signals.append(sig)

    for pat_src in HUNT_METHODS:
        hits = xref(apk, method_pat=re.compile(pat_src))
        method_hits[pat_src] = [f"{h.klass}->{h.method}" for h in hits][:400]
        print(f"  {pat_src:60s} -> {len(hits)} call site(s)")
        for h in hits:
            note(h, "call", pat_src.split(";->")[-1])
    report["methodXrefs"] = method_hits

    print("\n== type cross-references ==")
    type_hits: Dict[str, List[str]] = {}
    for pat_src in HUNT_TYPES:
        hits = xref(apk, type_pat=re.compile(pat_src))
        type_hits[pat_src] = [f"{h.klass}->{h.method}" for h in hits][:400]
        print(f"  {pat_src:45s} -> {len(hits)} reference(s)")
        for h in hits:
            note(h, "type", pat_src)
    report["typeXrefs"] = type_hits

    print("\n== string cross-references (Photos / VIEW / media) ==")
    for pat_src in [r"com\.google\.android\.apps\.photos",
                    r"android\.intent\.action\.VIEW",
                    r"com\.android\.camera\.action\.REVIEW",
                    r"content://"]:
        hits = xref(apk, string_pat=re.compile(pat_src))
        print(f"  {pat_src:45s} -> {len(hits)} const-string site(s)")
        for h in hits:
            note(h, "str", pat_src)

    ranked = sorted(scored.values(),
                    key=lambda e: len(e["signals"]),  # type: ignore[arg-type]
                    reverse=True)
    report["candidateMethods"] = ranked[:120]

    print("\n== ranked candidate patch points ==")
    for e in ranked[:40]:
        sigs = e["signals"]
        assert isinstance(sigs, list)
        print(f"  [{len(sigs):2d}] {e['class']}->{e['method']}")
        print(f"        {', '.join(sigs)}")

    if args.out:
        with open(args.out, "w", encoding="utf-8") as fh:
            json.dump(report, fh, indent=2)
        print(f"\nwrote {args.out}", file=sys.stderr)
    return 0


def main(argv: Optional[Sequence[str]] = None) -> int:
    ap = argparse.ArgumentParser(prog="dexscan.py", description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)

    p = sub.add_parser("info", help="manifest + dex summary")
    p.add_argument("apk")
    p.set_defaults(fn=cmd_info)

    p = sub.add_parser("strings", help="grep the DEX string pools")
    p.add_argument("apk")
    p.add_argument("--regex", required=True)
    p.add_argument("--case-sensitive", action="store_true")
    p.add_argument("--limit", type=int, default=0)
    p.set_defaults(fn=cmd_strings)

    p = sub.add_parser("xref", help="find methods referencing a string/method/field/type")
    p.add_argument("apk")
    p.add_argument("--string")
    p.add_argument("--method")
    p.add_argument("--field")
    p.add_argument("--type")
    p.add_argument("--in-class", help="only report hits inside classes matching this regex")
    p.add_argument("--literal", action="store_true", help="treat the query as a literal, not a regex")
    p.add_argument("--context", type=int, default=0, help="instructions of context around each hit")
    p.set_defaults(fn=cmd_xref)

    p = sub.add_parser("dump", help="smali-like listing of matching methods")
    p.add_argument("apk")
    p.add_argument("--class", dest="klass", required=True, help="class descriptor regex")
    p.add_argument("--method-name", help="method name regex")
    p.add_argument("--limit", type=int, default=0)
    p.set_defaults(fn=cmd_dump)

    p = sub.add_parser("hunt", help="sweep for gallery-launch code paths")
    p.add_argument("apk")
    p.add_argument("--out", help="write a JSON report here")
    p.set_defaults(fn=cmd_hunt)

    args = ap.parse_args(argv)
    return args.fn(args)


if __name__ == "__main__":
    raise SystemExit(main())
