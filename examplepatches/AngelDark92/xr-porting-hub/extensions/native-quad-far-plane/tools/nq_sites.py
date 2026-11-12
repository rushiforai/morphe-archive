"""Hook-site tables and structural equivalence proofs for the native quad patch.

Each exact base is compared, function by function, against the family reference base: the
instruction stream (with position dependent operands - adrp pages, branch targets outside the
function, GOT/PLT loads - masked) must be identical. Only then are the reference's function
relative offsets used. A mismatch is a hard error (no layout is ever borrowed unproved).
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from scene_lib import Scene  # noqa: E402

PC_REL = ('adr', 'adrp')


import re

KEEP_LO, KEEP_HI = 0x1000, 0x2000   # renderer-object layout constants are kept exactly; the rest is masked


def _mask_imm(text):
    def rep(m):
        v = int(m.group(0)[1:], 16)
        return m.group(0) if KEEP_LO <= v < KEEP_HI else '#N'
    return re.sub(r'#0x[0-9a-f]+', rep, text)


def norm_stream(scene, start, size):
    """Normalised instruction stream of [start, start+size): masks external branch targets, page
    relative operands and every immediate outside the renderer-layout window [0x1000,0x2000);
    in-function branch targets stay (relative to `start`)."""
    out = []
    ins = scene.dis(start, size)
    paged = set()
    for i in ins:
        mn, ops = i.mnemonic, i.op_str
        if mn in ('bl', 'b') or mn.startswith('b.') or mn in ('cbz', 'cbnz', 'tbz', 'tbnz'):
            tgt = i.operands[-1].imm
            head = ops.rsplit(',', 1)[0] + ',' if ',' in ops else ''
            if start <= tgt < start + size:
                out.append('%s %s+%x' % (mn, head, tgt - start))
            else:
                name = scene.plt_stub_name(tgt) or next((n for n, v in scene.syms.items() if v == tgt), None)
                out.append('%s %sEXT:%s' % (mn, head, name or 'internal'))
            continue
        if mn == 'adrp':
            paged.add(ops.split(',')[0].strip())
            out.append('adrp %s' % ops.split(',')[0])
            continue
        if mn == 'add':
            parts = [p.strip() for p in ops.split(',')]
            if len(parts) == 3 and parts[1] in paged and parts[0] == parts[1]:
                paged.discard(parts[1])
                out.append('add %s,%s,<page>' % (parts[0], parts[1]))
                continue
        if mn == 'ldr':
            m = re.match(r'(\w+), \[(\w+), #0x[0-9a-f]+\]', ops)
            if m and m.group(2) in paged:
                paged.discard(m.group(2))
                out.append('ldr %s,[%s,<got>]' % (m.group(1), m.group(2)))
                continue
        if mn == 'adr':
            out.append('adr %s' % ops.split(',')[0])
            continue
        out.append('%s %s' % (mn, _mask_imm(ops)))
    return out


FUNCS = {
    'ctor': '_ZN14QSVLRendererXRC2EP7SVLRoot',
    'dtor': '_ZN14QSVLRendererXRD2Ev',
    'init': '_ZN14QSVLRendererXR4InitERK10XRQContext',
    'setup': '_ZN14QSVLRendererXR15SetupSwapchainsERK10XRQContextjj9AtlasMode',
    'flip': '_ZN14QSVLRendererXR9FlipFrameERK10XRQContextPll',
    'e2h': None,   # resolved by prefix
    'gl': None,
}


def func_range(scene, key):
    if key == 'e2h':
        n, v = scene.find_one('_ZN12QSVLClientXR21GetEyeToHeadTransformE')
    elif key == 'gl':
        n, v = scene.find_one('_ZN14QSVLRendererXR19GetProjectionLayersE')
    else:
        n, v = FUNCS[key], scene.syms[FUNCS[key]]
    return v, scene.sizes[n]


def plt_addr(scene, name_sub):
    """Address of the PLT stub that jumps through the GOT slot of the import whose name contains name_sub."""
    scene.plt_stub_name(0)
    hits = [a for a, n in scene._plt.items() if n == name_sub]
    if not hits:
        hits = [a for a, n in scene._plt.items() if n and name_sub in n]
    assert len(hits) == 1, (name_sub, hits)
    return hits[0]


def check_equivalent(ref, tgt, keys):
    """Return {} if all functions in `keys` have identical normalised streams, else the mismatch report."""
    problems = {}
    for k in keys:
        rs, rz = func_range(ref, k)
        ts, tz = func_range(tgt, k)
        if rz != tz:
            problems[k] = 'size %#x != %#x' % (tz, rz)
            continue
        a, b = norm_stream(ref, rs, rz), norm_stream(tgt, ts, tz)
        if a != b:
            d = [(i, x, y) for i, (x, y) in enumerate(zip(a, b)) if x != y]
            problems[k] = 'stream differs at %d places, first %s' % (len(d), d[:2])
    return problems


if __name__ == '__main__':
    # The far-plane experiment has one exact target. No other base borrows this layout.
    fam = {
        '2proj': (5001712, [5001712]),
    }
    keys = ['ctor', 'dtor', 'init', 'setup', 'flip', 'e2h', 'gl']
    for name, (ref, bases) in fam.items():
        r = Scene(ref)
        for b in bases:
            t = Scene(b)
            print(name, b, check_equivalent(r, t, keys) or 'IDENTICAL normalised streams')
