#!/usr/bin/env python3
"""WP-A scorer. usage: score.py GOLDEN.tsv [--baseline golden-baseline-rc2.tsv] [--policy latin|bangla|either]
Row kinds (gating unless noted):
  LOCK  hard rules: k3 any pin == input (maintainer); k2 EN pin == input; Bangla-script input == input everywhere;
        k2 AUTO pure-English rows == input; typing column == baseline (dictation work must not move typing).
  RS    reviewer targets with provenance R or S (verbatim from reviewer-targets.tsv).
  WF    Unicode well-formedness of voice output (release gate; WFnew = newly malformed row, package gate). WFt = typing column, reported only.
  REGRESS any RS/P/WF row that passes on the baseline and fails now (package gate).
  P     proposed targets (reviewer P + builder): reported, NOT gating until the maintainer approves spellings.
  OPEN  no target (e.g. k1 EN pin, Q2).
LANG  k2 AUTO per-sentence language vs gold-lang.tsv (maintainer 2026-09-24 10:21 sentence rule): each output sentence must be all-Bangla (B) or all-Latin (E), protected tokens excluded; MIXED = fail. Primary WP-S metric.
bangla = maintainer 2026-09-24 10:12 ("write it in Bangla way"); either = accept both.
"""
import sys, re, argparse, unicodedata
ap = argparse.ArgumentParser(); ap.add_argument('golden'); ap.add_argument('--baseline', default='golden-baseline-rc2.tsv')
ap.add_argument('--policy', default='bangla', choices=['latin','bangla','either']); ap.add_argument('--show', type=int, default=0)
A = ap.parse_args()
def rd(p):
    rows = [l.rstrip('\n').split('\t') for l in open(p, encoding='utf-8')]
    return {(r[0], r[1], r[2]): r for r in rows[1:]}
G, B = rd(A.golden), rd(A.baseline)
T = {}
for l in open('targets-k2auto.tsv', encoding='utf-8'):
    if l.startswith('#'): continue
    f = l.rstrip('\n').split('\t'); T[f[0]] = f[1] if len(f) > 1 else ''
GL = {}
for l in open('gold-lang.tsv', encoding='utf-8'):
    if l.startswith('#') or not l.strip(): continue
    f = l.rstrip('\n').split('\t'); GL[f[0]] = f[1]
PROT = re.compile(r'https?://\S+|www\.\S+|[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}|\S*\.(?:com|org|net|io|be)\b\S*|[@#][A-Za-z0-9_]+(?:\.[A-Za-z0-9_]+)*|\+?\d[\d:,./-]*(?:[ap]m)?')
SPLIT = re.compile(r'(?<=[.?!\u0964\u2026])+\s+')
def langs(out):
    units = [u for u in re.split(r'(?:[.?!\u0964\u2026]+)(?:\s+|$)', out) if u.strip()]
    labs = []
    for u in units:
        v = PROT.sub(' ', u); b = bool(BN.search(v)); e = bool(re.search('[A-Za-z]', v))
        labs.append('MIXED' if b and e else 'B' if b else 'E' if e else 'N')
    return labs
def lang_ok(out, gold):
    g = gold.split('/'); o = [x for x in langs(out) if x != 'N']
    return o == g, '/'.join(o)
R = {}
rl = [l.rstrip('\n').split('\t') for l in open('reviewer-targets.tsv', encoding='utf-8')]
hdr = rl[0]
for f in rl[1:]: R[f[0]] = dict(zip(hdr, f))
BN = re.compile('[\u0980-\u09FF]'); CONS = set(range(0x995, 0x9BA)) | {0x9DC, 0x9DD, 0x9DF, 0x9CE}
VSIGN = set(range(0x9BE, 0x9C5)) | {0x9C7, 0x9C8, 0x9CB, 0x9CC, 0x9D7}
def wellformed(s):
    cps = [ord(c) for c in s]
    for i, c in enumerate(cps):
        p = cps[i-1] if i else None
        if c in VSIGN or c == 0x9CD or c == 0x981:  # vowel sign / hasanta / candrabindu need a base
            ok_base = p is not None and (p in CONS or p == 0x9BC or (c in (0x981,) and (p in VSIGN or 0x985 <= p <= 0x994)))
            # অ্যা (U+0985 U+09CD U+09AF U+09BE) is standard spelling (অ্যাপ, অ্যাংরি): the only hasanta allowed after an independent vowel
            if c == 0x9CD and p == 0x985 and cps[i+1:i+3] == [0x9AF, 0x9BE]: ok_base = True
            if c in VSIGN and p is not None and p in VSIGN and not (p == 0x9C7 and c in (0x9BE, 0x9D7)): return 'double vowel sign U+%04X U+%04X' % (p, c)
            if not ok_base: return 'orphan mark U+%04X after %s' % (c, 'start' if p is None else 'U+%04X' % p)
        if c == 0x9BC and p is not None and (p == 0x9BC or p in (0x9DC, 0x9DD, 0x9DF)): return 'double nukta U+%04X U+09BC' % p
        if c == 0x9CD:
            nx = cps[i+1] if i + 1 < len(cps) else None
            if nx is not None and (nx in VSIGN or nx == 0x9CD or nx == 0x981): return 'hasanta before mark U+%04X' % nx
            if nx is None or not (0x980 <= nx <= 0x9FF): return 'word-final hasanta'
    return None
def alts(t, policy):
    # expand '|' top-level alternatives (only when no braces around) and {a|b} groups
    outs = []
    tops = [t] if '{' in t and '|' not in re.sub(r'\{[^}]*\}', '', t) else (t.split('|') if '{' not in t else [t])
    if '{' in t and '|' in re.sub(r'\{[^}]*\}', '', t): tops = re.split(r'\|(?![^{]*\})', t)
    for top in tops:
        def rx(m):
            opts = m.group(1).split('|')
            if policy == 'latin': opts = [opts[0]]
            elif policy == 'bangla': opts = opts[1:] or opts
            return '(?:' + '|'.join(re.escape(o) for o in opts) + ')'
        pat = ''; last = 0
        for m in re.finditer(r'\{([^}]*)\}', top):
            pat += re.escape(top[last:m.start()]) + rx(m); last = m.end()
        pat += re.escape(top[last:]); outs.append(pat)
    return re.compile('^(?:' + '|'.join(outs) + ')$')
def score(G):
    res = []
    for k, r in sorted(G.items()):
        lay, pin, cid, cls, inp, voice, typing = r[:7]
        if BN.search(voice):
            e = wellformed(voice); res.append(('WF', k, 'FAIL' if e else 'PASS', e or ''))
        if BN.search(typing):
            e = wellformed(typing); res.append(('WFt', k + ('typing',), 'FAIL' if e else 'PASS', e or ''))
        if lay == 'k2' and pin == 'AUTO' and GL.get(cid, '?') != '?':
            ok, got = lang_ok(voice, GL[cid]); res.append(('LANG', k, 'PASS' if ok else 'FAIL', '' if ok else 'gold %s got %s | %s' % (GL[cid], got, voice)))
        b = B.get(k)
        res.append(('LOCK', k + ('typing',), 'PASS' if b and b[6] == typing else 'FAIL', '' if b and b[6] == typing else 'typing moved: %r -> %r' % (b[6] if b else None, typing)))
        keep = set(t for t in inp.split() if BN.search(t))
        bad = [t for t in voice.split() if t not in keep and BN.search(t) and unicodedata.normalize('NFC', t) != t]
        res.append(('LOCK', k + ('nfc',), 'FAIL' if bad else 'PASS', 'non-NFC converted tokens: %r' % bad if bad else ''))
        for tag in re.findall(r'(?:(?<![A-Za-z0-9_\u0980-\u09FF])@[A-Za-z0-9_.]*[A-Za-z][A-Za-z0-9_]*|#[A-Za-z0-9_]*[A-Za-z][A-Za-z0-9_]*)', inp):
            ok = re.search(re.escape(tag) + r'(?![A-Za-z0-9_])', voice) is not None
            res.append(('LOCK', k + ('tag',), 'PASS' if ok else 'FAIL', '' if ok else 'tag %s lost: %r' % (tag, voice)))
        if lay == 'k3' or (lay == 'k2' and pin == 'EN') or cls == 'bangla' or (lay == 'k2' and pin == 'AUTO' and cls == 'english'):
            res.append(('LOCK', k, 'PASS' if voice == inp else 'FAIL', '' if voice == inp else repr(voice))); continue
        rv = R.get(cid)
        colname = {('k2','AUTO'):'target_k2_multilingual_AUTO', ('k2','BN'):'target_k2_BN_pin', ('k1','AUTO'):'target_k1_full_bangla_AUTO_BN', ('k1','BN'):'target_k1_full_bangla_AUTO_BN'}.get((lay, pin))
        if rv and colname:
            prov = rv['provenance'].strip()
            if lay == 'k2' and pin == 'AUTO':
                lat, bng = rv['target_k2_multilingual_AUTO'], rv['target_k2_BN_pin']
                if lat.startswith('OPEN'): res.append(('OPEN', k, '-', voice)); continue
                if lat == bng: cand = [lat]
                else: cand = {'latin': [lat], 'bangla': [bng], 'either': [lat, bng]}[A.policy]
                gating = prov == 'S' or (A.policy == 'latin' and prov[:1] in 'RS')
            else:
                cand = [rv[colname]]; gating = prov == 'S'
            if cand and cand[0].startswith('OPEN'): res.append(('OPEN', k, '-', voice)); continue
            ok = voice in cand
            res.append(('RS' if gating else 'P', k, 'PASS' if ok else 'FAIL', '' if ok else 'want %r got %r' % (' || '.join(cand), voice))); continue
        t = T.get(cid)
        if t is not None and lay == 'k2' and pin == 'AUTO':
            ok = bool(alts(t, A.policy).match(voice)); res.append(('P', k, 'PASS' if ok else 'FAIL', '' if ok else 'want %r got %r' % (t, voice))); continue
        if t is not None and cls != 'english' and ((lay == 'k2' and pin == 'BN') or (lay == 'k1' and pin in ('AUTO', 'BN'))):
            ok = bool(alts(t, 'bangla').match(voice)); res.append(('P', k, 'PASS' if ok else 'FAIL', '' if ok else 'want %r got %r' % (t, voice))); continue
        res.append(('OPEN', k, '-', voice))
    return res
res = score(G); base = {(x[0], x[1]): x[2] for x in score(B)}
for x in list(res):
    if x[0] in ('RS', 'P', 'WF', 'LANG') and x[2] == 'FAIL' and base.get((x[0], x[1])) == 'PASS':
        res.append(('REGRESS', x[1], 'FAIL', x[0] + ': ' + x[3]))
    if x[0] == 'WF' and x[2] == 'FAIL' and base.get((x[0], x[1])) != 'FAIL':
        res.append(('WFnew', x[1], 'FAIL', x[3]))
from collections import Counter
c = Counter((x[0], x[2]) for x in res)
pkg = sum(1 for x in res if x[0] in ('LOCK', 'REGRESS', 'WFnew') and x[2] == 'FAIL')
rel = pkg + sum(1 for x in res if x[0] in ('RS', 'WF', 'LANG') and x[2] == 'FAIL')
print('policy=%s golden=%s baseline=%s rows=%d' % (A.policy, A.golden, A.baseline, len(G)))
for kind in ('LOCK', 'LANG', 'RS', 'WF', 'WFt', 'P', 'OPEN', 'REGRESS', 'WFnew'):
    print('  %-7s pass=%-4d fail=%-4d %s' % (kind, c[(kind, 'PASS')], c[(kind, 'FAIL')], ('open=%d' % c[(kind, '-')]) if kind == 'OPEN' else ''))
print('PACKAGE GATE (LOCK + REGRESS + WFnew = 0): %d -> %s' % (pkg, 'PASS' if pkg == 0 else 'FAIL'))
print('RELEASE GATE (package + all LANG + all RS pass + zero malformed voice output): %d -> %s' % (rel, 'PASS' if rel == 0 else 'FAIL'))
if A.show:
    for x in res:
        if x[2] == 'FAIL' and (A.show > 1 or x[0] in ('LOCK', 'LANG', 'RS', 'WF', 'REGRESS', 'WFnew')): print('\t'.join([x[0], '/'.join(x[1]), x[3]]))
