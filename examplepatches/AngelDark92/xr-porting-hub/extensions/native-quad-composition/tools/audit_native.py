"""Static escape/access audit of the native quad patch on each exact base (patched image = stock + plan).

  python -B -I tools/audit_native.py <plan dir> [base ...]

For every base it reports and ASSERTS:
  A. no remaining branch, address-forming adrp/add, literal load or data pointer into the old pose-helper body
     (region B) except the intended calls to the new thunks living there;
  B. no remaining reference into the old GetProjectionLayers body except its exported entry (PLT callers);
  C. zero remaining renderer calls to XRQCreateProjectionViewLayer (unrelated scene/UI users remain);
  D. every instruction that touches the abandoned old-projection storage or the owned state slot
     ([SV, SV+16)) is accounted for: it lies inside a replaced region, is an owned hook, or is a plain
     constructor zero-store that runs before the load hook. Anything else is printed and fails the audit.
"""
import json
import os
import re
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from scene_lib import Scene  # noqa: E402
import nq_sites  # noqa: E402


def patched_scene(code, plan):
    sc = Scene(code)
    data = bytearray(sc.data)
    for p in plan['patches']:
        off = sc.va2off(p['address'])
        assert data[off:off + p['length']] == bytes.fromhex(p['original'])
        data[off:off + p['length']] = bytes.fromhex(p['patched'])
    ps = Scene(code)
    ps.data = bytes(data)
    import io
    from elftools.elf.elffile import ELFFile
    ps.elf = ELFFile(io.BytesIO(ps.data))
    ps._plt = None
    return sc, ps


def text_range(s):
    t = s.elf.get_section_by_name('.text')
    return t['sh_addr'], t['sh_size']


def all_ins(s):
    """Every decodable instruction of .text. capstone stops at the first undecodable word, so resume after it:
    a scan that silently ends early would make the audit meaningless."""
    a, n = text_range(s)
    code = s.read(a, n)
    out = []
    pos = 0
    while pos < n:
        got = list(s.cs.disasm(code[pos:], a + pos))
        out.extend(got)
        if not got:
            pos += 4
        else:
            pos = got[-1].address + 4 - a
    return out


def enclosing(s, va, funcs):
    best = None
    for n, v in funcs:
        if v <= va and (best is None or v > best[1]):
            best = (n, v)
    return best[0][:60] if best else '?'


def main():
    plan_dir = sys.argv[1]
    bases = [int(x) for x in sys.argv[2:]] or [5001712, 5001812, 5001968, 5002244, 5002363, 5002395]
    ok = True
    for code in bases:
        plan = json.load(open(os.path.join(plan_dir, '%d.json' % code)))
        d, spec = plan['derived'], plan['spec']
        sc, ps = patched_scene(code, plan)
        ins = all_ins(ps)
        sv = spec['SV']
        problems = []
        # ---- A/B/C: control-flow and address references
        pb_lo, pb_hi = d['pose_helper'], d['pose_helper'] + d['pose_helper_size']
        gl_lo, gl_hi = d['gl']
        gl_hi = gl_lo + gl_hi
        cpvl_stub = nq_sites.plt_addr(sc, 'XRQCreateProjectionViewLayer')
        labels = plan['labels']
        intended_b = {labels['t_setup_base'], labels['t_setup_fovea'], labels['t_frame'], labels['t_dim_w'],
                      labels['t_dim_h']}
        intended_a = {labels['t_ctor'], labels['t_dtor'], labels['t_e2h']}
        refs_b, refs_gl, cpvl_calls = [], [], []
        pend = {}
        for i in ins:
            tgt = None
            if i.mnemonic in ('bl', 'b') or i.mnemonic.startswith('b.') or i.mnemonic in ('cbz', 'cbnz', 'tbz', 'tbnz'):
                tgt = i.operands[-1].imm
            elif i.mnemonic == 'adrp':
                pend[i.operands[0].reg] = i.operands[1].imm
            elif i.mnemonic == 'add' and len(i.operands) == 3 and i.operands[2].type == 2 and i.operands[1].reg in pend:
                tgt = pend[i.operands[1].reg] + i.operands[2].imm
            elif i.mnemonic == 'adr':
                tgt = i.operands[1].imm
            if tgt is None:
                continue
            if pb_lo <= tgt < pb_hi and not (pb_lo <= i.address < pb_hi):
                refs_b.append((i.address, tgt))
            if gl_lo <= tgt < gl_hi and not (gl_lo <= i.address < gl_hi):
                refs_gl.append((i.address, tgt))
            if tgt == cpvl_stub:
                cpvl_calls.append(i.address)
        refs_gl = [(a, t) for a, t in refs_gl if t not in intended_a]       # the ctor/dtor/E2H hooks live in region A
        bad_b = [(hex(a), hex(t)) for a, t in refs_b if t not in intended_b]
        func_list = sorted(((n, v) for n, v in sc.syms.items()), key=lambda t: t[1])
        # calls to the legacy view builder must be gone from the renderer; other callers are other features
        renderer_cpvl = [a for a in cpvl_calls if 'QSVLRendererXR' in enclosing(sc, a, func_list)]
        other_cpvl = {hex(a): enclosing(sc, a, func_list) for a in cpvl_calls if a not in renderer_cpvl}
        cpvl_calls = renderer_cpvl
        if bad_b:
            problems.append('reference into old pose helper: %s' % bad_b)
        # data pointers (relocations and raw words in data segments) into the replaced bodies
        for sec in ps.elf.iter_sections():
            if sec.name in ('.data.rel.ro', '.data', '.init_array', '.fini_array', '.got', '.got.plt'):
                words = struct.iter_unpack('<Q', sec.data()[:len(sec.data()) // 8 * 8])
                for k, (w,) in enumerate(words):
                    if pb_lo <= w < pb_hi or gl_lo < w < gl_hi:
                        problems.append('data word in %s at %#x -> %#x' % (sec.name, sec['sh_addr'] + 8 * k, w))
        for sec in ps.elf.iter_sections():
            if sec.name.startswith('.rela'):
                for r in sec.iter_relocations():
                    ad = r['r_addend'] if 'r_addend' in r.entry else 0
                    if r['r_info_type'] == 1027 and (pb_lo <= ad < pb_hi or gl_lo < ad < gl_hi):
                        problems.append('relative reloc -> %#x' % ad)
        gl_bad = [(hex(a), hex(t)) for a, t in refs_gl if t != gl_lo]
        if gl_bad:
            problems.append('reference into old GetProjectionLayers body: %s' % gl_bad)
        if cpvl_calls:
            problems.append('XRQCreateProjectionViewLayer still called at %s' % [hex(x) for x in cpvl_calls])
        # exported GetProjectionLayers is reached only through PLT stubs: list callers of its PLT stub
        gl_stub = nq_sites.plt_addr(ps, 'GetProjectionLayers')
        gl_callers = [hex(i.address) for i in ins if i.mnemonic in ('bl', 'b') and i.operands[-1].imm == gl_stub]
        # ---- D: storage accesses
        replaced = [(d['init_region'][0], d['init_region'][1]), tuple(d['flip_eye']), (gl_lo, gl_hi),
                    (pb_lo, pb_hi)]
        funcs = sorted(((n, v) for n, v in sc.syms.items()), key=lambda t: t[1])
        ctor, ctor_size = nq_sites.func_range(sc, 'ctor')
        dtor, dtor_size = nq_sites.func_range(sc, 'dtor')
        e2h, e2h_size = nq_sites.func_range(sc, 'e2h')
        lo_ranges = [(lo, hi) for lo, hi in spec['forbidden']]
        slot = (sv, sv + 16)
        ranges = list(spec["forbidden"])
        accounted = [(d["init_region"][0], d["init_region"][1]), tuple(d["flip_eye"]), (gl_lo, gl_hi), (pb_lo, pb_hi)] + [(p["address"] - 0x20, p["address"] + p["length"] + 4) for p in plan["patches"] if p["name"].startswith(("s_setup", "s_pose", "s_dim", "s_ctor", "s_dtor", "s_e2h"))]
        ctor, ctor_size = nq_sites.func_range(sc, "ctor")
        import storage_audit
        hits, unexplained = storage_audit.audit_storage(ps, ins, ranges, (sv, sv + 16), accounted, (ctor, ctor + ctor_size), d["ctor_hook"])
        acc = hits
        from collections import Counter
        kinds = Counter(h[-1] for h in hits)
        late = [h for h in hits if ctor <= h[0] < ctor + ctor_size and h[0] > d["ctor_hook"]]
        if late:
            problems.append("constructor touches owned storage after the load hook: %s" % late)
        print("base %d: regionB refs outside %s | GL-body refs outside %s | renderer cpvl calls %d (other XRQ users: %s) | GL callers %s | storage hits %d %s" % (code, sorted({hex(t) for _, t in refs_b}), gl_bad, len(cpvl_calls), other_cpvl, gl_callers, len(hits), dict(kinds)))
        for h in hits:
            if h[-1] in ("FOREIGN", "FOREIGN-R138", "RENDERER", "UNKNOWN"):
                print("    %-12s %#x %s %s origin=%s off=%s in %s" % (h[-1], h[0], h[1], h[2], h[3], h[4] if h[4] is None else hex(h[4]), h[5][:60]))
        for u in unexplained:
            print("    UNEXPLAINED", hex(u[0]), u[1], u[2], u[-1])
        if unexplained:
            problems.append("%d unexplained storage accesses" % len(unexplained))
        for p in problems:
            print('    PROBLEM', p)
        ok &= not problems
    sys.exit(0 if ok else 1)


main()
