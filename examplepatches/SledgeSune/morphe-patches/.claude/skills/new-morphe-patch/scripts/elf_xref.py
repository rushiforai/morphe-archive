"""Find ARM64 code in an ELF shared library that loads given strings (ADRP+ADD),
and list the other strings loaded nearby. Log messages usually name the C++ function.

Usage: elf_xref.py <lib.so> <text> [<text> ...] [--window N]
No dependencies.
"""
import struct
import sys

args = sys.argv[1:]
window = 400
if "--window" in args:
    i = args.index("--window")
    window = int(args[i + 1])
    del args[i:i + 2]
path, needles = args[0], [s.encode() for s in args[1:]]
data = open(path, "rb").read()

phoff, = struct.unpack_from("<Q", data, 0x20)
phentsize, phnum = struct.unpack_from("<HH", data, 0x36)
loads = []
for i in range(phnum):
    p_type, p_flags, p_offset, p_vaddr, _, p_filesz, _, _ = struct.unpack_from("<IIQQQQQQ", data, phoff + i * phentsize)
    if p_type == 1:  # PT_LOAD
        loads.append((p_vaddr, p_offset, p_filesz, p_flags))


def off2va(off):
    for va, o, sz, _ in loads:
        if o <= off < o + sz:
            return va + (off - o)
    return None


def va2off(va):
    for v, o, sz, _ in loads:
        if v <= va < v + sz:
            return o + (va - v)
    return None


def cstr(va):
    off = va2off(va)
    if off is None:
        return None
    end = data.find(b"\0", off, off + 300)
    s = data[off:end] if end != -1 else b""
    return s.decode() if len(s) >= 4 and all(32 <= c < 127 for c in s) else None


def adrp_target(word, pc):
    imm = (((word >> 5) & 0x7FFFF) << 2) | ((word >> 29) & 3)
    if imm & (1 << 20):
        imm -= 1 << 21
    return (pc & ~0xFFF) + (imm << 12)


targets = {}
for needle in needles:
    off = data.find(needle)
    while off != -1:
        start = off
        while data[start - 1] != 0:
            start -= 1
        targets[off2va(start)] = data[start:data.find(b"\0", start)].decode(errors="replace")
        off = data.find(needle, off + 1)
print("strings found:", {hex(k): v for k, v in targets.items()})

for seg_va, seg_off, seg_sz, flags in loads:
    if not flags & 1:  # executable segments only
        continue
    words = struct.unpack_from("<%dI" % (seg_sz // 4), data, seg_off)
    pages = {}
    for idx, w in enumerate(words):
        if (w & 0x9F000000) == 0x90000000:  # ADRP
            pages[w & 31] = (adrp_target(w, seg_va + idx * 4), idx)
        elif (w & 0xFFC00000) == 0x91000000:  # ADD Xd, Xn, #imm12
            rn = (w >> 5) & 31
            if rn in pages and idx - pages[rn][1] <= 6:
                addr = pages[rn][0] + ((w >> 10) & 0xFFF)
                if addr not in targets:
                    continue
                print("\n=== %r loaded at %#x" % (targets[addr], seg_va + idx * 4))
                near = {}
                for j in range(max(0, idx - window), min(len(words), idx + window)):
                    wj = words[j]
                    if (wj & 0x9F000000) == 0x90000000:
                        near[wj & 31] = (adrp_target(wj, seg_va + j * 4), j)
                    elif (wj & 0xFFC00000) == 0x91000000:
                        rj = (wj >> 5) & 31
                        if rj in near and j - near[rj][1] <= 6:
                            s = cstr(near[rj][0] + ((wj >> 10) & 0xFFF))
                            if s:
                                print("  %+5d  %s" % (j - idx, s[:150]))
                    elif wj == 0xD65F03C0:
                        print("  %+5d  ret" % (j - idx))
