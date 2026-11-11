"""Static register/flag liveness over one function of an exact stock base (conservative, fail-closed).

Registers are normalised: wN/xN -> xN, bN/hN/sN/dN/qN/vN -> vN. NZCV is the pseudo register 'nzcv'.
Conservative model:
  unknown bl/blr read x0-x7 and write x0-x18, x30, nzcv and v0-v7,v16-v31;
  named ABI signatures and validated internal-call overrides narrow known argument sets;
  ret reads x0,x1,x30 and every callee-saved register (x19-x29, v8-v15), i.e. callee-saved values are
  live-out of every function (known void/bool signatures narrow return registers);
  br (jump tables) makes every register live (unknowable successor).
"""
CALLEE = ['x%d' % i for i in range(19, 30)] + ['v%d' % i for i in range(8, 16)]
CALLER = ['x%d' % i for i in range(0, 19)] + ['x30', 'nzcv'] + ['v%d' % i for i in list(range(0, 8)) + list(range(16, 32))]
ALL = set(CALLEE) | set(CALLER) | {'sp'}

FLAG_READERS_PREFIX = ('b.',)
FLAG_READERS = {'csel', 'csinc', 'csinv', 'csneg', 'cset', 'csetm', 'cinc', 'cinv', 'cneg', 'ccmp', 'ccmn', 'adc', 'adcs',
                'sbc', 'sbcs', 'fcsel', 'fccmp', 'fccmpe'}
FLAG_WRITERS = {'cmp', 'cmn', 'tst', 'adds', 'subs', 'ands', 'bics', 'fcmp', 'fcmpe', 'ccmp', 'ccmn', 'negs', 'adcs',
                'sbcs', 'fccmp', 'fccmpe', 'cmpp'}


def norm(name):
    if name in ('xzr', 'wzr'):
        return None
    if name in ('sp', 'wsp'):
        return 'sp'
    if name in ('fp',):
        return 'x29'
    if name in ('lr',):
        return 'x30'
    if name[0] in 'xw' and name[1:].isdigit():
        return 'x' + name[1:]
    if name[0] in 'bhsdqv' and name[1:].isdigit():
        return 'v' + name[1:]
    return name


def rw(cs, ins, call_args=None):
    """(reads, writes) as sets of normalised names."""
    r, w = ins.regs_access()
    reads = {norm(cs.reg_name(x)) for x in r} - {None}
    writes = {norm(cs.reg_name(x)) for x in w} - {None}
    mn = ins.mnemonic
    if mn in FLAG_READERS or mn.startswith(FLAG_READERS_PREFIX):
        reads.add('nzcv')
    if mn in FLAG_WRITERS:
        writes.add('nzcv')
    if mn in ('cmp', 'cmn', 'tst', 'fcmp', 'fcmpe'):
        from capstone import arm64_const as C
        reads = {norm(cs.reg_name(o.reg)) for o in ins.operands if o.type == C.ARM64_OP_REG} - {None}
        writes = {'nzcv'}  # flag-only aliases never write their compared register
    if mn in ('lsl', 'lsr', 'asr', 'ror'):
        from capstone import arm64_const as C
        reads = {norm(cs.reg_name(o.reg)) for o in ins.operands[1:] if o.type == C.ARM64_OP_REG} - {None}
        writes = {norm(cs.reg_name(ins.operands[0].reg))} - {None}
    if mn in ('cbz', 'cbnz', 'tbz', 'tbnz'):
        reads = {norm(cs.reg_name(ins.operands[0].reg))} - {None}
        writes = set()  # these branches test a register, never NZCV
    if mn in ('bl', 'blr'):
        reads |= {'x%d' % i for i in range(8)} if call_args is None else set(call_args)
        writes |= set(CALLER)
    if mn == 'ret':
        reads |= {'x0', 'x1', 'x30'} | set(CALLEE)
    if mn == 'br':
        reads |= ALL
    # post/pre-indexed addressing writes the base register; capstone already reports it in `writes`
    return reads, writes


def successors(ins, i, by_addr, lo, hi):
    mn = ins.mnemonic
    nxt = ins.address + 4
    if mn == 'ret' or mn == 'br':
        return []
    if mn == 'b':
        t = ins.operands[-1].imm
        return [t] if lo <= t < hi else []          # tail calls leave the function: handled by the caller model
    if mn.startswith('b.') or mn in ('cbz', 'cbnz', 'tbz', 'tbnz'):
        t = ins.operands[-1].imm
        out = [nxt] if nxt < hi else []
        if lo <= t < hi:
            out.append(t)
        return out
    return [nxt] if nxt < hi else []


class Function:
    def __init__(self, scene, name, call_args=None, return_regs=None):
        self.cs = scene.cs
        self.scene = scene
        self.call_args = call_args or {}
        self.return_regs = {'x0', 'x1'} if return_regs is None else set(return_regs)
        self.name = name
        self.lo = scene.syms[name]
        self.hi = self.lo + scene.sizes[name]
        self.ins = scene.dis(self.lo, self.hi - self.lo)
        self.by = {i.address: i for i in self.ins}
        self.live_in = None
        self._solve()

    def _solve(self):
        live = {i.address: set() for i in self.ins}
        everything_live_at_exit_b = set(CALLEE) | {'x0', 'x1', 'x30'}
        changed = True
        while changed:
            changed = False
            for ins in reversed(self.ins):
                # Known ABI signatures avoid treating unspecified argument registers as
                # real inputs (e.g. operator new(size_t) never reads x1..x7). Unknown
                # direct/indirect calls keep the conservative all-argument model.
                args = None
                if ins.mnemonic == 'bl':
                    target = ins.operands[-1].imm
                    name = self.scene.plt_stub_name(target)
                    counts = {'_Znwm': 1, '_ZdlPv': 1,
                              '_ZN28XRQAcquireSwapchainImageRAIIC1ERK12XRQSwapchain': 2,
                              '_ZN28XRQAcquireSwapchainImageRAIID1Ev': 1,
                              '_ZNK28XRQAcquireSwapchainImageRAII21GetAcquiredImageIndexEv': 1,
                              'xrDestroySwapchain': 1, 'glBindTexture': 2, 'glDisable': 1,
                              '__stack_chk_fail': 0,
                              '_Z18XRQCreateSwapchainRK10XRQContextRK16XRQSwapchainInfoR12XRQSwapchain': 3,
                              '_Z28XRQCreateProjectionViewLayerRK10XRQContextRK12XRQSwapchainR32XrCompositionLayerProjectionView': 3}
                    if name in counts:
                        args = {'x%d' % i for i in range(counts[name])}
                    if name and (name.endswith(('D1Ev', 'D2Ev')) or '__release_weakEv' in name):
                        args = {'x0'}
                    if target in self.call_args:
                        args = self.call_args[target]
                reads, writes = rw(self.cs, ins, args)
                if ins.mnemonic == 'blr' and ins.address in self.call_args:
                    reads, writes = rw(self.cs, ins, self.call_args[ins.address])
                if ins.mnemonic == 'ret':
                    reads = (reads - {'x0', 'x1'}) | self.return_regs
                out = set()
                for s in successors(ins, 0, self.by, self.lo, self.hi):
                    out |= live[s]
                if ins.mnemonic == 'b' and not (self.lo <= ins.operands[-1].imm < self.hi):
                    name = self.scene.plt_stub_name(ins.operands[-1].imm) or ''
                    if name.endswith(('D1Ev', 'D2Ev')):
                        out |= set(CALLEE) | {'x0', 'x30'}  # void destructor(this)
                    else:
                        out |= everything_live_at_exit_b | {'x2', 'x3', 'x4', 'x5', 'x6', 'x7'}
                new = reads | (out - writes)
                if new != live[ins.address]:
                    live[ins.address] = new
                    changed = True
        self.live_in = live

    def live_at(self, addr):
        return self.live_in[addr]

    def defs(self, lo, hi):
        w = set()
        for i in self.ins:
            if lo <= i.address < hi:
                w |= rw(self.cs, i)[1]
        return w

    def definitions_at(self, reg, addr):
        """All reaching explicit definitions, respecting branches/returns (None = input)."""
        before = {i.address: set() for i in self.ins}
        before[self.lo] = {None}
        changed = True
        while changed:
            changed = False
            for ins in self.ins:
                if not before[ins.address]:
                    continue
                out = {ins.address} if reg in rw(self.cs, ins)[1] else before[ins.address]
                for target in successors(ins, 0, self.by, self.lo, self.hi):
                    new = before[target] | out
                    if new != before[target]:
                        before[target] = new
                        changed = True
        return before[addr]


def blob_effects(cs, blob, base):
    """(all_writes, reproduced) for a patched blob: reproduced = callee-saved registers written explicitly
    (they survive every call by AAPCS) plus caller-saved registers written after the last call."""
    ins = list(cs.disasm(blob, base))
    assert len(ins) * 4 == len(blob), 'blob does not decode fully'
    all_w, repro = set(), set()
    after_call = set()
    for i in ins:
        r, w = rw(cs, i)
        if i.mnemonic in ('bl', 'blr'):
            all_w |= set(CALLER)
            after_call = set()
            continue
        all_w |= w
        after_call |= {x for x in w if x in CALLER}
        repro |= {x for x in w if x in CALLEE}
    return all_w, repro | after_call
