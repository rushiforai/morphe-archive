"""Per-base STATIC liveness / flags / path / alias assertions for the native quad plan.

These supplement (never replace) the execution tests: a plan that fails any assertion here is rejected
(AssertionError -> build_patch_tables aborts, nothing is emitted). All analysis runs on the exact stock base.
"""
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import liveness as lv  # noqa: E402
import nq_sites  # noqa: E402

CALLER_SET = set(lv.CALLER)


def _func_name(s, key):
    if key == 'e2h':
        return s.find_one('_ZN12QSVLClientXR21GetEyeToHeadTransformE')[0]
    if key == 'gl':
        return s.find_one('_ZN14QSVLRendererXR19GetProjectionLayersE')[0]
    return nq_sites.FUNCS[key]


def _check_region(F, lo, hi, blob, cs, label, base_va, allow_defs=()):
    """Generic in-place replacement [lo,hi) -> blob (which ends in a branch back to hi)."""
    live = F.live_at(hi)
    assert 'nzcv' not in live, '%s: flags live into continuation %#x' % (label, hi)
    orig_defs = F.defs(lo, hi)
    all_w, repro = lv.blob_effects(cs, blob, base_va)
    need = (live & orig_defs) - {'sp'}
    missing = sorted(need - repro)
    assert not missing, '%s: continuation %#x needs %s produced by the replaced code but the thunk does not reproduce it' % (
        label, hi, missing)
    corrupt = sorted((live & all_w) - orig_defs - {'sp'} - set(allow_defs))
    assert not corrupt, '%s: thunk clobbers %s which are live into %#x and not defined by the replaced code' % (label, corrupt, hi)
    cs_writes = sorted(x for x in all_w if x in lv.CALLEE and x not in orig_defs and x in live)
    assert not cs_writes, '%s: callee-saved %s changed' % (label, cs_writes)
    return dict(live_in=sorted(live), orig_defs=sorted(orig_defs), reproduced=sorted(repro & need))


def _single_def(F, reg, last_ret_ok=True):
    """Instructions that write `reg` (landing-pad captures after the last ret are reported separately)."""
    last_ret = max([i.address for i in F.ins if i.mnemonic == 'ret'] or [0])
    main, pad = [], []
    for i in F.ins:
        r, w = lv.rw(F.cs, i)
        if reg in w and i.mnemonic not in ('bl', 'blr'):
            if i.mnemonic in ('ldr', 'ldp') and '[sp' in i.op_str and i.address < last_ret:
                tail = [j for j in F.ins if i.address < j.address <= last_ret]
                if all(j.mnemonic in ('ldr', 'ldp', 'add', 'ret') for j in tail):
                    continue  # verified normal epilogue restore, not an assignment in the body
            (pad if i.address > last_ret and i.mnemonic == 'mov' and i.op_str.endswith(', x0') else main).append(i)
    return main, pad


def check_all(s, d, spec, blobs, cs, labels):
    """Return a dict of evidence strings; raise AssertionError on any failure."""
    ev = {}
    # ---------------------------------------------------------------- Init
    init = lv.Function(s, _func_name(s, 'init'))
    lo, hi = d['init_region']
    first4 = [('%s %s' % (i.mnemonic, i.op_str)) for i in init.ins if lo <= i.address < hi]
    # the preserved prologue words must be present in the replaced region (p_init re-executes them literally)
    for need in ('ldr x8, [x23, #0x28]', 'mov x19, x1', 'mov x21, x0', 'stur x8, [x29, #-8]'):
        assert need in first4, ('Init region lacks preserved prologue instruction', need)
    # regions's only memory stores are the prologue canary store plus stores through the renderer (x0/x21), never to sp
    for i in init.ins:
        if lo <= i.address < hi and i.mnemonic.startswith('st') and 'sp' in i.op_str.split('[')[-1]:
            raise AssertionError('Init region stores to the stack frame: %#x %s %s' % (i.address, i.mnemonic, i.op_str))
    addr, data = blobs['p_init']
    ev['init'] = _check_region(init, lo, hi, data, cs, 'Init', addr)
    # ---------------------------------------------------------------- Flip per-eye block
    flip = lv.Function(s, _func_name(s, 'flip'), {
        d['fov_fn']: {'x0', 'x1'}, d['pose_helper']: {'x0', 'x1'},
    })
    flo, fhi = d['flip_eye']
    # the block must be straight-line apart from calls and must not contain a branch target other than its start
    targets = set()
    for i in flip.ins:
        if i.mnemonic in ('b', 'bl') or i.mnemonic.startswith('b.') or i.mnemonic in ('cbz', 'cbnz', 'tbz', 'tbnz'):
            targets.add(i.operands[-1].imm)
    inside = [t for t in targets if flo < t < fhi]
    assert not inside, 'Flip per-eye block has inner branch targets %s' % [hex(t) for t in inside]
    outside_branch = [i for i in flip.ins if flo <= i.address < fhi and
                      (i.mnemonic in ('b', 'br', 'ret') or i.mnemonic.startswith('b.') or i.mnemonic in ('cbz', 'cbnz', 'tbz', 'tbnz'))]
    assert not outside_branch, 'Flip per-eye block contains branches %s' % [hex(i.address) for i in outside_branch]
    # x26/x27 (per-eye pointers) and the eye/base registers
    live = flip.live_at(fhi)
    cache = spec['cache_reg']
    cdefs = flip.defs(flo, fhi)
    # the pre-region value of x8 (renderer + eye*8) must still be live at the region start: no write in between
    pre = [i for i in flip.ins if flo - 0x80 <= i.address < flo]
    last_x8 = [i for i in pre if 'x8' in lv.rw(cs, i)[1]]
    assert last_x8 and last_x8[-1].mnemonic == 'add' and last_x8[-1].op_str.startswith('x8, x19, x10'), \
        'x8 at the per-eye block start is not renderer+eye*8'
    # x20 has other uses earlier in FlipFrame (timestamp/allocation). Prove the
    # reaching definition at EVERY hook instead of assuming one assignment globally.
    for site in [flo] + d['flip_pose']:
        for reg in ('x19', 'x20'):
            defs = flip.definitions_at(reg, site)
            assert len(defs) == 1 and None not in defs, (reg, hex(site), defs)
            definition = flip.by[next(iter(defs))]
            assert definition.mnemonic == 'mov' and definition.op_str == reg + ', x0'
            if reg == 'x20':
                previous = flip.by[definition.address - 4]
                assert previous.mnemonic == 'bl' and 'GetMetadataForFrameId' in (s.plt_stub_name(previous.operands[0].imm) or '')
    addr, data = blobs['p_flip_eye']
    ev['flip_eye'] = _check_region(flip, flo, fhi, data, cs, 'Flip per-eye', addr)
    assert cache in ev['flip_eye']['reproduced'] or cache not in live, 'cache pointer %s live but not reproduced' % cache
    # x30 / flags for the pose sites: the six pose calls and the frame call are in ONE basic block
    poses = sorted(d['flip_pose'])
    inner_targets = [t for t in targets if poses[0] < t <= poses[-1]]
    assert not inner_targets, 'pose sites are not in one basic block: targets %s' % [hex(t) for t in inner_targets]
    br = [i for i in flip.ins if poses[0] <= i.address <= poses[-1] and
          (i.mnemonic in ('b', 'br', 'ret') or i.mnemonic.startswith('b.') or i.mnemonic in ('cbz', 'cbnz', 'tbz', 'tbnz'))]
    assert not br, 'branch between pose sites: %s' % [hex(i.address) for i in br]
    # t_frame is the LAST site: it dominates every path leaving the block and runs after every removed call
    assert d['flip_pose'][-1] == poses[-1]
    # pose helper is void: no caller-saved result (x0) is consumed after a removed call
    for va in poses:
        assert 'x0' not in flip.live_at(va + 4), 'x0 live after pose site %#x' % va
    ev['flip_pose'] = 'one basic block %#x..%#x, last site calls t_frame' % (poses[0], poses[-1])
    # size compare thunks
    for key, clob in (('dim_w', {'x9', 'x10', 'x30', 'nzcv'}), ('dim_h', {'x10', 'x30', 'nzcv'})):
        va = d[key]
        l = flip.live_at(va + 4)
        bad = sorted(clob & l)
        assert not bad, '%s thunk clobbers %s live after %#x' % (key, bad, va + 4)
        ev[key] = 'live after %#x: %s' % (va + 4, sorted(l & {'x8', 'x9', 'x10', 'x30', 'nzcv'}))
    # ---------------------------------------------------------------- Setup
    setup = lv.Function(s, _func_name(s, 'setup'))
    for name, F, bounds in ([('s_setup_under', setup, d['setup_under'])] if 'setup_under' in d else []) + [
            ('s_flip_under%d' % n, flip, bounds) for n, bounds in enumerate(d.get('flip_under', []))]:
        lo, hi = bounds
        # No incoming branch may bypass the new entry branch and enter removed instructions.
        # Error-reporting blocks can jump back into stock creation code. They become
        # unreachable when its calls/conditional exits are removed; prove that using
        # the replacement CFG rather than rejecting dead references by position alone.
        removed = ([tuple(d['setup_under'])] if F is setup else [tuple(b) for b in d.get('flip_under', [])])
        reached, pending = set(), [F.lo]
        while pending:
            pc = pending.pop()
            if pc in reached:
                continue
            reached.add(pc)
            skip = next((b for b in removed if b[0] == pc), None)
            pending.extend([skip[1]] if skip else lv.successors(F.by[pc], 0, F.by, F.lo, F.hi))
        incoming = [i.address for i in F.ins if i.address in reached and not lo <= i.address < hi and
                    (i.mnemonic in ('b', 'bl', 'cbz', 'cbnz', 'tbz', 'tbnz') or i.mnemonic.startswith('b.')) and
                    lo < i.operands[-1].imm < hi]
        assert not incoming, '%s has incoming branches: %s' % (name, incoming)
        assert not any(lo < pc < hi for pc in reached), '%s still has reachable removed instructions' % name
        addr, data = blobs[name]
        ev[name] = _check_region(F, lo, hi, data, cs, name, addr)
    for k, va in d['setup_cpvl'].items():
        l = setup.live_at(va + 4)
        assert 'x0' not in l, 'Setup: result of cpvl at %#x (%s) is read afterwards' % (va, k)
        if k != 'under':
            madd, add = setup.by[va - 8], setup.by[va - 4]
            assert madd.mnemonic == 'madd' and add.mnemonic == 'add' and add.op_str.startswith('x2, x8,'), (madd.op_str, add.op_str)
            dest = madd.op_str.split(',')[0].strip()
            assert dest in CALLER_SET, 'madd destination %s is not caller-saved' % dest
            assert dest not in l, 'madd destination %s live after the call' % dest
            parts = [p.strip() for p in madd.op_str.split(',')]
            assert parts[3] == 'x19', 'madd base is not the renderer in x19'
            eyer = parts[1]
            assert eyer in lv.CALLEE, 'eye register %s is not callee-saved' % eyer
            d.setdefault('setup_eye', {})[k] = eyer
            # the replaced madd/add/bl define only caller-saved registers
            assert not (setup.defs(va - 8, va + 4) - CALLER_SET), 'Setup replaced code defines callee-saved registers'
            # the swapchain object (x1 = x28) and ctx (x0 = x20) are set by the two instructions before madd
            ev.setdefault('setup', []).append((k, hex(va), dest, eyer))
    # ---------------------------------------------------------------- ctor / dtor hooks
    for key, fkey, hook, defs in (('ctor', 'ctor', d['ctor_hook'], {'x8'}), ('dtor', 'dtor', d['dtor_hook'], {'x0'})):
        F = lv.Function(s, _func_name(s, fkey), return_regs=set())
        if key == 'dtor':
            indirect = {}
            for i in F.ins:
                if i.mnemonic == 'bl' and s.plt_stub_name(i.operands[0].imm) is None:
                    target = i.operands[0].imm
                    body = s.dis(target, 0x30)
                    if [j.mnemonic for j in body] == ['bti', 'adrp', 'ldrb', 'cbz', 'ldaddal', 'ret',
                                                         'mov', 'ldaxr', 'add', 'stlxr', 'cbnz', 'ret']:
                        assert body[4].op_str == 'x0, x0, [x1]' and body[7].op_str == 'x0, [x1]'
                        assert body[6].op_str == 'x16, x0' and body[8].op_str == 'x17, x0, x16'
                        assert body[9].op_str == 'w15, x17, [x1]'
                        indirect[target] = {'x0', 'x1'}  # compiler outline atomic fetch_add
                if i.mnemonic == 'blr':
                    prev = F.by[i.address - 4]
                    assert i.op_str == 'x8' and prev.mnemonic == 'ldr' and prev.op_str in (
                        'x8, [x8, #8]', 'x8, [x8, #0x10]'), 'unknown indirect destructor call'
                    indirect[i.address] = {'x0'}
            F = lv.Function(s, _func_name(s, fkey), call_args=indirect, return_regs=set())
        l = F.live_at(hook + 4)
        bad = sorted((l & (CALLER_SET)) - defs)
        assert not bad, '%s hook clobbers %s live after %#x' % (key, bad, hook + 4)
        ev[key] = 'live after hook: %s' % sorted(l & CALLER_SET)
        if key == 'dtor':
            first = F.ins[0]
            assert first.mnemonic == 'stp' and first.op_str.startswith('x29, x30, [sp, #-'), 'x30 not saved in the dtor prologue'
            # nothing between the prologue and the hook writes x30 (except calls) or x19
            for i in F.ins:
                if F.lo < i.address < hook:
                    r, w = lv.rw(cs, i)
                    assert 'x30' not in w or i.mnemonic in ('bl', 'blr'), 'x30 rewritten before the dtor hook'
            defs = F.definitions_at('x19', hook)
            assert len(defs) == 1 and None not in defs and F.by[next(iter(defs))].op_str == 'x19, x0', 'renderer not in x19 at the dtor hook'
        else:
            defs = F.definitions_at('x19', hook)
            assert len(defs) == 1 and None not in defs and F.by[next(iter(defs))].op_str == 'x19, x0', 'renderer not in x19 at the ctor hook'
            assert 'x26' not in lv.rw(cs, F.by[hook])[1], 'unexpected'
            # the hook is on the one normal return path: it is followed (without any branch target) by the canary
            # check and a ret; no other store to the canary slot register exists
            tail = [i for i in F.ins if i.address > hook]
            assert tail[0].mnemonic == 'ldur' and tail[1].mnemonic == 'cmp' and tail[2].mnemonic == 'b.ne'
            assert not [t for t in ({x.operands[-1].imm for x in F.ins if x.mnemonic in ('b', 'cbz', 'cbnz', 'tbz', 'tbnz') or x.mnemonic.startswith('b.')}) if hook < t <= tail[8].address and t != tail[2].operands[-1].imm], 'branch into the ctor tail'
    # ---------------------------------------------------------------- E2H
    e2h = lv.Function(s, _func_name(s, 'e2h'), return_regs={'x0'})
    l = e2h.live_at(d['e2h_ret'])
    bad = sorted((l & CALLER_SET))
    assert not bad, 'E2H continuation %#x reads caller-saved %s that the thunk clobbers' % (d['e2h_ret'], bad)
    reg = 'x20'  # the one far-plane target keeps the client in x20
    defs = e2h.definitions_at(reg, d['e2h_site'])
    assert len(defs) == 1 and None not in defs, (reg, defs)
    assert 'x30' not in l, 'x30 live at E2H continuation'
    # x8 at the site is the view vector begin loaded from the stack and not rewritten afterwards
    last = [i for i in e2h.ins if i.address < d['e2h_site'] and 'x8' in lv.rw(cs, i)[1]]
    assert last and last[-1].mnemonic == 'ldr' and last[-1].op_str == 'x8, [sp]', 'x8 is not the XrView vector begin: %s' % last[-1].op_str
    ev['e2h'] = 'live at e2h_ret: %s' % sorted(l)
    # ---------------------------------------------------------------- aliases / call graph
    cd = {n: v for n, v in s.syms.items() if n.startswith('_ZN14QSVLRendererXR') and (n.endswith('EP7SVLRoot') or n.endswith('D1Ev') or n.endswith('D2Ev') or n.endswith('D0Ev'))}
    c1 = [v for n, v in cd.items() if n.startswith('_ZN14QSVLRendererXRC1')]
    c2 = [v for n, v in cd.items() if n.startswith('_ZN14QSVLRendererXRC2')]
    d1 = [v for n, v in cd.items() if n.endswith('D1Ev')]
    d2 = [v for n, v in cd.items() if n.endswith('D2Ev')]
    d0 = [v for n, v in cd.items() if n.endswith('D0Ev')]
    assert c1 and c1 == c2 and d1 and d1 == d2 and len(d0) == 1, 'C1/C2 or D1/D2 are not aliases'
    ctor_sym, dtor_sym = _func_name(s, 'ctor'), _func_name(s, 'dtor')
    assert s.syms[ctor_sym] == c2[0] and s.syms[dtor_sym] == d2[0]
    # D0 deletes through D1/D2 (call to the shared body) without inlining it
    d0f = [i for n, v in cd.items() if n.endswith('D0Ev') for i in s.dis(v, s.sizes[n])]
    calls = [i.operands[-1].imm for i in d0f if i.mnemonic == 'bl']
    resolved_calls = [s.syms.get(s.plt_stub_name(c), c) for c in calls]
    assert resolved_calls == [d2[0]], 'D0 does not call the patched D2 exactly once: %s' % [hex(c) for c in calls]
    # every direct reference (bl/b through the PLT or directly, and data relocations) to the ctor/dtor entry
    stubs = {}
    s.plt_stub_name(0)
    for a, nm in s._plt.items():
        for canonical in (ctor_sym, dtor_sym):
            if s.syms.get(nm) == s.syms[canonical]:
                stubs.setdefault(canonical, []).append(a)
    refs = {'ctor': [], 'dtor': []}
    text = s.elf.get_section_by_name('.text')
    allins = []
    pos = 0
    code = s.read(text['sh_addr'], text['sh_size'])
    while pos < len(code):
        got = list(s.cs.disasm(code[pos:], text['sh_addr'] + pos))
        if not got:
            pos += 4
            continue
        allins += got
        pos = got[-1].address + 4 - text['sh_addr']
    for i in allins:
        if i.mnemonic in ('bl', 'b'):
            t = i.operands[-1].imm
            if t == s.syms[ctor_sym] or t in stubs.get(ctor_sym, []):
                refs['ctor'].append(i.address)
            if t == s.syms[dtor_sym] or t in stubs.get(dtor_sym, []):
                refs['dtor'].append(i.address)
    def owner(va):
        best = max(((v, n) for n, v in s.syms.items() if v <= va and s.sizes.get(n, 0) and va < v + s.sizes[n]), default=(0, '?'))
        return best[1]
    ctor_owners = sorted({owner(a)[:40] for a in refs['ctor']})
    dtor_owners = sorted({owner(a)[:40] for a in refs['dtor']})
    assert ctor_owners == ['_ZN12QSVLClientXRC2ER10XRQContextR1'] or all('QSVLClientXRC' in o for o in ctor_owners), ctor_owners
    # the only direct caller of the renderer destructor body must be D0 (plus SVLRoot::D2 through the vtable)
    assert dtor_owners == [owner(d0f[0].address)[:40]], dtor_owners
    ev['alias'] = dict(ctor_callers=[hex(a) for a in refs['ctor']], dtor_callers=[hex(a) for a in refs['dtor']],
                       c1=hex(c1[0]), d1=hex(d1[0]), d0_calls=[hex(c) for c in calls])
    return ev
