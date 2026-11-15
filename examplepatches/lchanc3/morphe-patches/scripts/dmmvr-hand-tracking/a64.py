"""Tiny ARM64 assembler for the handful of instructions the hand-tracking cave needs.
Every emitted word is round-tripped through capstone by Asm.verify()."""
import re, struct

R = lambda r: 31 if r in ('sp', 'xzr', 'wzr') else int(r[1:])

COND = dict(eq=0, ne=1, hs=2, lo=3, mi=4, pl=5, vs=6, vc=7, hi=8, ls=9, ge=10, lt=11, gt=12, le=13, al=14)


class Asm:
    def __init__(self, base):
        self.base = base
        self.items = []      # (kind, payload)
        self.labels = {}

    @property
    def pc(self):
        return self.base + 4 * sum(1 if k != 'bytes' else len(p) // 4 for k, p in self.items)

    def label(self, name):
        self.labels[name] = self.pc

    def raw(self, word):
        self.items.append(('w', word))

    def data(self, b):
        b = b + b'\0' * (-len(b) % 4)
        self.items.append(('bytes', b))

    def __call__(self, text):
        for line in text.strip().splitlines():
            line = line.split(';')[0].strip()
            if not line:
                continue
            if line.endswith(':'):
                self.label(line[:-1]); continue
            self.items.append(('i', line))

    # ---- encoding -------------------------------------------------------
    def enc(self, s, pc):
        m = re.match(r'(\S+)\s*(.*)', s); op, rest = m.group(1), m.group(2)
        a = [x.strip() for x in re.split(r',(?![^\[]*\])', rest)] if rest else []
        imm = lambda t: int(t.lstrip('#'), 0)
        tgt = lambda t: self.labels[t] if t in self.labels else int(t.lstrip('#'), 0)
        sf = lambda r: 1 if r[0] in 'x' or r == 'sp' else 0
        if op == 'ret':
            return 0xd65f03c0
        if op == 'nop':
            return 0xd503201f
        if op in ('b', 'bl'):
            off = (tgt(a[0]) - pc) >> 2
            return (0x94000000 if op == 'bl' else 0x14000000) | (off & 0x3ffffff)
        if op.startswith('b.'):
            off = (tgt(a[0]) - pc) >> 2
            return 0x54000000 | ((off & 0x7ffff) << 5) | COND[op[2:]]
        if op in ('cbz', 'cbnz'):
            off = (tgt(a[1]) - pc) >> 2
            return (sf(a[0]) << 31) | (0x34000000 if op == 'cbz' else 0x35000000) | ((off & 0x7ffff) << 5) | R(a[0])
        if op in ('tbz', 'tbnz'):
            b = imm(a[1]); off = (tgt(a[2]) - pc) >> 2
            return ((b >> 5) << 31) | (0x36000000 if op == 'tbz' else 0x37000000) | ((b & 31) << 19) | ((off & 0x3fff) << 5) | R(a[0])
        if op == 'adr':
            off = tgt(a[1]) - pc
            return 0x10000000 | ((off & 3) << 29) | (((off >> 2) & 0x7ffff) << 5) | R(a[0])
        if op == 'adrp':
            off = (tgt(a[1]) >> 12) - (pc >> 12)
            return 0x90000000 | ((off & 3) << 29) | (((off >> 2) & 0x7ffff) << 5) | R(a[0])
        if op == 'movz':   # movz Rd, #imm16, lsl #sh
            sh = imm(a[2].split('#')[1]) if len(a) > 2 else 0
            return (sf(a[0]) << 31) | 0x52800000 | ((sh // 16) << 21) | ((imm(a[1]) & 0xffff) << 5) | R(a[0])
        if op == 'cset':   # cset Wd, cond  == csinc Wd, wzr, wzr, invert(cond)
            c = COND[a[1]] ^ 1
            return (sf(a[0]) << 31) | 0x1a9f07e0 | (c << 12) | R(a[0])
        if op == 'bic':
            return (sf(a[0]) << 31) | 0x0a200000 | (R(a[2]) << 16) | (R(a[1]) << 5) | R(a[0])
        if op == 'mov' and a[1].startswith('#'):
            v = imm(a[1])
            if v < 0:   # movn
                return (sf(a[0]) << 31) | 0x12800000 | (((~v) & 0xffff) << 5) | R(a[0])
            return (sf(a[0]) << 31) | 0x52800000 | ((v & 0xffff) << 5) | R(a[0])
        if op == 'mov':     # register move (orr / add sp)
            if 'sp' in (a[0], a[1]):
                return (sf(a[0]) << 31) | 0x11000000 | (R(a[1]) << 5) | R(a[0])
            return (sf(a[0]) << 31) | 0x2a0003e0 | (R(a[1]) << 16) | R(a[0])
        if op in ('add', 'sub', 'adds', 'subs', 'cmp'):
            if op == 'cmp':
                op, a = 'subs', [('xzr' if sf(a[0]) else 'wzr')] + a
            S = 1 if op.endswith('s') else 0
            base = 0x11000000 if op.startswith('add') else 0x51000000
            if a[2].startswith('#'):
                return (sf(a[1]) << 31) | base | (S << 29) | ((imm(a[2]) & 0xfff) << 10) | (R(a[1]) << 5) | R(a[0])
            base = 0x0b000000 if op.startswith('add') else 0x4b000000
            sh = imm(a[3].split('#')[1]) if len(a) > 3 else 0
            return (sf(a[1]) << 31) | base | (S << 29) | (R(a[2]) << 16) | (sh << 10) | (R(a[1]) << 5) | R(a[0])
        if op in ('orr', 'and', 'eor') and not a[2].startswith('#'):
            base = dict(orr=0x2a000000, **{'and': 0x0a000000}, eor=0x4a000000)[op]
            sh = imm(a[3].split('#')[1]) if len(a) > 3 else 0
            return (sf(a[0]) << 31) | base | (R(a[2]) << 16) | (sh << 10) | (R(a[1]) << 5) | R(a[0])
        if op in ('lsr', 'ubfx'):   # ubfx Wd, Wn, #lsb, #width ; lsr Wd, Wn, #s
            n = sf(a[0]); size = 64 if n else 32
            lsb = imm(a[2]); width = imm(a[3]) if op == 'ubfx' else size - lsb
            immr, imms = lsb, lsb + width - 1
            return (n << 31) | 0x53000000 | (n << 22) | (immr << 16) | (imms << 10) | (R(a[1]) << 5) | R(a[0])
        if op == 'fneg':
            return 0x1e214000 | (int(a[1][1:]) << 5) | int(a[0][1:])
        if op in ('ldr', 'str', 'ldrb', 'strb'):
            rt = a[0]
            mem = a[1].strip('[]').split(',')
            rn = R(mem[0].strip())
            if len(mem) > 1 and not mem[1].strip().startswith('#'):   # [xn, xm, lsl #3]
                rm = R(mem[1].strip())
                size = 3
                return 0xf8607800 | (0x00400000 if op == 'ldr' else 0) | (rm << 16) | (rn << 5) | R(rt)
            off = imm(mem[1].strip()) if len(mem) > 1 else 0
            if op.endswith('b'):
                size, v = 0, 0
            elif rt[0] == 's':
                size, v = 2, 1
            elif rt[0] == 'd':
                size, v = 3, 1
            else:
                size, v = (3 if rt[0] == 'x' else 2), 0
            L = 1 if op.startswith('ldr') else 0
            assert off % (1 << size) == 0
            return (size << 30) | 0x39000000 | (v << 26) | (L << 22) | ((off >> size) << 10) | (rn << 5) | R(rt)
        if op in ('ldp', 'stp'):
            rt, rt2 = a[0], a[1]
            mem = a[2]
            post = None
            mm = re.match(r'\[(\w+)(?:,\s*#(-?\w+))?\](!?)(?:,\s*#(-?\w+))?$', mem.replace(' ', ''))
            rn = R(mm.group(1)); off = int(mm.group(2), 0) if mm.group(2) else 0
            if mm.group(4):
                mode, off = 1, int(mm.group(4), 0)
            elif mm.group(3):
                mode = 3
            else:
                mode = 2
            if rt[0] == 's':
                opc, v, sc = 0, 1, 4
            elif rt[0] == 'd':
                opc, v, sc = 1, 1, 8
            elif rt[0] == 'x':
                opc, v, sc = 2, 0, 8
            else:
                opc, v, sc = 0, 0, 4
            L = 1 if op == 'ldp' else 0
            return (opc << 30) | 0x28000000 | (v << 26) | (mode << 23) | (L << 22) | (((off // sc) & 0x7f) << 15) | (R(rt2) << 10) | (rn << 5) | R(rt)
        raise ValueError('unsupported: ' + s)

    def assemble(self):
        out = b''; pc = self.base
        self.listing = []
        for k, p in self.items:
            if k == 'bytes':
                out += p; pc += len(p); continue
            w = p if k == 'w' else self.enc(p, pc)
            self.listing.append((pc, w, p if k == 'i' else '.word'))
            out += struct.pack('<I', w); pc += 4
        return out

    def verify(self):
        from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM
        md = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
        bad = 0
        for pc, w, src in self.listing:
            ins = list(md.disasm(struct.pack('<I', w), pc))
            dis = f'{ins[0].mnemonic} {ins[0].op_str}' if ins else '???'
            print(f'{pc:8x}  {w:08x}  {src:40s} | {dis}')
            if not ins:
                bad += 1
        return bad
