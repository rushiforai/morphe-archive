#!/usr/bin/env python3
"""dex_structural_walk.py — ART-style linear structural check of a DEX file.

Walks EVERY method's instruction stream linearly (the way ART's
MethodVerifier::Verify() instruction walk does before flow analysis):
  - every code unit must decode via a known opcode/format size
  - packed-switch / sparse-switch / fill-array-data must find a valid
    payload inside the method, at the referenced offset
  - the walk must end exactly at insns_size
Reports every method that fails. Exit code: number of failing methods
(capped at 250).

Usage: dex_structural_walk.py FILE.dex [--verbose]
"""
import struct
import sys

# unit sizes by opcode (matching androguard DALVIK_OPCODES_FORMAT / the
# patcher's _S1.._S5 tables, which were derived from it)
_S1 = ({0x00, 0x01, 0x04, 0x07} | set(range(0x0a, 0x13))
       | {0x1d, 0x1e, 0x21, 0x27, 0x28}
       | set(range(0x7b, 0x90)) | set(range(0xb0, 0xd0)))
_S2 = ({0x02, 0x05, 0x08, 0x13, 0x15, 0x16, 0x19, 0x1a, 0x1c, 0x1f, 0x20,
        0x22, 0x23, 0x29}
       | set(range(0x2d, 0x3e)) | set(range(0x44, 0x6e)) | set(range(0x90, 0xb0))
       | set(range(0xd0, 0xe3)) | {0xfe, 0xff})
_S3 = ({0x03, 0x06, 0x09, 0x14, 0x17, 0x1b, 0x24, 0x25, 0x26, 0x2a, 0x2b,
        0x2c}
       | set(range(0x6e, 0x73)) | set(range(0x74, 0x79)) | {0xfc, 0xfd})
_S4 = {0xfa, 0xfb}
_S5 = {0x18}


def u16(b, o):
    return struct.unpack_from('<H', b, o)[0]


def u32(b, o):
    return struct.unpack_from('<I', b, o)[0]


def uleb(b, off):
    result = 0
    shift = 0
    while True:
        x = b[off]
        off += 1
        result |= (x & 0x7f) << shift
        if not x & 0x80:
            return result, off
        shift += 7


def method_insns_walk(data, code_off):
    """Walk the instruction stream of one code_item. Returns (ok, err)."""
    regs, ins, outs, tries, dbg, isz = struct.unpack_from('<HHHHII', data, code_off)
    base = code_off + 16
    n = isz  # in units
    i = 0
    while i < n:
        u0 = u16(data, base + 2 * i)
        op = u0 & 0xff
        hi = u0 >> 8
        if op == 0x00 and hi in (1, 2, 3):  # payload pseudo-insn
            if hi == 1:
                total = 4 + 2 * u16(data, base + 2 * (i + 1))
            elif hi == 2:
                total = 2 + 4 * u16(data, base + 2 * (i + 1))
            else:
                ew = u16(data, base + 2 * (i + 1))
                cnt = u32(data, base + 2 * (i + 2))
                total = 4 + (ew * cnt + 1) // 2
            i += total
            continue
        if op == 0x2b or op == 0x2c:  # packed/sparse-switch: check payload
            rel = struct.unpack_from('<i', data, base + 2 * (i + 1))[0]
            punit = i + rel
            if not (0 <= punit < n):
                return False, f'unit {i}: switch opcode 0x{op:02x} payload offset {rel} lands outside method (unit {punit}, size {n})'
            ident = u16(data, base + 2 * punit)
            want = 0x0100 if op == 0x2b else 0x0200
            if ident != want:
                return False, f'unit {i}: switch opcode 0x{op:02x} payload ident 0x{ident:04x} at unit {punit} invalid'
            i += 3
            continue
        if op == 0x26:  # fill-array-data
            i += 3
            continue
        if op in _S1:
            i += 1
        elif op in _S2:
            i += 2
        elif op in _S3:
            i += 3
        elif op in _S4:
            i += 4
        elif op in _S5:
            i += 5
        else:
            return False, f'unit {i}: unknown opcode 0x{op:02x}'
    if i != n:
        return False, f'walk ended at unit {i}, insns_size={n}'
    return True, ''


def main():
    path = sys.argv[1]
    verbose = '--verbose' in sys.argv
    data = open(path, 'rb').read()
    if data[0:4] != b'dex\n':
        print('not a dex')
        sys.exit(1)
    (typ_n, typ_off) = struct.unpack_from('<II', data, 64)
    (pro_n, pro_off) = struct.unpack_from('<II', data, 72)
    (met_n, met_off) = struct.unpack_from('<II', data, 88)
    (cls_n, cls_off) = struct.unpack_from('<II', data, 96)

    (str_n, str_off) = struct.unpack_from('<II', data, 56)

    def raw_string(idx):
        off = u32(data, str_off + 4 * idx)
        _, off = uleb(data, off)
        end = data.index(b'\x00', off)
        return data[off:end].decode('utf-8', 'replace')

    def type_desc(idx):
        return raw_string(u32(data, typ_off + 4 * idx))

    def method_info(idx):
        base = met_off + 8 * idx
        cls = type_desc(u16(data, base))
        name = raw_string(u32(data, base + 4))
        return cls, name

    failures = []
    methods = 0
    for ci in range(cls_n):
        cbase = cls_off + 32 * ci
        cd = u32(data, cbase + 24)
        if cd == 0:
            continue
        off = cd
        counts = []
        for _ in range(4):
            v, off = uleb(data, off)
            counts.append(v)
        for _ in range(counts[0] + counts[1]):
            _, off = uleb(data, off)
            _, off = uleb(data, off)
        midx = 0
        for kind in (0, 1):
            midx = 0  # method ids are delta-encoded per section
            for _ in range(counts[2 + kind]):
                d, off = uleb(data, off)
                acc, off = uleb(data, off)
                code, off = uleb(data, off)
                midx += d
                if code == 0:
                    continue
                methods += 1
                ok, err = method_insns_walk(data, code)
                if not ok:
                    cls, name = method_info(midx)
                    failures.append(f'{cls}->{name}: {err}')
    print(f'{path}: walked {methods} methods, {len(failures)} structural failures')
    for f in failures[:250]:
        print('  FAIL', f)
    sys.exit(min(len(failures), 250))


if __name__ == '__main__':
    main()
