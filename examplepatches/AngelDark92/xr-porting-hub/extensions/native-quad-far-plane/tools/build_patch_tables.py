"""Assemble the scene-side thunks for the one far-plane target and emit the byte-exact patch plan.

  python -B -I tools/build_patch_tables.py <outdir>

The plan lists replacement sites as (address, original bytes, patched bytes). The original bytes
are read from the exact decoded 5001712 library; the patched bytes come from clang/lld output
linked at that base's own addresses. Nothing here borrows another base's addresses.
"""
import json
import os
import re
import struct
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from scene_lib import Scene  # noqa: E402
import nq_sites  # noqa: E402

NDK = os.environ.get('NDK', 'F:/Runtimes/AndroidSdk/ndk/28.2.13676358')
BIN = NDK + '/toolchains/llvm/prebuilt/windows-x86_64/bin'
CLANG = BIN + '/clang.exe'
LLD = BIN + '/ld.lld.exe'

# ---- far-plane target hook sites (offsets from the exact function start) ------------------------
SPEC_2PROJ = dict(
    name='2proj', ref=5001712, bases=(5001712,),
    SV=0x19A0, NEXT_BASE=0x19F8, NEXT_FOVEA=0x1A10, FLIP_CACHE_OFF=0x1A28,
    forbidden=((0x1818, 0x1998), (0x1998, 0x19A0), (0x19B0, 0x19F8)),
    ctor_hook=None, dtor_hook=0x2C,
    init_region=(0x20, 0xB8),
    setup_cpvl=dict(base=0xF0, fovea=0x160),
    flip_eye=(0x59C, 0x7C0), eye_reg='w26', cache_reg='x22',
    flip_pose=(0x8A8, 0x904, 0x960, 0x9BC),
    fov_calls=(0x63C, 0x718),
    e2h_site=0x1F8, e2h_ret=0x220,
    init_cont_imm=0x1E0, quads_family_order=('base', 'fovea'),
)
SPECS = {5001712: SPEC_2PROJ}


def run(cmd):
    r = subprocess.run(cmd, capture_output=True, text=True)
    if r.returncode != 0:
        raise RuntimeError('%s\n%s%s' % (' '.join(cmd), r.stdout, r.stderr))
    return r


def branch_target(scene, va):
    ins = scene.dis(va, 4)[0]
    assert ins.mnemonic in ('bl', 'b'), (hex(va), ins.mnemonic, ins.op_str)
    return ins.operands[0].imm


def find_ctor_hook(scene, ctor, size):
    """The ctor's single normal-return path ends `... ; ldr xN,[x26,#0x28] ; ldur x9,[x29,#-8] ; cmp ; b.ne ; ... ; ret`.
    Return the address of that ldr after proving it is the one immediately before the only reachable ret."""
    ins = scene.dis(ctor, size)
    idx = [i for i, x in enumerate(ins) if x.mnemonic == 'ldr' and x.op_str.endswith('[x26, #0x28]')]
    assert len(idx) == 2, idx           # prologue canary load + epilogue canary check
    k = idx[1]
    assert ins[k + 1].mnemonic == 'ldur' and ins[k + 1].op_str.endswith('[x29, #-8]')
    assert ins[k + 2].mnemonic == 'cmp' and ins[k + 3].mnemonic == 'b.ne'
    j = k + 4
    while ins[j].mnemonic in ('ldp', 'ldr', 'add'):
        j += 1
    assert ins[j].mnemonic == 'ret' and j - k <= 12, (ins[j].mnemonic, j - k)
    return ins[k].address


POSE_FIRST = 's4, s17, [x0, #0x14]'


def discover_flip(s, flip, size, eye_reg, cache_reg):
    """Locate the per-eye block, the FOV helper calls and the pose-helper call sites by instruction
    patterns (used for bases whose FlipFrame is shifted relative to the family reference)."""
    ins = s.dis(flip, size)
    wide = eye_reg.replace('w', 'x')
    starts = [i for i, x in enumerate(ins) if x.mnemonic == 'add' and x.op_str == 'x27, x20, %s, lsl #6' % wide]
    assert len(starts) == 1, starts
    a = starts[0]
    e = [i for i in range(a, len(ins) - 1) if ins[i].mnemonic == 'ldr' and ins[i].op_str in ('x8, [x22]', 'x8, [x28]')
         and ins[i + 1].mnemonic == 'str' and ins[i + 1].op_str.startswith('x8, [x2')]
    assert e, 'per-eye block end'
    b = e[0]
    internal = [x for x in ins[a:b] if x.mnemonic == 'bl' and not s.plt_stub_name(x.operands[0].imm)]
    targets = {x.operands[0].imm for x in internal}
    assert len(targets) == 1 and len(internal) in (2, 3), (len(internal), targets)
    fov_calls = [x.address - flip for x in internal]
    poses = []
    for x in ins:
        if x.mnemonic == 'bl' and s.dis(x.operands[0].imm, 4)[0].op_str == POSE_FIRST:
            poses.append(x.address - flip)
    return (ins[a].address - flip, ins[b].address - flip), tuple(fov_calls), tuple(poses)


def derive(scene, spec):
    """Resolve every address/constant for this exact base; assert each against the library bytes."""
    s = scene
    spec = dict(spec)
    if spec['flip_eye'] is None:
        fs, fz = nq_sites.func_range(s, 'flip')
        spec['flip_eye'], spec['fov_calls'], spec['flip_pose'] = discover_flip(s, fs, fz, spec['eye_reg'], spec['cache_reg'])
    ctor, ctor_size = nq_sites.func_range(s, 'ctor')
    dtor, _ = nq_sites.func_range(s, 'dtor')
    init, _ = nq_sites.func_range(s, 'init')
    setup, _ = nq_sites.func_range(s, 'setup')
    flip, _ = nq_sites.func_range(s, 'flip')
    e2h, e2h_size = nq_sites.func_range(s, 'e2h')
    gl, gl_size = nq_sites.func_range(s, 'gl')
    d = dict(base=s.code, family=spec['name'], sha256=s.sha, size=len(s.data))
    d['ctor_hook'] = find_ctor_hook(s, ctor, ctor_size) if spec['ctor_hook'] is None else ctor + spec['ctor_hook']
    d['dtor_hook'] = dtor + spec['dtor_hook']
    d['gl'] = (gl, gl_size)
    d['init_region'] = (init + spec['init_region'][0], init + spec['init_region'][1])
    d['setup_cpvl'] = {k: setup + v for k, v in spec['setup_cpvl'].items()}
    d['flip_eye'] = (flip + spec['flip_eye'][0], flip + spec['flip_eye'][1])
    d['flip_pose'] = [flip + v for v in spec['flip_pose']]
    d['e2h_site'] = e2h + spec['e2h_site']
    d['e2h_ret'] = e2h + spec['e2h_ret']
    ins = s.dis
    c = ins(d['ctor_hook'], 4)[0]
    assert c.mnemonic == 'ldr' and c.op_str.endswith('[x26, #0x28]'), (c.mnemonic, c.op_str)
    d['ctor_orig_word'] = s.word(d['ctor_hook'])
    # the constructor must hold the renderer in x19 for the whole body (never reassigned after `mov x19,x0`)
    cins = ins(ctor, ctor_size)
    movs = [i for i in cins if i.mnemonic == 'mov' and i.op_str.startswith('x19, x0')]
    writes = [i for i in cins if i.op_str.split(',')[0] == 'x19' and i.mnemonic not in ('str', 'stp', 'cmp', 'cbz', 'cbnz')
              and not i.mnemonic.startswith('st')]
    assert len(movs) == 1 and all(w.address == movs[0].address for w in writes), [(hex(w.address), w.mnemonic, w.op_str) for w in writes]
    c = ins(d['dtor_hook'], 4)[0]
    assert c.mnemonic == 'ldr' and c.op_str == 'x0, [x19, #0x10]', (c.mnemonic, c.op_str)
    d['dtor_orig_word'] = s.word(d['dtor_hook'])
    # Init
    mrs = ins(d['init_region'][0] - 4, 4)[0]
    assert mrs.mnemonic == 'mrs' and mrs.op_str.startswith('x23'), (mrs.mnemonic, mrs.op_str)
    cont = ins(d['init_region'][1], 4)[0]
    # the continuation is the `operator new(sizeof(QSVLCodecNDK))` that follows the removed header writes
    assert cont.mnemonic == 'mov' and re.fullmatch(r'w0, #0x1e[08]', cont.op_str), (cont.mnemonic, cont.op_str)
    nxt = ins(d['init_region'][1] + 4, 4)[0]
    assert nxt.mnemonic == 'bl' and s.plt_stub_name(nxt.operands[0].imm) == '_Znwm', (nxt.mnemonic, nxt.op_str)
    region = ins(d['init_region'][0], d['init_region'][1] - d['init_region'][0])
    gets = [i for i in region if i.mnemonic == 'bl' and s.plt_stub_name(i.operands[0].imm) and
            'XRQGetReferenceSpace' in s.plt_stub_name(i.operands[0].imm)]
    assert len(gets) == len(spec['quads_family_order']), len(gets)
    # only the four prologue words that survive may be read after the region: x19=ctx, x21=this, canary slot
    assert any(i.mnemonic == 'ldr' and i.op_str == 'w1, [x1, #0xd8]' for i in region), 'ctx reference-space type load'
    d['ctx_type_off'] = 0xD8
    # Setup: CreateProjectionViewLayer calls
    cpvl = nq_sites.plt_addr(s, 'XRQCreateProjectionViewLayer')
    # The helper reads the swapchain handle (+0) and extent (+0x70) itself instead of calling the legacy
    # XRQCreateProjectionViewLayer: prove that function does nothing else with the swapchain (no calls,
    # rect offset and array index are zero) on this exact base.
    cp_name, cp_va = s.find_one('XRQCreateProjectionViewLayer')
    cp_ops = ['%s %s' % (i.mnemonic, i.op_str) for i in s.dis(cp_va, s.sizes[cp_name])]
    for need in ('ldr x9, [x1]', 'ldr d1, [x1, #0x70]', 'stp x9, xzr, [x2, #0x40]', 'str d1, [x2, #0x50]',
                 'str xzr, [x2, #0x58]', 'mov w8, #0x30', 'str w8, [x2]'):
        assert need in cp_ops, (need, cp_ops)
    assert not any(o.startswith(('bl ', 'blr ', 'b ')) for o in cp_ops), cp_ops
    assert sum(1 for o in cp_ops if 'x1' in o and o.startswith(('ldr', 'ldp', 'ldur'))) == 2, cp_ops
    d['cpvl_semantics'] = 'handle=[sc+0] extent=[sc+0x70] offset=0 array=0'
    for k, va in d['setup_cpvl'].items():
        assert branch_target(s, va) == cpvl, (k, hex(va))
        if k != 'under':
            a, b = ins(va - 8, 8)
            assert a.mnemonic == 'madd' and b.mnemonic == 'add' and b.op_str.startswith('x2, x8,'), (a.op_str, b.op_str)
            ctxreg = ins(va - 16, 8)
            assert ctxreg[0].op_str == 'x0, x20' and ctxreg[1].op_str == 'x1, x28', [(i.mnemonic, i.op_str) for i in ctxreg]
            madd_ops = [p.strip() for p in ins(va - 8, 4)[0].op_str.split(',')]
            assert ins(va - 8, 4)[0].mnemonic == 'madd' and madd_ops[3] == 'x19', madd_ops
            d.setdefault('setup_eye', {})[k] = madd_ops[1]       # the eye index register is read from the madd itself
    if 'under' in d['setup_cpvl']:
        # Keep the loop's eye index and saved loop condition, then jump directly to the
        # base family. Derive and validate this range on EACH exact library, not just the ref.
        lo, hi = d['setup_cpvl']['under'] - 0x64, d['setup_cpvl']['under'] + 4
        assert ins(lo, 4)[0].op_str == 'x28, x9, x25'
        assert ins(lo - 4, 4)[0].op_str == 'w27, w8'
        assert ins(hi, 4)[0].op_str == 'x8, x23, x24, x19'
        calls = [s.plt_stub_name(i.operands[0].imm) for i in ins(lo, hi - lo) if i.mnemonic == 'bl']
        assert calls == ['xrDestroySwapchain', '_Z18XRQCreateSwapchainRK10XRQContextRK16XRQSwapchainInfoR12XRQSwapchain',
                         '_Z28XRQCreateProjectionViewLayerRK10XRQContextRK12XRQSwapchainR32XrCompositionLayerProjectionView'], calls
        d['setup_under'] = (lo, hi)
    # Flip
    poses = {branch_target(s, va) for va in d['flip_pose']}
    assert len(poses) == 1, poses
    d['pose_helper'] = poses.pop()
    d['pose_helper_size'] = 0x16C
    ph = s.dis(d['pose_helper'], d['pose_helper_size'])
    assert ph[0].mnemonic == 'ldp' and ph[0].op_str == 's4, s17, [x0, #0x14]' and ph[-1].mnemonic == 'ret'
    assert ph[-1].address + 4 == d['pose_helper'] + d['pose_helper_size']
    if 'under' in d['setup_cpvl']:
        # Each unused underside image is acquired, given a projection pose, and released
        # without any draw. Remove the entire RAII scope, including its constructor/dtor.
        d['flip_under'] = []
        for index, off in ((0, 0x1638), (3, 0x16b0)):
            pose = d['flip_pose'][index]
            lo, hi = pose - 0x1c, pose + 0xc
            body = ins(lo, hi - lo)
            assert body[0].mnemonic == 'mov' and body[0].op_str == 'w8, #0x%x' % off
            assert body[1].op_str == 'x1, x19, x8'
            assert branch_target(s, lo + 0xc) == nq_sites.plt_addr(s, '_ZN28XRQAcquireSwapchainImageRAIIC1ERK12XRQSwapchain')
            assert branch_target(s, hi - 4) == nq_sites.plt_addr(s, '_ZN28XRQAcquireSwapchainImageRAIID1Ev')
            assert body[-2].op_str == 'x0, sp, #0x50'
            d['flip_under'].append((lo, hi))
    last = ins(d['flip_pose'][-1] - 12, 12)
    assert last[0].op_str.startswith('w8, #') and last[1].op_str == 'x0, x20' and last[2].mnemonic == 'add', [(i.mnemonic, i.op_str) for i in last]
    fovs = [branch_target(s, flip + o) for o in spec['fov_calls']]
    assert len(set(fovs)) == 1, fovs
    d['fov_fn'] = fovs[0]
    cont = ins(d['flip_eye'][1], 4)[0]
    assert cont.mnemonic == 'ldr' and cont.op_str in ('x8, [x22]', 'x8, [x28]'), (cont.mnemonic, cont.op_str)
    first = ins(d['flip_eye'][0], 4)[0]
    assert first.mnemonic == 'add' and re.fullmatch(r'x27, x20, x2[16], lsl #6', first.op_str), first.op_str
    assert first.op_str.split(',')[2].strip().replace('x', 'w') == spec['eye_reg']
    # the per-eye block is straight-line + the loop head's x8: confirm x8 = x19 + eye*8 right before the block
    pre = [i for i in ins(d['flip_eye'][0] - 0x80, 0x80) if i.mnemonic == 'add' and i.op_str.startswith('x8, x19, x10')]
    assert pre, 'x8 = renderer + eye*8 before the block'
    # The size-cache compare before the per-eye loop reads the old view extent cache (abandoned storage).
    fins = ins(flip, nq_sites.func_range(s, 'flip')[1])
    lo_hi = spec['forbidden']
    cands = []
    for k, x in enumerate(fins):
        m = re.fullmatch(r'w8, \[x19, #(0x[0-9a-f]+)\]', x.op_str) if x.mnemonic == 'ldr' else None
        if not m:
            continue
        off = int(m.group(1), 16)
        if not any(lo <= off < hi for lo, hi in lo_hi):
            continue
        for y in fins[k + 1:k + 4]:
            if y.mnemonic == 'ldr' and y.op_str == 'w9, [x19, #0x%x]' % (off + 4):
                nxt = fins[k + 1:k + 12]
                assert any(z.mnemonic == 'cmp' and z.op_str == 'w8, w24' for z in nxt), 'compare with current width'
                assert any(z.mnemonic == 'cmp' and z.op_str == 'w9, w23' for z in nxt), 'compare with current height'
                cands.append((x.address, y.address))
    assert len(cands) == 1, cands
    d['dim_w'], d['dim_h'] = cands[0]
    # E2H
    b = s.dis(d['e2h_site'], 4)[0]
    assert b.mnemonic == 'b' and b.operands[0].imm == d['e2h_ret'], (b.mnemonic, b.op_str)
    gsl_name, gsl = s.find_one('GetStreamProjectionLayers')
    g0 = s.dis(gsl, 4)[0]
    assert g0.mnemonic == 'ldr' and g0.op_str == 'x0, [x0, #0x138]', g0.op_str
    pro = [i for i in s.dis(e2h, 0x30) if i.mnemonic == 'mov' and i.op_str == 'x20, x0']
    assert pro, 'client kept in x20'
    d['plt'] = dict(
        dlsym=nq_sites.plt_addr(s, 'dlsym'), log=nq_sites.plt_addr(s, '__android_log_print'),
        cpvl=cpvl, refspace=nq_sites.plt_addr(s, 'XRQGetReferenceSpace'),
        new=nq_sites.plt_addr(s, '_Znwm'), delete=nq_sites.plt_addr(s, '_ZdlPv'),
        throwlen=nq_sites.plt_addr(s, '__vector_base_commonILb1EE20__throw_length_error'))
    return d


def sites_asm(d):
    """Small in-place edits as named sections: (name, address, asm text)."""
    out = [('s_ctor', d['ctor_hook'], 'bl t_ctor'), ('s_dtor', d['dtor_hook'], 'bl t_dtor')]
    def skip_region(name, bounds):
        lo, hi = bounds
        # Overwrite dead code too: no stale projection/underside calls remain in the image.
        out.append((name, lo, 'b .+%d\n.fill %d,4,0xd503201f' % (hi - lo, (hi - lo) // 4 - 1)))
    if 'setup_under' in d:
        lo, hi = d['setup_under']
        # Keep the unreachable format immediates/context: OLED precision owns those
        # bytes and validates them even for the removed family, in either patch order.
        out.append(('s_setup_under', lo, 'b .+%d' % (hi - lo)))
        out.append(('s_setup_under_view', d['setup_cpvl']['under'], 'nop'))
        for n, bounds in enumerate(d['flip_under']):
            skip_region('s_flip_under%d' % n, bounds)
    for fam in ('base', 'fovea'):
        out.append(('s_setup_' + fam, d['setup_cpvl'][fam] - 8, 'mov x2, %s\nnop\nbl t_setup_%s' % (d['setup_eye'][fam], fam)))
    for n, va in enumerate(d['flip_pose'][:-1]):
        if not any(lo <= va < hi for lo, hi in d.get('flip_under', [])):
            out.append(('s_pose_nop%d' % n, va, 'nop'))
    out.append(('s_pose_frame', d['flip_pose'][-1], 'bl t_frame'))
    out.append(('s_e2h', d['e2h_site'], 'b t_e2h'))
    out.append(('s_dim_w', d['dim_w'], 'bl t_dim_w'))
    out.append(('s_dim_h', d['dim_h'], 'bl t_dim_h'))
    return out


def build(d, spec, work):
    os.makedirs(work, exist_ok=True)
    defs = [
        '-DSV=%d' % spec['SV'], '-DNEXT_BASE=%d' % spec['NEXT_BASE'], '-DNEXT_FOVEA=%d' % spec['NEXT_FOVEA'],
        '-DCTX_TYPE_OFF=%d' % d['ctx_type_off'], '-DCTOR_ORIG_WORD=%d' % d['ctor_orig_word'],
        '-DDTOR_ORIG_WORD=%d' % d['dtor_orig_word'], '-DFLIP_CACHE_OFF=%d' % spec['FLIP_CACHE_OFF'],
        '-DEYE_W=%s' % spec['eye_reg'], '-DCACHE_REG=%s' % spec['cache_reg'],
        '-DPEND_W0=%d' % 0x2D0, '-DPEND_H0=%d' % 0x2D8,
    ]
    cc = [CLANG, '--target=aarch64-linux-android29', '-c', '-x', 'assembler-with-cpp', '-mno-relax']
    run(cc + defs + [os.path.join(HERE, '..', 'asm', 'thunks.S'), '-o', os.path.join(work, 'thunks.o')])
    sites = sites_asm(d)
    with open(os.path.join(work, 'sites.S'), 'w', newline='\n') as f:
        f.write('.arch armv8-a\n')
        for name, _, text in sites:
            f.write('.section .%s,"ax"\n%s\n' % (name, text))
    run(cc + [os.path.join(work, 'sites.S'), '-o', os.path.join(work, 'sites.o')])
    placement = [('regionA', d['gl'][0]), ('regionB', d['pose_helper']), ('p_init', d['init_region'][0]),
                 ('p_flip_eye', d['flip_eye'][0])] + [(n, a) for n, a, _ in sites]
    with open(os.path.join(work, 'link.ld'), 'w', newline='\n') as f:
        f.write('SECTIONS {\n')
        for n, a in sorted(placement, key=lambda t: t[1]):
            f.write('  .%s 0x%x : { *(.%s) }\n' % (n, a, n))
        f.write('}\n')
    p = d['plt']
    syms = dict(dlsym_plt=p['dlsym'], log_plt=p['log'], cpvl_plt=p['cpvl'], refspace_plt=p['refspace'],
                new_plt=p['new'], delete_plt=p['delete'], throwlen_plt=p['throwlen'], fov_fn=d['fov_fn'],
                e2h_ret=d['e2h_ret'], init_ret=d['init_region'][1], flip_eye_ret=d['flip_eye'][1])
    link = [LLD, '-T', os.path.join(work, 'link.ld'), '-e', '0', '--no-rosegment', '-z', 'norelro', '--build-id=none',
            '-o', os.path.join(work, 'out.elf'), os.path.join(work, 'thunks.o'), os.path.join(work, 'sites.o')]
    for k, v in syms.items():
        link += ['--defsym', '%s=0x%x' % (k, v)]
    run(link)
    from elftools.elf.elffile import ELFFile
    blobs = {}
    with open(os.path.join(work, 'out.elf'), 'rb') as f:
        elf = ELFFile(f)
        names = {n for n, _ in placement}
        for sec in elf.iter_sections():
            if sec.name.startswith('.') and sec['sh_addr'] and sec.name[1:] in names:
                blobs[sec.name[1:]] = (sec['sh_addr'], sec.data())
        symtab = elf.get_section_by_name('.symtab')
        labels = {s.name: s['st_value'] for s in symtab.iter_symbols() if s.name}
    return blobs, labels


def plan_for(scene, spec, work):
    d = derive(scene, spec)
    blobs, labels = build(d, spec, work)
    import static_checks
    spec_checked = dict(spec)
    d['static_evidence'] = static_checks.check_all(scene, d, spec_checked, blobs, scene.cs, labels)
    patches = []
    for name, (addr, data) in sorted(blobs.items(), key=lambda kv: kv[1][0]):
        assert scene.va2off(addr) == addr, '%s needs explicit virtual/file offset translation' % name
        patches.append(dict(name=name, address=addr, length=len(data), patched=data.hex(),
                            original=scene.read(addr, len(data)).hex()))
    limits = dict(regionA=d['gl'][1], regionB=d['pose_helper_size'], p_init=d['init_region'][1] - d['init_region'][0],
                  p_flip_eye=d['flip_eye'][1] - d['flip_eye'][0])
    for name, (addr, data) in blobs.items():
        if name in limits:
            assert len(data) <= limits[name], (name, len(data), limits[name])
    # no two patched ranges may overlap
    spans = sorted((p['address'], p['address'] + p['length'], p['name']) for p in patches)
    for a, b in zip(spans, spans[1:]):
        assert a[1] <= b[0], ('overlap', a, b)
    return d, patches, labels


if __name__ == '__main__':
    if len(sys.argv) != 2:
        raise SystemExit('usage: build_patch_tables.py <outdir> (single target: 5001712)')
    out = sys.argv[1]
    code = 5001712
    os.makedirs(out, exist_ok=True)
    spec = SPECS[code]
    sc = Scene(code)
    d, patches, labels = plan_for(sc, spec, os.path.join(out, str(code)))
    sizes = {p['name']: p['length'] for p in patches}
    print(code, spec['name'], 'sites', len(patches), 'regionA', sizes['regionA'], '/', d['gl'][1],
          'regionB', sizes['regionB'], '/', d['pose_helper_size'])
    with open(os.path.join(out, '%d.json' % code), 'w', newline='\n') as f:
        json.dump(dict(derived=d, patches=patches, labels=labels, spec={k: v for k, v in spec.items()}), f,
                  indent=1, default=str)
