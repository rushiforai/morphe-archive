"""Disassemble part of an ARM64 ELF shared library, annotating ADRP+ADD string loads.

Usage:
  arm64_dis.py <lib.so> <start_va_hex> <end_va_hex>
  arm64_dis.py <lib.so> find-imm <imm16_hex> [<lo_va_hex> <hi_va_hex>]   # find `mov wN, #imm`

Needs Capstone. Install it outside the repo and point PYDEPS at it (python -I ignores PYTHONPATH):
  python -m pip install --target <scratch>/pydeps capstone
  PYDEPS=<scratch>/pydeps python -I arm64_dis.py ...
"""
import os
import struct
import sys

if os.environ.get("PYDEPS"):
    sys.path.insert(0, os.environ["PYDEPS"])
import capstone  # noqa: E402

path = sys.argv[1]
data = open(path, "rb").read()
phoff, = struct.unpack_from("<Q", data, 0x20)
phentsize, phnum = struct.unpack_from("<HH", data, 0x36)
loads = []
for i in range(phnum):
    p_type, p_flags, p_offset, p_vaddr, _, p_filesz, _, _ = struct.unpack_from("<IIQQQQQQ", data, phoff + i * phentsize)
    if p_type == 1:
        loads.append((p_vaddr, p_offset, p_filesz, p_flags))


def va2off(va):
    for v, o, sz, _ in loads:
        if v <= va < v + sz:
            return o + (va - v)
    raise SystemExit("address %#x is not in a loaded segment" % va)


def cstr(va):
    try:
        off = va2off(va)
    except SystemExit:
        return None
    end = data.find(b"\0", off, off + 300)
    s = data[off:end] if end != -1 else b""
    return s.decode() if len(s) >= 3 and all(32 <= c < 127 for c in s) else None


if sys.argv[2] == "find-imm":
    value = int(sys.argv[3], 16)
    for va, _, sz, flags in loads:
        if not flags & 1:
            continue
        lo = int(sys.argv[4], 16) if len(sys.argv) > 4 else va
        hi = int(sys.argv[5], 16) if len(sys.argv) > 5 else va + sz
        lo, hi = max(lo, va), min(hi, va + sz)
        if lo >= hi:
            continue
        words = struct.unpack_from("<%dI" % ((hi - lo) // 4), data, va2off(lo))
        for idx, w in enumerate(words):
            if (w & 0x7FE00000) == 0x52800000 and ((w >> 5) & 0xFFFF) == value:  # MOVZ, hw=0
                print("%#x  mov w%d, #%#x" % (lo + idx * 4, w & 31, value))
    sys.exit()

start, end = int(sys.argv[2], 16), int(sys.argv[3], 16)
md = capstone.Cs(capstone.CS_ARCH_ARM64, capstone.CS_MODE_ARM)
pages = {}
for ins in md.disasm(data[va2off(start):va2off(start) + (end - start)], start):
    note = ""
    if ins.mnemonic == "adrp":
        reg, imm = ins.op_str.split(", ")
        pages[reg] = int(imm.lstrip("#"), 16)
    elif ins.mnemonic == "add" and ins.op_str.count(",") == 2:
        rd, rn, imm = [x.strip() for x in ins.op_str.split(",")]
        if rn in pages and imm.startswith("#"):
            addr = pages[rn] + int(imm[1:], 16)
            s = cstr(addr)
            note = "   ; %#x %r" % (addr, s[:90] if s else None)
    print("%#x  %-7s %s%s" % (ins.address, ins.mnemonic, ins.op_str, note))
