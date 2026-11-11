"""Owner-aware storage access audit (no function or class is excluded by name).

For every function of the PATCHED image the audit runs a linear dataflow that tracks, per register, either a
pure constant ('c', n) or an origin-relative address ('o', origin, offset|None). Origins: A0..A7 (incoming
argument registers), R138 (a value loaded from [x,#0x138], i.e. the legacy client->renderer pointer), '?' unknown.
Shifted immediates (`add xd, xs, #1, lsl #12`) and constant registers added to a base (`mov w9,#0x1818 ;
add x8,x0,x9`) are folded. State is reset to unknown at every branch target and after calls (x0-x18).
A callee-saved register that is assigned exactly once in the function by `mov xN, x0..x7` keeps that origin for
the whole function.

Every apparent access to the abandoned old projection storage or the 16-byte owned state slot is classified:
  ACCOUNTED  inside a replaced region / owned hook window, or a constructor zero store before the load hook
  RENDERER   base origin is the incoming `this` of a QSVLRendererXR member, or an R138 value -> must be ACCOUNTED
  FOREIGN    base origin is the incoming `this` (A0) of a method of ANOTHER class: the offset is a field of that
             class. Reported with its owner; fails if the same function also loads R138 into a register that is
             then used as a base of any hit (possible renderer alias).
  UNKNOWN    base origin not provable -> unexplained (fails)
"""
import bisect
import re

R138 = 'R138'


def owner_class(name):
    m = re.match(r'_ZN(\d+)', name)
    if not m:
        return None
    n = int(m.group(1))
    start = 3 + len(m.group(1))
    return name[start:start + n]


def build_function_index(s):
    funcs = sorted((v, n) for n, v in s.syms.items() if s.sizes.get(n, 0) > 0)
    keys = [v for v, _ in funcs]

    def find(va):
        i = bisect.bisect_right(keys, va) - 1
        if i < 0:
            return None
        v, n = funcs[i]
        return (n, v, s.sizes[n]) if va < v + s.sizes[n] else (n + '?gap', v, 0)
    return find


def _num(op):
    v = op.imm
    if op.shift.type == 1 and op.shift.value:          # ARM64_SFT_LSL
        v <<= op.shift.value
    return v


def audit_storage(s, ins, ranges, slot, accounted, ctor_range, ctor_hook):
    """Return (hits, unexplained) for the patched image `s` with decoded instructions `ins`."""
    find = build_function_index(s)
    by_func = {}
    for i in ins:
        f = find(i.address)
        by_func.setdefault(f[1] if f else 0, []).append(i)
    targets = set()
    for i in ins:
        if i.mnemonic in ('b', 'bl') or i.mnemonic.startswith('b.') or i.mnemonic in ('cbz', 'cbnz', 'tbz', 'tbnz'):
            targets.add(i.operands[-1].imm)
    allr = list(ranges) + [slot]
    hits, unexplained = [], []

    def in_range(lo, size):
        return any(lo < b and lo + size > a for a, b in allr)

    for fstart, body in by_func.items():
        fn = find(body[0].address)
        name = fn[0] if fn else '?'
        cls = owner_class(name.replace('?gap', ''))
        # callee-saved registers written exactly once, by `mov xN, x0..x7` -> permanent origin
        writes = {}
        for i in body:
            if i.operands and i.operands[0].type == 1 and i.mnemonic not in ('str', 'stp', 'cmp', 'cmn', 'tst', 'ldr', 'ldp', 'stur', 'strb', 'strh', 'cbz', 'cbnz', 'tbz', 'tbnz', 'stlr', 'stlrb'):
                writes.setdefault(i.reg_name(i.operands[0].reg), []).append(i)
            if i.mnemonic in ('ldr', 'ldp', 'ldur', 'ldar', 'ldrb', 'ldrh', 'ldrsw') and not any(
                    o.type == 3 and i.reg_name(o.mem.base) in ('sp', 'x29') for o in i.operands):   # skip epilogue restores
                for o in i.operands[:2 if i.mnemonic == 'ldp' else 1]:
                    if o.type == 1:
                        writes.setdefault(i.reg_name(o.reg), []).append(i)
        perm = {}
        pad_writes = set()
        pos_of = {x.address: k for k, x in enumerate(body)}
        for r, ws in writes.items():
            if not (r.startswith('x') and ws[0].mnemonic == 'mov' and ws[0].op_str.split(', ')[1] in ('x0', 'x1', 'x2')):
                continue
            # further writes are tolerated only as landing-pad captures `mov xN, x0` right after a terminator
            # (the incoming x0 is then the exception object, so the register is NOT an origin there)
            others = ws[1:]
            last_ret = max([x.address for x in body if x.mnemonic == 'ret'] or [0])
            if all(o.mnemonic == 'mov' and o.op_str.endswith(', x0') and o.address > last_ret for o in others):
                perm[r] = ('o', 'A' + ws[0].op_str.split(', ')[1][1:], 0)
                pad_writes.update(o.address for o in others)
        reg = {'x0': ('o', 'A0', 0), 'x1': ('o', 'A1', 0), 'x2': ('o', 'A2', 0)}
        reg.update(perm)
        loads_r138 = False
        prev = None
        for i in body:
            if prev is not None and prev.mnemonic in ('ret', 'b', 'br') and i.address not in targets \
                    and find(i.address) and find(i.address)[0].endswith('?gap'):
                # unreachable-by-fallthrough start of the next (unnamed) function: fresh entry state, no
                # class evidence, so any hit on its incoming arguments cannot be attributed
                reg = {'x0': ('o', 'U0', 0), 'x1': ('o', 'U1', 0), 'x2': ('o', 'U2', 0)}
                name = name.split('?gap')[0] + '?unnamed@%#x' % i.address
                cls = None
            elif (i.address in targets or (prev is not None and prev.mnemonic in ('ret', 'b', 'br'))) \
                    and i.address != body[0].address:
                reg = {k: v for k, v in reg.items() if k in perm}
            prev = i
            mn = i.mnemonic
            ops = i.operands
            rn = lambda o: i.reg_name(o.reg)  # noqa: E731

            def val(o):
                if o.type == 2:
                    return ('c', _num(o))
                if o.type == 1:
                    n = rn(o)
                    if n in ('xzr', 'wzr'):
                        return ('c', 0)
                    return reg.get('x' + n[1:]) if n[0] in 'xw' else None
                return None

            # ---- memory access check
            for k, o in enumerate(ops):
                if o.type == 3 and o.mem.base:
                    base = i.reg_name(o.mem.base)
                    if base == 'sp':
                        continue
                    bv = reg.get(base)
                    size = 16 if mn in ('ldp', 'stp') or (ops and ops[0].type == 1 and rn(ops[0])[0] == 'q') else 8
                    disp = o.mem.disp
                    if o.mem.index:
                        continue
                    if mn == 'ldr' and disp == 0x138 and ops[0].type == 1 and rn(ops[0])[0] == 'x':
                        loads_r138 = True
                    check = []
                    if bv is not None and bv[0] == 'o':
                        origin = bv[1]
                        off = bv[2]
                        if off is None:
                            check.append((origin, disp, True))
                        else:
                            check.append((origin, off + disp, False))
                    else:
                        check.append(('?', disp, False))
                    for origin, off, strided in check:
                        span = size + (0x78 if strided else 0)
                        if in_range(off, span):
                            hits.append((i.address, mn, i.op_str, origin, off, name, cls))
            # ---- dataflow
            if mn == 'mov' and len(ops) == 2:
                v = val(ops[1])
                d = rn(ops[0])
                if d[0] == 'w' and v and v[0] == 'o':
                    v = None                          # a 32-bit move cannot carry a pointer origin
                if d[0] in 'xw':
                    reg['x' + d[1:]] = v if v else None
                    if v is None:
                        reg.pop('x' + d[1:], None)
                    if d in perm and i.address not in pad_writes:
                        reg['x' + d[1:]] = perm[d]
                    elif i.address in pad_writes:
                        reg.pop('x' + d[1:], None)
            elif mn in ('add', 'sub') and len(ops) == 3 and ops[0].type == 1 and rn(ops[0])[0] in 'xw':
                d = 'x' + rn(ops[0])[1:]
                a = val(ops[1]) if ops[1].type == 1 else None
                b = val(ops[2])
                sgn = 1 if mn == 'add' else -1
                new = None
                if a and b:
                    if a[0] == 'c' and b[0] == 'c':
                        new = ('c', a[1] + sgn * b[1])
                    elif a[0] == 'o' and b[0] == 'c':
                        new = ('o', a[1], None if a[2] is None else a[2] + sgn * b[1])
                    elif a[0] == 'c' and b[0] == 'o' and mn == 'add':
                        new = ('o', b[1], None if b[2] is None else b[2] + a[1])
                if new is None and a and a[0] == 'o' and ops[2].type == 1 and (not b or b[0] != 'c'):
                    new = ('o', a[1], None)         # base + unknown/index register: strided/indexed
                if new and new[0] == 'o' and new[2] is not None:
                    # record the address-formation itself when it lands on protected storage
                    if in_range(new[2], 1) and b and b[0] == 'c':
                        hits.append((i.address, mn, i.op_str, new[1], new[2], name, cls))
                if new and new[0] == 'o' and new[2] is None and a and a[0] == 'o' and b and b[0] == 'c' \
                        and in_range(b[1], 0x78):
                    hits.append((i.address, mn, i.op_str, new[1], b[1], name, cls))   # strided address formation
                if d in perm:
                    new = perm[d]
                if new:
                    reg[d] = new
                else:
                    reg.pop(d, None)
            elif mn == 'madd' and len(ops) == 4:
                base = val(ops[3])
                d = 'x' + rn(ops[0])[1:]
                reg[d] = ('o', base[1], None) if base and base[0] == 'o' else reg.pop(d, None) and None
                if reg[d] is None:
                    reg.pop(d, None)
            elif mn == 'ldr' and ops and ops[0].type == 1 and rn(ops[0])[0] == 'x' and len(ops) > 1 and ops[1].type == 3:
                d = rn(ops[0])
                if ops[1].mem.disp == 0x138 and not ops[1].mem.index:
                    reg[d] = ('o', R138, 0)
                elif d in perm:
                    reg[d] = perm[d]
                else:
                    bv = reg.get(i.reg_name(ops[1].mem.base)) if ops[1].mem.base else None
                    if bv and bv[0] == 'o' and bv[1] in ('A0', 'A1', 'A2'):
                        reg[d] = ('o', 'I' + bv[1], 0)     # pointer read out of an incoming object
                    else:
                        reg.pop(d, None)
            elif mn in ('bl', 'blr'):
                for k in range(0, 19):
                    n = 'x%d' % k
                    if n not in perm:
                        reg.pop(n, None)
            else:
                if ops and ops[0].type == 1 and mn not in ('str', 'stp', 'stur', 'strb', 'strh', 'cmp', 'cmn', 'tst', 'stlr', 'stlrb', 'cbz', 'cbnz', 'tbz', 'tbnz', 'b', 'ret', 'br'):
                    d = rn(ops[0])
                    if d[0] in 'xw' and d != 'wzr' and d != 'xzr':
                        reg.pop('x' + d[1:], None)
                        if mn == 'ldp' and len(ops) > 1 and ops[1].type == 1:
                            reg.pop('x' + rn(ops[1])[1:], None)
    # ---- classification
    r138_funcs = set()
    for i in ins:
        if i.mnemonic == 'ldr' and len(i.operands) > 1 and i.operands[1].type == 3 and i.operands[1].mem.disp == 0x138 \
                and i.operands[0].type == 1 and i.reg_name(i.operands[0].reg)[0] == 'x':
            f = find(i.address)
            if f:
                r138_funcs.add(f[0])
    for idx, h in enumerate(list(hits)):
        addr, mn, ops, origin, off, name, cls = h
        if any(lo <= addr < hi for lo, hi in accounted):
            kind = 'ACCOUNTED'
        elif ctor_range[0] <= addr < ctor_range[1] and addr <= ctor_hook and mn.startswith(('st', 'add', 'mov')):
            kind = 'ACCOUNTED'      # constructor initialisation, runs before the load hook
        elif origin == R138 or cls == 'QSVLRendererXR' or (origin == 'A0' and cls == 'QSVLRendererXR'):
            kind = 'RENDERER'
        elif origin in ('A0', 'A1', 'A2') and cls:
            kind = 'FOREIGN-R138' if name in r138_funcs else 'FOREIGN'
        elif origin in ('IA0', 'IA1', 'IA2') and cls:
            # pointer stored in a foreign object; the legacy renderer pointer is only ever stored at client+0x138
            # (constructor store), so it only reaches other objects through an R138 load, which is tracked
            kind = 'FOREIGN-R138' if name in r138_funcs else 'FOREIGN-INDIRECT'
        elif origin in ('U0', 'U1', 'U2'):
            kind = 'UNNAMED-UNPROVEN'
        else:
            kind = 'UNKNOWN'
        h_full = h + (kind,)
        if kind in ('RENDERER', 'UNKNOWN', 'FOREIGN-R138', 'UNNAMED-UNPROVEN'):
            unexplained.append(h_full)
        hits[idx] = h_full
    return hits, unexplained
