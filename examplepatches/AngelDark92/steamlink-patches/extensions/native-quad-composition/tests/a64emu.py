"""Small AArch64 user-mode interpreter used to execute the REAL compiled bytes of the native quad
helper and of the scene thunks. Host evidence only; it is not Bionic and not a headset.

Supported: the integer, load/store, branch and scalar float subset emitted by clang -O2 for the
helper plus the hand-written thunks. Any other instruction raises Unsupported so a pass can never
come from silently skipped code. Requires capstone."""
import math
import struct

from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM
from capstone import arm64_const as C

M64 = (1 << 64) - 1
M32 = (1 << 32) - 1


class Unsupported(Exception):
    pass


class Fault(Exception):
    pass


def f32(x):
    try:
        return struct.unpack('<f', struct.pack('<f', x))[0]
    except OverflowError:
        return math.copysign(math.inf, x)


def f32bits(x):
    return struct.unpack('<I', struct.pack('<f', x))[0]


def bits32f(b):
    return struct.unpack('<f', struct.pack('<I', b & M32))[0]


def f64bits(x):
    return struct.unpack('<Q', struct.pack('<d', x))[0]


def bits64f(b):
    return struct.unpack('<d', struct.pack('<Q', b & M64))[0]


def sx(v, bits):
    v &= (1 << bits) - 1
    return v - (1 << bits) if v >> (bits - 1) else v


class Memory:
    def __init__(self):
        self.pages = {}
        self.watch = None  # callable(addr, size) for every write (tests of "no old-field write")

    def map(self, addr, size):
        for p in range(addr >> 12, (addr + size + 0xFFF) >> 12):
            self.pages.setdefault(p, bytearray(4096))

    def write(self, addr, data):
        if self.watch is not None:
            self.watch(addr, len(data))
        for i, b in enumerate(data):
            a = addr + i
            pg = self.pages.get(a >> 12)
            if pg is None:
                raise Fault('write to unmapped %#x' % a)
            pg[a & 0xFFF] = b

    def read(self, addr, n):
        out = bytearray()
        for i in range(n):
            a = addr + i
            pg = self.pages.get(a >> 12)
            if pg is None:
                raise Fault('read of unmapped %#x' % a)
            out.append(pg[a & 0xFFF])
        return bytes(out)

    def u(self, addr, n):
        return int.from_bytes(self.read(addr, n), 'little')

    def w(self, addr, val, n):
        self.write(addr, (val & ((1 << (8 * n)) - 1)).to_bytes(n, 'little'))


COND = {
    C.ARM64_CC_EQ: lambda n, z, c, v: z, C.ARM64_CC_NE: lambda n, z, c, v: not z,
    C.ARM64_CC_HS: lambda n, z, c, v: c, C.ARM64_CC_LO: lambda n, z, c, v: not c,
    C.ARM64_CC_MI: lambda n, z, c, v: n, C.ARM64_CC_PL: lambda n, z, c, v: not n,
    C.ARM64_CC_VS: lambda n, z, c, v: v, C.ARM64_CC_VC: lambda n, z, c, v: not v,
    C.ARM64_CC_HI: lambda n, z, c, v: c and not z, C.ARM64_CC_LS: lambda n, z, c, v: (not c) or z,
    C.ARM64_CC_GE: lambda n, z, c, v: n == v, C.ARM64_CC_LT: lambda n, z, c, v: n != v,
    C.ARM64_CC_GT: lambda n, z, c, v: (not z) and n == v, C.ARM64_CC_LE: lambda n, z, c, v: z or n != v,
    C.ARM64_CC_AL: lambda n, z, c, v: True, C.ARM64_CC_NV: lambda n, z, c, v: True,
}

RET_MAGIC = 0xFEED0000
STACK_TOP = 0x7F000000


class Cpu:
    def __init__(self, mem=None):
        self.mem = mem or Memory()
        self.x = [0] * 31
        self.sp = STACK_TOP
        self.v = [0] * 32
        self.nzcv = (0, 0, 0, 0)
        self.pc = 0
        self.cs = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
        self.cs.detail = True
        self.cache = {}
        self.hooks = {}  # address -> python callable(cpu); executed instead of code, then returns via x30
        self.trace = []
        self.steps = 0
        self.mem.map(STACK_TOP - 0x20000, 0x20000)
        self.exclusive = None
        self.tpidr = 0
        self.write_watch = None  # optional callable(addr, size) invoked for every store

    # ---- registers ------------------------------------------------------------------
    def rname(self, n):
        name = self.cs.reg_name(n)
        return {'fp': 'x29', 'lr': 'x30'}.get(name, name)

    def getr(self, name):
        if name in ('xzr', 'wzr'):
            return 0
        if name in ('sp', 'wsp'):
            return self.sp & (M64 if name == 'sp' else M32)
        k = name[0]
        idx = int(name[1:])
        if k == 'x':
            return self.x[idx]
        if k == 'w':
            return self.x[idx] & M32
        if k == 'q':
            return self.v[idx]
        if k == 'd':
            return self.v[idx] & M64
        if k == 's':
            return self.v[idx] & M32
        if k == 'h':
            return self.v[idx] & 0xFFFF
        if k == 'b':
            return self.v[idx] & 0xFF
        raise Unsupported('register ' + name)

    def setr(self, name, val):
        if name in ('xzr', 'wzr'):
            return
        if name in ('sp', 'wsp'):
            self.sp = val & (M64 if name == 'sp' else M32)
            return
        k = name[0]
        idx = int(name[1:])
        if k == 'x':
            self.x[idx] = val & M64
        elif k == 'w':
            self.x[idx] = val & M32
        elif k in 'qdsh':
            width = {'q': 128, 'd': 64, 's': 32, 'h': 16}[k]
            self.v[idx] = val & ((1 << width) - 1)  # scalar writes zero the rest
        else:
            raise Unsupported('register ' + name)

    def rs(self, name):
        return bits32f(self.getr(name))

    def ws(self, name, val):
        self.setr(name, f32bits(f32(val)))

    def rd(self, name):
        return bits64f(self.getr(name))

    def wd(self, name, val):
        self.setr(name, f64bits(val))

    # ---- decode ---------------------------------------------------------------------
    def fetch(self, pc):
        ins = self.cache.get(pc)
        if ins is None:
            code = self.mem.read(pc, 4)
            ins = next(self.cs.disasm(code, pc), None)
            if ins is None:
                raise Unsupported('undecodable word %s at %#x' % (code.hex(), pc))
            self.cache[pc] = ins
        return ins

    def addr_of(self, ins, mem_op):
        base = self.getr(self.rname(mem_op.mem.base)) if mem_op.mem.base else 0
        off = mem_op.mem.disp
        if mem_op.mem.index:
            idx = self.getr(self.rname(mem_op.mem.index))
            name = self.rname(mem_op.mem.index)
            if name[0] == 'w':
                idx = sx(idx, 32) if mem_op.ext == C.ARM64_EXT_SXTW else idx
            if mem_op.shift.type == C.ARM64_SFT_LSL:
                idx <<= mem_op.shift.value
            elif mem_op.shift.type != C.ARM64_SFT_INVALID:
                raise Unsupported('index shift')
            off = idx
        return (base + off) & M64, base

    def operand_value(self, op, width):
        if op.type == C.ARM64_OP_IMM:
            val = op.imm & ((1 << width) - 1)
        else:
            val = self.getr(self.rname(op.reg))
            if op.ext:
                bits = {C.ARM64_EXT_UXTB: 8, C.ARM64_EXT_UXTH: 16, C.ARM64_EXT_UXTW: 32, C.ARM64_EXT_UXTX: 64,
                        C.ARM64_EXT_SXTB: 8, C.ARM64_EXT_SXTH: 16, C.ARM64_EXT_SXTW: 32, C.ARM64_EXT_SXTX: 64}[op.ext]
                val &= (1 << bits) - 1
                if op.ext in (C.ARM64_EXT_SXTB, C.ARM64_EXT_SXTH, C.ARM64_EXT_SXTW, C.ARM64_EXT_SXTX):
                    val = sx(val, bits) & ((1 << width) - 1)
        if op.shift.type != C.ARM64_SFT_INVALID:
            s = op.shift.value
            if op.shift.type == C.ARM64_SFT_LSL:
                val = (val << s) & ((1 << width) - 1)
            elif op.shift.type == C.ARM64_SFT_LSR:
                val >>= s
            elif op.shift.type == C.ARM64_SFT_ASR:
                val = sx(val, width) >> s & ((1 << width) - 1)
            elif op.shift.type == C.ARM64_SFT_MSL:
                val = ((val << s) | ((1 << s) - 1)) & ((1 << width) - 1)
            else:
                raise Unsupported('shift type')
        return val

    # ---- execute --------------------------------------------------------------------
    def call(self, addr, args=(), fargs=(), max_steps=2_000_000):
        for i, a in enumerate(args):
            self.x[i] = a & M64
        for i, a in enumerate(fargs):
            self.v[i] = f32bits(a)
        self.x[30] = RET_MAGIC
        self.pc = addr
        start = self.steps
        while self.pc != RET_MAGIC:
            if self.steps - start > max_steps:
                raise Fault('step limit')
            self.step()
        return self.x[0]

    def step(self):
        pc = self.pc
        if pc in self.hooks:
            self.hooks[pc](self)
            self.pc = self.x[30]
            return
        ins = self.fetch(pc)
        self.steps += 1
        self.trace.append(pc)
        self.pc = pc + 4
        self.exec(ins)

    def flags_add(self, a, b, carry, width):
        mask = (1 << width) - 1
        r = a + b + carry
        res = r & mask
        n = res >> (width - 1)
        z = int(res == 0)
        c = int(r > mask)
        sa, sb = sx(a, width), sx(b, width)
        v = int(sx(res, width) != sa + sb + carry)
        self.nzcv = (n, z, c, v)
        return res

    def cond(self, code):
        n, z, c, v = self.nzcv
        return bool(COND[code](n, z, c, v))

    def exec(self, ins):
        mn = ins.mnemonic
        ops = ins.operands
        g = self.getr
        rn = self.rname

        def R(i):
            return rn(ops[i].reg)

        def width_of(name):
            return 64 if name[0] in 'xs' and name != 'sp' or name == 'sp' else 32

        def w_of(name):
            return 64 if name[0] == 'x' or name == 'sp' else 32

        # --- moves / immediates
        if mn in ('mov', 'movz', 'movk', 'movn') and ops[1].type == C.ARM64_OP_IMM:
            d = R(0)
            w = w_of(d)
            imm = ops[1].imm
            if mn == 'movk':
                s = ops[1].shift.value if ops[1].shift.type != C.ARM64_SFT_INVALID else 0
                cur = g(d)
                self.setr(d, (cur & ~(0xFFFF << s)) | ((imm & 0xFFFF) << s))
            elif mn == 'movn':
                s = ops[1].shift.value if ops[1].shift.type != C.ARM64_SFT_INVALID else 0
                self.setr(d, ~((imm & 0xFFFF) << s) & ((1 << w) - 1))
            else:
                s = ops[1].shift.value if ops[1].shift.type != C.ARM64_SFT_INVALID else 0
                self.setr(d, (imm << s) & ((1 << w) - 1) if imm >= 0 else imm & ((1 << w) - 1))
            return
        if mn == 'mov' and ops[0].type == C.ARM64_OP_REG and ops[1].type == C.ARM64_OP_REG:
            d, s = R(0), R(1)
            if d[0] in 'qdsv':
                raise Unsupported('vector mov')
            self.setr(d, g(s))
            return
        if mn == 'adrp':
            self.setr(R(0), ops[1].imm)
            return
        if mn == 'adr':
            self.setr(R(0), ops[1].imm)
            return
        # --- arithmetic
        if mn in ('add', 'sub', 'adds', 'subs', 'cmp', 'cmn', 'neg', 'negs'):
            if mn in ('cmp', 'cmn'):
                a_name = R(0)
                w = w_of(a_name)
                a = g(a_name)
                b = self.operand_value(ops[1], w)
                if mn == 'cmp':
                    self.flags_add(a, (~b) & ((1 << w) - 1), 1, w)
                else:
                    self.flags_add(a, b, 0, w)
                return
            if mn in ('neg', 'negs'):
                d = R(0)
                w = w_of(d)
                b = self.operand_value(ops[1], w)
                r = self.flags_add(0, (~b) & ((1 << w) - 1), 1, w) if mn == 'negs' else (-b) & ((1 << w) - 1)
                self.setr(d, r)
                return
            d = R(0)
            w = w_of(d)
            a = g(R(1))
            b = self.operand_value(ops[2], w)
            if mn in ('add', 'adds'):
                if mn == 'adds':
                    r = self.flags_add(a, b, 0, w)
                else:
                    r = (a + b) & ((1 << w) - 1)
            else:
                if mn == 'subs':
                    r = self.flags_add(a, (~b) & ((1 << w) - 1), 1, w)
                else:
                    r = (a - b) & ((1 << w) - 1)
            self.setr(d, r)
            return
        if mn in ('and', 'ands', 'orr', 'eor', 'tst', 'bic', 'orn', 'eon', 'bics'):
            if mn == 'tst':
                a_name = R(0)
                w = w_of(a_name)
                r = g(a_name) & self.operand_value(ops[1], w)
                self.nzcv = (r >> (w - 1), int(r == 0), 0, 0)
                return
            d = R(0)
            w = w_of(d)
            a = g(R(1))
            b = self.operand_value(ops[2], w)
            if mn in ('bic', 'bics', 'orn', 'eon'):
                b = (~b) & ((1 << w) - 1)
            base = {'and': 'and', 'ands': 'and', 'bic': 'and', 'bics': 'and', 'orr': 'orr', 'orn': 'orr',
                    'eor': 'eor', 'eon': 'eor'}[mn]
            r = a & b if base == 'and' else a | b if base == 'orr' else a ^ b
            if mn in ('ands', 'bics'):
                self.nzcv = (r >> (w - 1), int(r == 0), 0, 0)
            self.setr(d, r)
            return
        if mn in ('lsl', 'lsr', 'asr', 'ror') and ops[2].type in (C.ARM64_OP_IMM, C.ARM64_OP_REG):
            d = R(0)
            w = w_of(d)
            a = g(R(1))
            s = ops[2].imm if ops[2].type == C.ARM64_OP_IMM else g(rn(ops[2].reg))
            s %= w
            if mn == 'lsl':
                r = (a << s) & ((1 << w) - 1)
            elif mn == 'lsr':
                r = a >> s
            elif mn == 'asr':
                r = (sx(a, w) >> s) & ((1 << w) - 1)
            else:
                r = ((a >> s) | (a << (w - s))) & ((1 << w) - 1)
            self.setr(d, r)
            return
        if mn in ('ubfx', 'sbfx', 'ubfiz', 'sbfiz', 'uxtb', 'uxth', 'sxtb', 'sxth', 'sxtw', 'uxtw'):
            d = R(0)
            w = w_of(d)
            a = g(R(1))
            if mn in ('ubfx', 'sbfx'):
                lsb, width = ops[2].imm, ops[3].imm
                r = (a >> lsb) & ((1 << width) - 1)
                if mn == 'sbfx':
                    r = sx(r, width) & ((1 << w) - 1)
            elif mn in ('ubfiz', 'sbfiz'):
                lsb, width = ops[2].imm, ops[3].imm
                r = (a & ((1 << width) - 1))
                if mn == 'sbfiz':
                    r = sx(r, width)
                r = (r << lsb) & ((1 << w) - 1)
            else:
                bits = {'uxtb': 8, 'uxth': 16, 'sxtb': 8, 'sxth': 16, 'sxtw': 32, 'uxtw': 32}[mn]
                r = a & ((1 << bits) - 1)
                if mn.startswith('s'):
                    r = sx(r, bits) & ((1 << w) - 1)
            self.setr(d, r)
            return
        if mn in ('ccmp', 'ccmn'):
            a_name = R(0)
            w = w_of(a_name)
            if self.cond(ins.cc):
                a = g(a_name)
                b = self.operand_value(ops[1], w)
                if mn == 'ccmp':
                    self.flags_add(a, (~b) & ((1 << w) - 1), 1, w)
                else:
                    self.flags_add(a, b, 0, w)
            else:
                f = ops[2].imm
                self.nzcv = ((f >> 3) & 1, (f >> 2) & 1, (f >> 1) & 1, f & 1)
            return
        if mn in ('bfxil', 'bfi'):
            d = R(0)
            w = w_of(d)
            lsb, width = ops[2].imm, ops[3].imm
            src = g(R(1))
            cur = g(d)
            if mn == 'bfxil':
                bits = (src >> lsb) & ((1 << width) - 1)
                cur = (cur & ~((1 << width) - 1)) | bits
            else:
                bits = src & ((1 << width) - 1)
                cur = (cur & ~(((1 << width) - 1) << lsb)) | (bits << lsb)
            self.setr(d, cur & ((1 << w) - 1))
            return
        if mn in ('umaddl', 'smaddl', 'umsubl', 'smsubl'):
            d = R(0)
            a = g(R(1)) & M32
            b = g(R(2)) & M32
            if mn[0] == 's':
                a, b = sx(a, 32), sx(b, 32)
            prod = a * b
            self.setr(d, (g(R(3)) + prod if mn.endswith('addl') else g(R(3)) - prod) & M64)
            return
        if mn in ('mul', 'madd', 'msub', 'umulh', 'smulh', 'udiv', 'sdiv', 'umull', 'smull'):
            d = R(0)
            w = w_of(d)
            m = (1 << w) - 1
            if mn == 'mul':
                self.setr(d, g(R(1)) * g(R(2)) & m)
            elif mn == 'madd':
                self.setr(d, (g(R(1)) * g(R(2)) + g(R(3))) & m)
            elif mn == 'msub':
                self.setr(d, (g(R(3)) - g(R(1)) * g(R(2))) & m)
            elif mn == 'umulh':
                self.setr(d, (g(R(1)) * g(R(2))) >> 64)
            elif mn == 'smulh':
                self.setr(d, ((sx(g(R(1)), 64) * sx(g(R(2)), 64)) >> 64) & M64)
            elif mn == 'umull':
                self.setr(d, (g(R(1)) & M32) * (g(R(2)) & M32))
            elif mn == 'smull':
                self.setr(d, (sx(g(R(1)), 32) * sx(g(R(2)), 32)) & M64)
            elif mn == 'udiv':
                b = g(R(2))
                self.setr(d, (g(R(1)) // b) if b else 0)
            else:
                b = sx(g(R(2)), w)
                a = sx(g(R(1)), w)
                self.setr(d, (int(a / b) if b else 0) & m)
            return
        if mn in ('csel', 'csinc', 'csinv', 'csneg', 'cset', 'csetm'):
            d = R(0)
            w = w_of(d)
            m = (1 << w) - 1
            if mn in ('cset', 'csetm'):
                # capstone 5 reports the alias' own condition (cset w8, eq -> EQ), not the encoded inverse
                taken = self.cond(ins.cc)
                self.setr(d, (1 if mn == 'cset' else m) if taken else 0)
                return
            taken = self.cond(ins.cc)
            a, b = g(R(1)), g(R(2))
            if taken:
                r = a
            elif mn == 'csel':
                r = b
            elif mn == 'csinc':
                r = (b + 1) & m
            elif mn == 'csinv':
                r = (~b) & m
            else:
                r = (-b) & m
            self.setr(d, r)
            return
        # --- branches
        if mn == 'b':
            self.pc = ops[0].imm
            return
        if mn == 'bl':
            self.x[30] = self.pc
            self.pc = ops[0].imm
            return
        if mn == 'br':
            self.pc = g(R(0))
            return
        if mn == 'blr':
            t = g(R(0))
            self.x[30] = self.pc
            self.pc = t
            return
        if mn == 'ret':
            self.pc = g(R(0)) if ops else self.x[30]
            return
        if mn.startswith('b.'):
            if self.cond(ins.cc):
                self.pc = ops[0].imm
            return
        if mn in ('cbz', 'cbnz'):
            v = g(R(0))
            if (v == 0) == (mn == 'cbz'):
                self.pc = ops[1].imm
            return
        if mn in ('tbz', 'tbnz'):
            v = g(R(0))
            bit = (v >> ops[1].imm) & 1
            if (bit == 0) == (mn == 'tbz'):
                self.pc = ops[2].imm
            return
        if mn == 'nop':
            return
        if mn == 'mrs':
            self.setr(R(0), self.tpidr)
            return
        if mn in ('brk', 'udf'):
            raise Fault('trap %s at %#x' % (mn, ins.address))
        # --- memory
        if mn in ('ldr', 'ldrb', 'ldrh', 'ldrsw', 'ldrsh', 'ldrsb', 'ldur', 'ldurb', 'ldurh', 'ldursw', 'ldar',
                  'ldarb', 'ldarh', 'ldapr', 'ldaxr', 'ldxr', 'str', 'strb', 'strh', 'stur', 'sturb', 'sturh',
                  'stlr', 'stlrb', 'stlrh', 'stp', 'ldp', 'ldpsw', 'stxr', 'stlxr'):
            self.mem_op(ins)
            return
        # --- floating point
        if mn in ('fadd', 'fsub', 'fmul', 'fdiv', 'fsqrt', 'fneg', 'fabs', 'fmov', 'fcmp', 'fcmpe', 'fcvt',
                  'scvtf', 'ucvtf', 'fcvtzs', 'fcvtzu', 'fmadd', 'fmsub', 'fnmadd', 'fnmsub', 'fcsel', 'fmin',
                  'fmax', 'movi', 'fmaxnm', 'fminnm', 'frintz', 'sshll', 'fabd'):
            self.fp_op(ins)
            return
        raise Unsupported('%s %s at %#x' % (mn, ins.op_str, ins.address))

    @staticmethod
    def inv_cc(cc):
        return {C.ARM64_CC_EQ: C.ARM64_CC_NE, C.ARM64_CC_NE: C.ARM64_CC_EQ, C.ARM64_CC_HS: C.ARM64_CC_LO,
                C.ARM64_CC_LO: C.ARM64_CC_HS, C.ARM64_CC_MI: C.ARM64_CC_PL, C.ARM64_CC_PL: C.ARM64_CC_MI,
                C.ARM64_CC_VS: C.ARM64_CC_VC, C.ARM64_CC_VC: C.ARM64_CC_VS, C.ARM64_CC_HI: C.ARM64_CC_LS,
                C.ARM64_CC_LS: C.ARM64_CC_HI, C.ARM64_CC_GE: C.ARM64_CC_LT, C.ARM64_CC_LT: C.ARM64_CC_GE,
                C.ARM64_CC_GT: C.ARM64_CC_LE, C.ARM64_CC_LE: C.ARM64_CC_GT}[cc]

    def mem_op(self, ins):
        mn = ins.mnemonic
        ops = ins.operands
        rn = self.rname
        store = mn.startswith('st')
        pair = mn in ('stp', 'ldp', 'ldpsw')
        nreg = 2 if pair else 1
        regs = [rn(ops[i].reg) for i in range(nreg)]
        if mn in ('stxr', 'stlxr'):
            status = rn(ops[0].reg)
            reg = rn(ops[1].reg)
            memop = ops[2]
            addr, _ = self.addr_of(ins, memop)
            size = 8 if reg[0] == 'x' else 4
            self.mem.w(addr, self.getr(reg), size)
            self.setr(status, 0)
            return
        memop = ops[nreg]
        addr, base = self.addr_of(ins, memop)
        # post-index: capstone puts the immediate as an extra IMM operand after the mem operand
        post = None
        if len(ops) > nreg + 1 and ops[nreg + 1].type == C.ARM64_OP_IMM:
            post = ops[nreg + 1].imm
            addr = base & M64
        if mn.endswith('b'):
            size = 1
        elif mn.endswith('h') and mn not in ('ldrh', 'strh') or mn in ('ldrh', 'strh', 'ldarh', 'ldurh', 'sturh',
                                                                         'stlrh', 'ldrsh'):
            size = 2
        elif mn in ('ldrsw', 'ldursw', 'ldpsw'):
            size = 4
        else:
            r0 = regs[0]
            size = {'x': 8, 'w': 4, 's': 4, 'd': 8, 'q': 16, 'h': 2, 'b': 1}[r0[0]]
        if mn in ('ldrb', 'ldrsb', 'ldarb', 'ldurb', 'strb', 'sturb', 'stlrb'):
            size = 1
        for i, r in enumerate(regs):
            a = addr + i * size
            if store:
                self.mem.w(a, self.getr(r), size)
            else:
                val = self.mem.u(a, size)
                if mn in ('ldrsw', 'ldursw', 'ldpsw'):
                    val = sx(val, 32) & M64
                elif mn in ('ldrsh', 'ldrsb'):
                    val = sx(val, 8 * size) & (M64 if r[0] == 'x' else M32)
                self.setr(r, val)
        if post is not None:
            self.setr(rn(memop.mem.base), (base + post) & M64)
        elif ins.writeback:
            self.setr(rn(memop.mem.base), addr)

    # ---- floating point -------------------------------------------------------------
    def fp_op(self, ins):
        mn = ins.mnemonic
        ops = ins.operands
        rn = self.rname

        def R(i):
            return rn(ops[i].reg)

        def read(name):
            return self.rs(name) if name[0] == 's' else self.rd(name)

        def write(name, val):
            if name[0] == 's':
                self.ws(name, val)
            else:
                self.wd(name, val)

        if mn == 'sshll':
            if ops[0].vas != C.ARM64_VAS_4S or ops[1].vas != C.ARM64_VAS_4H or ops[2].imm != 0:
                raise Unsupported('sshll form')
            src = self.v[int(R(1)[1:])]
            out = 0
            for i in range(4):
                out |= (sx((src >> (16 * i)) & 0xFFFF, 16) & M32) << (32 * i)
            self.v[int(R(0)[1:])] = out
            return
        if mn == 'movi':
            if ops[1].type == C.ARM64_OP_IMM and ops[1].imm == 0:
                self.v[int(R(0)[1:])] = 0
                return
            raise Unsupported('movi non-zero')
        if mn in ('fadd', 'fsub', 'fmul', 'fdiv', 'fmin', 'fmax', 'fminnm', 'fmaxnm'):
            d = R(0)
            a, b = read(R(1)), read(R(2))
            if mn == 'fadd':
                r = a + b
            elif mn == 'fsub':
                r = a - b
            elif mn == 'fmul':
                r = a * b
            elif mn == 'fdiv':
                r = (a / b) if b != 0 else (math.nan if a == 0 or a != a else math.copysign(math.inf, a) * math.copysign(1, b))
            elif mn in ('fmin', 'fminnm'):
                r = min(a, b)
            else:
                r = max(a, b)
            write(d, r)
            return
        if mn in ('fmadd', 'fmsub', 'fnmadd', 'fnmsub'):
            d = R(0)
            n, m, a = read(R(1)), read(R(2)), read(R(3))
            if d[0] == 's' and all(math.isfinite(v) for v in (n, m, a)):
                # fused: single rounding of the exact product-sum
                from fractions import Fraction
                fn, fm, fa = Fraction(n), Fraction(m), Fraction(a)
                r = {'fmadd': fa + fn * fm, 'fmsub': fa - fn * fm, 'fnmadd': -fa - fn * fm,
                     'fnmsub': -fa + fn * fm}[mn]
                self.ws(d, float(r))
            else:
                # Fraction rejects NaN/infinity. Python arithmetic propagates the IEEE
                # special cases (including 0*inf and opposing infinities) before rounding.
                write(d, {'fmadd': a + n * m, 'fmsub': a - n * m, 'fnmadd': -a - n * m,
                          'fnmsub': -a + n * m}[mn])
            return
        if mn == 'fabd':
            write(R(0), abs(read(R(1)) - read(R(2))))
            return
        if mn == 'fsqrt':
            v = read(R(1))
            write(R(0), math.sqrt(v) if v >= 0 else math.nan)
            return
        if mn == 'fneg':
            write(R(0), -read(R(1)))
            return
        if mn == 'fabs':
            write(R(0), abs(read(R(1))))
            return
        if mn == 'frintz':
            write(R(0), float(math.trunc(read(R(1)))))
            return
        if mn == 'fmov':
            d = R(0)
            if ops[1].type == C.ARM64_OP_FP:
                write(d, ops[1].fp)
            elif ops[1].type == C.ARM64_OP_IMM:
                write(d, float(ops[1].imm))
            else:
                s = R(1)
                if d[0] in 'sd' and s[0] in 'sd':
                    write(d, read(s))
                else:
                    self.setr(d, self.getr(s))  # raw bit move w<->s or x<->d
            return
        if mn in ('fcmp', 'fcmpe'):
            a = read(R(0))
            b = 0.0 if ops[1].type != C.ARM64_OP_REG else read(R(1))
            if a != a or b != b:
                self.nzcv = (0, 0, 1, 1)
            elif a < b:
                self.nzcv = (1, 0, 0, 0)
            elif a == b:
                self.nzcv = (0, 1, 1, 0)
            else:
                self.nzcv = (0, 0, 1, 0)
            return
        if mn == 'fcvt':
            d, s = R(0), R(1)
            val = read(s)
            write(d, val)
            return
        if mn in ('scvtf', 'ucvtf'):
            d, s = R(0), R(1)
            raw = self.getr(s)
            bits = 64 if s[0] == 'x' else 32
            val = sx(raw, bits) if mn == 'scvtf' else raw
            write(d, float(val))
            return
        if mn in ('fcvtzs', 'fcvtzu'):
            d, s = R(0), R(1)
            val = read(s)
            bits = 64 if d[0] == 'x' else 32
            if val != val:
                r = 0
            else:
                r = int(math.trunc(val)) if abs(val) != math.inf else (1 << (bits - 1)) - 1
            lo, hi = ((-(1 << (bits - 1)), (1 << (bits - 1)) - 1) if mn == 'fcvtzs' else (0, (1 << bits) - 1))
            self.setr(d, max(lo, min(hi, r)) & ((1 << bits) - 1))
            return
        if mn == 'fcsel':
            d = R(0)
            write(d, read(R(1)) if self.cond(ins.cc) else read(R(2)))
            return
        raise Unsupported('fp ' + mn)


# ---- ELF loading ---------------------------------------------------------------------
def load_shared_object(cpu, data, base, symbols=None, overrides=None):
    """Map PT_LOAD segments of an AArch64 ELF at `base`, apply relative/absolute/glob-dat/jump-slot
    relocations. External symbols resolve through `symbols` (name -> address). Returns
    (exports: name -> address, undefined: set of unresolved names)."""
    import io
    from elftools.elf.elffile import ELFFile
    from elftools.elf.relocation import RelocationSection
    from elftools.elf.sections import SymbolTableSection

    elf = ELFFile(io.BytesIO(data))
    for seg in elf.iter_segments():
        if seg['p_type'] != 'PT_LOAD':
            continue
        cpu.mem.map(base + seg['p_vaddr'], seg['p_memsz'])
        cpu.mem.write(base + seg['p_vaddr'], seg.data())
    dynsym = elf.get_section_by_name('.dynsym')
    exports = {}
    undefined = set()
    for s in dynsym.iter_symbols():
        if s['st_shndx'] != 'SHN_UNDEF' and s.name:
            exports[s.name] = base + s['st_value']
    symbols = symbols or {}
    for sec in elf.iter_sections():
        if not isinstance(sec, RelocationSection):
            continue
        for r in sec.iter_relocations():
            t = r['r_info_type']
            where = base + r['r_offset']
            if t == 1027:  # RELATIVE
                cpu.mem.w(where, base + r['r_addend'], 8)
                continue
            sym = dynsym.get_symbol(r['r_info_sym'])
            name = sym.name
            if overrides and name in overrides:
                target = overrides[name]
            elif sym['st_shndx'] != 'SHN_UNDEF':
                target = base + sym['st_value']
            elif callable(symbols):
                target = symbols(name)
            elif name in symbols:
                target = symbols[name]
            else:
                undefined.add(name)
                continue
            if t in (1025, 1026):  # GLOB_DAT, JUMP_SLOT
                cpu.mem.w(where, target, 8)
            elif t == 257:  # ABS64
                cpu.mem.w(where, target + r['r_addend'], 8)
            else:
                raise Unsupported('reloc type %d' % t)
    return exports, undefined
