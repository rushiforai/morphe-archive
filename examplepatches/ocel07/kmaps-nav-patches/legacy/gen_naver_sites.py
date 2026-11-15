"""Generate Morphe instruction edits from the smali-text NAVER rate patch (legacy/apply_rate_patch.py).
One-time conversion: NaverSites.kt is now edited by hand, so re-running this overwrites those edits.

Each apply_rate_patch replacement (old anchor text -> new text) becomes a Site:
  class, optional method descriptor filter, anchor (canonical instruction lines, no labels), expected count,
  and edit ops relative to the anchor's instructions computed with difflib:
    R k  [lines]  replace instruction k (in place: keeps its location and any labels on it), extra lines follow it
    I k  [lines]  insert before instruction k (k == n: after the last); CF: at k's control-flow label (branches to k
                  run the new code too)
  New-code labels are resolved to anchor instructions (ExternalLabel): defined before kept instruction j -> ('K', j);
  labels of the old code referenced by new code -> ('T', j) = target of the old branch instruction j.
The canonical form must match Naver.kt render(): baksmali text without labels/comments, branch targets -> 'L',
long literal suffix 'L' dropped.  Also writes the anchors so the engine can print what it matched.

usage: gen_naver_sites.py <apply_rate_patch.py> <out .kt>
"""
import difflib, importlib.util, re, sys

SKIP = ('.line', '.local', '.end local', '.restart', '.param', '.end param', '.prologue', '.registers')
OVERRIDE = {
    # (class simple name, first anchor line prefix) -> dict(desc=..., anchor_glob={idx: pattern}, count=...)
    ('RealMapMatchingRunner$MapMatchingRunnable', 'iget-object v0, p0'): dict(
        glob={1: 'invoke-virtual {v0}, Lcom/naver/maps/navi/mapmatching/MapMatchingRunnerBase;->*()Lcom/naver/maps/navi/v2/shared/api/mapmatching/model/MMGuidePoint;'}),
    ('TrafficEventRepository', 'add-int/2addr v0, v1'): dict(desc='()Z'),
    ('TrafficEventRepository', 'move-result v2'): dict(desc='()Z'),
    ('SessionTripReportManager', ':cond_1c'): dict(desc='(Ljava/util/List;Lcom/naver/maps/navi/v2/shared/api/model/GuidePoint;Ljava/util/List;)V',
                                                  prefix=['if-nez v0, :cond_1c', 'return-void']),
}
SKIP_SITES = {('NaviStore', 'if-eqz v0, :cond_2c9')}          # rewritten by hand (6.11 moved the code)
MERGE_VECTORANGLE = True                                     # VectorAngle g()/a() share one anchor -> one site, count 2


def canon(l):
    l = l.strip()
    if not l.startswith('const-string'):
        l = l.split('#')[0].strip()
    l = re.sub(r'(?<=[ ,]):[A-Za-z0-9_]+$', 'L', l)
    l = re.sub(r'(0x[0-9a-fA-F]+)L\b', r'\1', l)
    return l


def lines(txt):
    out = []
    for l in txt.splitlines():
        s = l.strip()
        if not s or s.startswith(SKIP):
            continue
        out.append(s)
    return out


def raw(l):  # snippet text: drop comments, keep labels and literals
    return l if l.startswith('const-string') else l.split('#')[0].rstrip()


def build_site(cls, meth, old, new, cnt, ov, cross=None):
    o, nw = lines(old), lines(new)
    if ov.get('prefix'):
        o, nw = ov['prefix'] + o, ov['prefix'] + nw
    oi = [i for i, l in enumerate(o) if not l.startswith(':')]          # old instruction line idx
    k_of = {li: k for k, li in enumerate(oi)}
    anchor = [canon(o[i]) for i in oi]
    for gi, pat in ov.get('glob', {}).items():
        anchor[gi] = pat
    old_labels = {}                                                     # label -> old line idx (in anchor)
    for i, l in enumerate(o):
        if l.startswith(':'):
            old_labels[l[1:]] = i
    branch_of = {}                                                      # label -> k of old branch instr using it
    for k, li in enumerate(oi):
        m = re.search(r':([A-Za-z0-9_]+)$', o[li])
        if m:
            branch_of.setdefault(m.group(1), k)
    sm = difflib.SequenceMatcher(a=[canon(x) if not x.startswith(':') else x for x in o],
                                 b=[canon(x) if not x.startswith(':') else x for x in nw], autojunk=False)
    ops = []
    for tag, a1, a2, b1, b2 in sm.get_opcodes():
        if tag == 'equal':
            continue
        olds = [i for i in range(a1, a2) if not o[i].startswith(':')]
        news = [raw(x) for x in nw[b1:b2]]
        if any(o[i].startswith(':') for i in range(a1, a2)):
            raise SystemExit(f'{cls} {meth}: label line changed: {o[a1:a2]} -> {news}')
        if tag == 'replace' or tag == 'delete':
            if len(olds) != 1:
                raise SystemExit(f'{cls} {meth}: {tag} of {len(olds)} instructions: {o[a1:a2]} -> {news}')
            k = k_of[olds[0]]
            if k in (0, len(oi) - 1) and len(oi) > 1 and not o[olds[0]].startswith(new_line_head(o[olds[0]])):
                pass
            if (k == 0 or k == len(oi) - 1) and partial(old, o[olds[0]], k == 0):
                raise SystemExit(f'{cls} {meth}: partial anchor line changed: {o[olds[0]]}')
            ops.append(('R', k, news))
        elif tag == 'insert':
            k = next((k_of[i] for i in range(a1, len(o)) if i in k_of), len(oi))
            # control-flow label: inserted right after a label line that belongs to instruction k
            cf = a1 > 0 and o[a1 - 1].startswith(':') and (a1 - 1) in old_labels.values()
            # text inserted in front of the whole anchor lands after any label that precedes the anchor line,
            # so branches to that label run the new code: same as inserting at the control-flow label
            cf = cf or k == 0
            ops.append(('CF' if cf else 'I', k, news))
    # labels used by new code
    labels = {}
    new_defined = {}
    for j, x in enumerate(nw):
        if x.startswith(':'):
            new_defined[x[1:]] = j
    for _, _, news in ops:
        for x in news:
            m = re.search(r':([A-Za-z0-9_]+)$', x)
            if not m or x.startswith(':'):
                continue
            name = m.group(1)
            if name in labels:
                continue
            inner = [y[1:] for y in news[:-1] if y.startswith(':')]       # a label as the snippet's last line
            if name in inner:                                            # belongs to the next old instruction
                continue                                                 # defined inside the same snippet
            if name in new_defined:
                # first kept old instruction after the label in the new text
                j = new_defined[name] + 1
                while j < len(nw) and (nw[j].startswith(':') or canon(nw[j]) not in anchor_set(o)):
                    j += 1
                k = index_in_old(o, oi, nw, j)
                labels[name] = ('K', k)
            elif name in branch_of:
                labels[name] = ('T', branch_of[name])
            elif cross and name in cross:
                labels[name] = ('NEXT', cross[name])                     # defined by another replacement in the method
            else:
                raise SystemExit(f'{cls} {meth}: label {name} unresolved')
    # snippets must not define labels that the engine resolves externally
    ext = set(labels) | set(cross or ())
    ops = [(t, k, [x for x in news if not (x.startswith(':') and x[1:] in ext)]) for t, k, news in ops]
    return dict(cls=cls, meth=meth, desc=ov.get('desc'), anchor=anchor, count=cnt, ops=ops, labels=labels)


def new_line_head(l):
    return l


def partial(old_text, line, first):
    """True when the anchor starts/ends in the middle of that instruction line"""
    t = old_text.strip('\n')
    ls = [x for x in t.split('\n')]
    s = ls[0] if first else ls[-1]
    s = s.strip()
    return not (s.split()[0:1] and re.match(r'^[a-z\-/0-9]+$', s.split()[0]) and (s.startswith(line.split()[0])))


def anchor_set(o):
    return {canon(x) for x in o if not x.startswith(':')}


def index_in_old(o, oi, nw, j):
    if j >= len(nw):
        return len(oi)
    target = canon(nw[j])
    for k, li in enumerate(oi):
        if canon(o[li]) == target:
            return k
    raise SystemExit(f'no old instruction for {nw[j]}')


def kt_str(s):
    return '"' + s.replace('\\', '\\\\').replace('"', '\\"').replace('$', '\\$').replace('\n', '\\n') + '"'


def main(script, out):
    spec = importlib.util.spec_from_file_location('arp', script)
    m = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(m)
    sites, seen_va = [], False
    for dex, cls, meth, reps in m.P:
        simple = cls.rsplit('/', 1)[-1]
        cross = {}                                   # label defined in one replacement's new text -> next instruction
        for rep in reps:
            nl = lines(rep[1])
            for j, x in enumerate(nl):
                if x.startswith(':') and j + 1 < len(nl) and not nl[j + 1].startswith(':') and x[1:] not in rep[0]:
                    cross[x[1:]] = canon(nl[j + 1])
        for rep in reps:
            old, new = rep[0], rep[1]
            cnt = rep[2] if len(rep) > 2 else 1
            first = lines(old)[0]
            if any(simple == a and first.startswith(b) for a, b in SKIP_SITES):
                continue
            ov = next((v for (a, b), v in OVERRIDE.items() if simple == a and first.startswith(b)), {})
            if MERGE_VECTORANGLE and simple == 'VectorAngle' and first.startswith('add-int/lit8 v1, v1, 0x1'):
                if seen_va:
                    continue
                seen_va, cnt = True, 2
            site = build_site(cls, meth, old, new, cnt, ov, cross)
            site['ops'] = [o for o in site['ops'] if o[2]]
            if site['ops']:
                sites.append(site)
            else:
                print('  (no instruction change, label only):', simple, first[:50])
    kinds = {}
    for s in sites:
        for t, k, n in s['ops']:
            kinds[t] = kinds.get(t, 0) + 1
    with open(out, 'w', encoding='utf-8', newline='\n') as f:
        f.write('// Generated once by legacy/gen_naver_sites.py from legacy/apply_rate_patch.py (smali-text patch rate8v4).\n'
                '// Maintained by hand since 2026-11-04: Site = class, anchor (canonical instructions, no labels), count, edit ops.\n')
        f.write('package dev.ubxbridge.morphe\n\ninternal val NAVER_SITES: List<Site> = listOf(\n')
        for s in sites:
            f.write('    Site(\n')
            f.write(f'        cls = {kt_str("L" + s["cls"] + ";")}, note = {kt_str(s["meth"])}, desc = {kt_str(s["desc"]) if s["desc"] else "null"}, count = {s["count"]},\n')
            f.write('        anchor = listOf(' + ', '.join(kt_str(a) for a in s['anchor']) + '),\n')
            f.write('        ops = listOf(' + ', '.join(f'Op({kt_str(t)}, {k}, {kt_str(chr(10).join(n))})' for t, k, n in s['ops']) + '),\n')
            f.write('        labels = mapOf(' + ', '.join(f'{kt_str(n)} to ({kt_str(a)} to {kt_str(str(b))})' for n, (a, b) in s['labels'].items()) + '),\n')
            f.write('    ),\n')
        f.write(')\n')
    print(len(sites), 'sites, ops', kinds, '->', out)
    for s in sites:
        if s['labels'] or any(t == 'CF' for t, _, _ in s['ops']):
            print('  labels/CF:', s['cls'].rsplit('/', 1)[-1], s['labels'], [t for t, _, _ in s['ops']])


if __name__ == '__main__':
    main(*sys.argv[1:3])
