"""Rate-sensitivity candidate scan over baksmali output (NAVER Map, Atlan Java side). Output feeds ledger.py.

usage: scan_smali.py --root <dir containing classesN/ smali trees> [--root ...] --pkg <prefix,...> --out hits.tsv

Kinds (see docs/app-update-patch-plan.md L3):
  COUNTER   field read, +-1, stored back to the same field in the method  (per-call counter)
  WINDOW    list/deque size() compared with an int constant >= 2           (sample-count window)
  DEQUECAP  ArrayDequeExtensionsKt call with an int constant >= 2           (capped sample buffer)
  ONE_SEC   double 1.0 feeding mul-double or MathUtils                       (1 s of travel)
  SPEED     getSpeedMPS / meterPerSeconds use                                (speed x 1 s distance?)
  FLOOR     Math.floor                                                      (elapsed seconds used as a count)
  TIMER     postDelayed / Timer / coroutine delay / Flow sample / ticker     (new periodic work)
  LOCREQ    location request API                                            (fix rate requested from the OS)
  NMEA_CALL caller of a synthetic accessor wrapping such a native call          (where the rate gate must sit)
  NMEA      NMEA listener registration / Atlan nativeSendNMEAData call       (NMEA/Fused path into a native engine)

Key columns are chosen to survive R8 renaming: class descriptor + method *descriptor* (no name) +
kind + detail (+ n, the occurrence index). Method and field names are kept in separate info columns.

Apps whose class names are obfuscated per version (KakaoMap KNSDK): --srcmap <dexclasses.py --srcmap output>
  keys rows on the original source file instead: class 'src:KNGPSData.kt', and every app type inside the method
  descriptor becomes '<Source.kt>'. The obfuscated class goes into the method column ('om/b.a').
  --scope <file> selects the scanned classes from the srcmap: every package containing a class whose source file
  matches a line of the file ('KN*' prefix, exact 'ValidCheckerVehicle.kt', or 'pkg:com/kakao/map/navi/'),
  so new files in those packages are scanned even though their names are new.
"""
import argparse, fnmatch, os, re, sys

M_RE = re.compile(r'(?ms)^\.method (.*?)$(.*?)^\.end method')
FGET = re.compile(r'^\s*[is]get(?:-wide)?\s+(\w+),\s*(?:\w+,\s*)?(L[^;]+;->(\w+):([IJ]))')
FPUT = re.compile(r'^\s*[is]put(?:-wide)?\s+(\w+),\s*(?:\w+,\s*)?(L[^;]+;->\w+:[IJ])')
ADDL = re.compile(r'^\s*add-int/lit(?:8|16)\s+(\w+),\s*(\w+),\s*(-?0x[0-9a-f]+)')
ADD2 = re.compile(r'^\s*add-(?:int|long)(/2addr)?\s+(\w+),\s*(\w+)(?:,\s*(\w+))?')
CONST = re.compile(r'^\s*const(?:/4|/16|/high16)?\s+(\w+),\s*(-?0x[0-9a-f]+)')
CONSTW = re.compile(r'^\s*const-wide(?:/16|/32|/high16)?\s+(\w+),\s*(-?0x[0-9a-f]+)L?')
INV = re.compile(r'^\s*invoke-[\w/]+\s+\{([^}]*)\},\s*(L[^;]+;)->([\w$<>-]+)\(([^)]*)\)')
MOVRES = re.compile(r'^\s*move-result(?:-wide)?\s+(\w+)')
IFCMP = re.compile(r'^\s*if-(\w+)\s+(\w+),\s*(\w+),')
TIMER = re.compile(r'Landroid/os/Handler;->(postDelayed|sendMessageDelayed|sendEmptyMessageDelayed|postAtTime)$|'
                   r'Ljava/util/Timer;->schedule|ScheduledExecutorService;->schedule|'
                   r'kotlinx/coroutines/[^/;]+;->delay$|kotlinx/coroutines/flow/[^/;]+;->(sample|debounce)|'
                   r'kotlinx/coroutines/channels/[^/;]+;->ticker$')   # owner may be obfuscated (DelayKt -> a1)
LOCREQ = re.compile(r'LocationManager;->requestLocationUpdates|gms/location/LocationRequest(\$\w+)?;->|'
                    r'LocationRequest\$Builder;->|FusedLocationProviderClient;->|->requestLocationUpdates$')
NMEA = re.compile(r'LocationManager;->(addNmeaListener|removeNmeaListener)$|->nativeSend(NMEA|Fused)Data$')


def regs(s):
    out = []
    for part in s.split(','):
        part = part.strip()
        m = re.match(r'([vp])(\d+) \.\. [vp](\d+)', part)
        if m:
            out += [f'{m.group(1)}{i}' for i in range(int(m.group(2)), int(m.group(3)) + 1)]
        elif part:
            out.append(part)
    return out


def scan_method(dex, cls, sig, body, emit):
    name = sig.split()[-1]
    mname, desc = name.split('(', 1)
    desc = '(' + desc
    lines = [l.strip() for l in body.splitlines()]
    lines = [l for l in lines if l and not l.startswith(('.line', '.local', '.end local', '.restart', '.param', '.end param', '.registers'))]
    puts = {m.group(2) for l in lines for m in [FPUT.match(l)] if m}
    rv = {}
    last_inv = None
    for i, l in enumerate(lines):
        m = FGET.match(l)
        if m:
            rv[m.group(1)] = ('field', m.group(2), m.group(3), m.group(4)); continue
        m = CONST.match(l)
        if m:
            rv[m.group(1)] = ('const', int(m.group(2), 16)); continue
        m = CONSTW.match(l)
        if m:
            v = m.group(2).lower()
            rv[m.group(1)] = ('constw', v)
            if v == '0x3ff0000000000000':
                nxt = ' '.join(lines[i + 1:i + 4])
                if 'mul-double' in nxt or 'MathUtils' in nxt:
                    emit('ONE_SEC', dex, cls, mname, desc, '1.0', '', nxt[:100])
            continue
        m = ADDL.match(l)
        if m:
            d, s, k = m.group(1), m.group(2), int(m.group(3), 16)
            v = rv.get(s)
            if v and v[0] == 'field' and k in (1, -1) and v[1] in puts:
                emit('COUNTER', dex, cls, mname, desc, f'{v[3]}{k:+d}', v[2], l)
            rv[d] = None; continue
        m = ADD2.match(l)
        if m:
            d, a1, a2 = m.group(2), m.group(3), m.group(4)
            if m.group(1):
                a1, a2 = d, m.group(3)
            v1, v2 = rv.get(a1), rv.get(a2)
            for f, c in ((v1, v2), (v2, v1)):
                if f and f[0] == 'field' and c and c[0] == 'const' and c[1] in (1, -1) and f[1] in puts:
                    emit('COUNTER', dex, cls, mname, desc, f'{f[3]}{c[1]:+d}', f[2], l)
                    break
            rv[d] = None; continue
        m = INV.match(l)
        if m:
            args, owner, meth = regs(m.group(1)), m.group(2), m.group(3)
            ref = f'{owner}->{meth}'
            last_inv = (ref, i)
            if TIMER.search(ref):
                ks = [rv[r][1] for r in args if rv.get(r) and rv[r][0] == 'constw']
                emit('TIMER', dex, cls, mname, desc, ref, ks[0] if ks else '', l[:120])
            elif LOCREQ.search(ref):
                ks = [rv[r][1] for r in args if rv.get(r) and rv[r][0] == 'constw']
                emit('LOCREQ', dex, cls, mname, desc, ref, ks[0] if ks else '', l[:120])
            elif NMEA.search(ref):
                emit('NMEA', dex, cls, mname, desc, ref, '', l[:120])
            elif 'ArrayDequeExtensionsKt;' in owner:
                ks = [rv[r][1] for r in args if rv.get(r) and rv[r][0] == 'const' and rv[r][1] >= 2]
                if ks:
                    emit('DEQUECAP', dex, cls, mname, desc, f'cap={ks[0]}', '', l[:120])
            elif ref == 'Ljava/lang/Math;->floor':
                emit('FLOOR', dex, cls, mname, desc, 'floor', '', ' '.join(lines[max(0, i - 3):i])[:120])
            elif meth in ('getSpeedMPS', 'meterPerSeconds', 'meterPerSeconds-impl') or meth.startswith('meterPerSeconds'):
                emit('SPEED', dex, cls, mname, desc, meth, '', l[:120])
            continue
        m = MOVRES.match(l)
        if m:
            if last_inv and last_inv[1] == i - 1 and last_inv[0].endswith(('->size', '->getSize')):
                rv[m.group(1)] = ('size',)
            else:
                rv[m.group(1)] = None
            continue
        m = IFCMP.match(l)
        if m:
            a, b = rv.get(m.group(2)), rv.get(m.group(3))
            for s, c in ((a, b), (b, a)):
                if s and s[0] == 'size' and c and c[0] == 'const' and c[1] >= 2:
                    emit('WINDOW', dex, cls, mname, desc, f'size {m.group(1)} {c[1]}', '', l)
                    break


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--root', action='append', required=True)
    ap.add_argument('--pkg', default='')
    ap.add_argument('--out', required=True)
    ap.add_argument('--locreq-all', action='store_true', help='also report LOCREQ/NMEA in classes outside --pkg')
    ap.add_argument('--srcmap', help='dexclasses.py --srcmap TSV: key rows on source file names (obfuscated apps)')
    ap.add_argument('--scope', help='with --srcmap: file of source-name patterns / pkg: lines selecting packages')
    a = ap.parse_args()
    smap = {}
    if a.srcmap:
        for l in open(a.srcmap, encoding='utf-8'):
            d, c, s = (l.rstrip('\n').split('\t') + ['', ''])[:3]
            if s and not s.startswith('R8$$'):          # R8 synthetic classes share one fake name: keep their path
                smap[c] = s
    pk = [p.strip('/') + '/' for p in a.pkg.split(',') if p]     # package prefixes (sub-packages included)
    exact = set()                                                 # scope packages: that directory only
    if a.scope:
        pats = [l.strip() for l in open(a.scope, encoding='utf-8') if l.strip() and not l.startswith('#')]
        pk += [p[4:].strip('/') + '/' for p in pats if p.startswith('pkg:')]
        srcpats = [p for p in pats if not p.startswith('pkg:')]
        # obfuscated packages are short ('io/'): match the exact directory, not as a prefix of io/realm/...
        exact = {c.rsplit('/', 1)[0] + '/' for c, s in smap.items()
                 if '/' in c and any(fnmatch.fnmatchcase(s, p) for p in srcpats)}
    if not pk and not exact:
        sys.exit('nothing to scan: give --pkg and/or --scope')
    pkgs = tuple(sorted(set(pk))) or ('\0',)

    def in_scope_dir(rel):
        return rel.startswith(pkgs) or rel in exact
    raw = []

    def emit(kind, dex, cls, mname, desc, detail, info, src):
        if not in_scope_dir(cls.rsplit('/', 1)[0] + '/') and kind not in ('LOCREQ', 'NMEA', 'NMEA_CALL'):
            return
        raw.append((kind, cls, desc, detail, dex, mname, info, src.replace('\t', ' ')))

    TYPE = re.compile(r'L([^;]+);')
    REF = re.compile(r'^L([^;]+);->(.*)$')

    def fname(path):
        """source file name of an app class, if it is a real file name (library jars carry ids like 'x@@21.0.1')"""
        s = smap.get(path)
        return s if s and s.endswith(('.kt', '.java')) else None

    def keyed(r):
        kind, cls, desc, detail, dex, mname, info, src = r
        m = REF.match(detail)
        if m:          # TIMER/LOCREQ/NMEA: 'Owner;->method' (owner's last path segment, or its source file)
            f = fname(m.group(1))
            detail = f'<{f}>->{m.group(2)}' if f else m.group(1).split('/')[-1] + ';->' + m.group(2)
        if smap:
            desc = TYPE.sub(lambda t: f'<{fname(t.group(1))}>' if fname(t.group(1)) else t.group(0), desc)
            mname = f'{cls}.{mname}'
            s = smap.get(cls, '')
            if fname(cls):
                cls = f'src:{s}'
            elif '@@' in s:          # obfuscated library internals: 'lib:<artifact>' without its version
                cls = 'lib:' + s.split('@@')[0]
        return kind, cls, desc, detail, dex, mname, info, src

    for root in a.root:
        for dex in sorted(os.listdir(root)):
            base = os.path.join(root, dex)
            for dp, dn, fn in os.walk(base):
                dn.sort()
                rel = os.path.relpath(dp, base).replace(os.sep, '/') + '/'
                if not in_scope_dir(rel) and not a.locreq_all:
                    continue
                for f in sorted(fn):
                    if not f.endswith('.smali'):
                        continue
                    cls = rel + f[:-6]
                    txt = open(os.path.join(dp, f), encoding='utf-8', errors='replace').read()
                    for m in M_RE.finditer(txt):
                        scan_method(dex, cls, m.group(1), m.group(2), emit)
    # synthetic accessors (access$NNN) that wrap an NMEA/Fused native call: report their callers too (NMEA_CALL),
    # because that is where a rate gate has to sit
    acc = {f'L{r[1]};->{r[5]}{r[2]}' for r in raw if r[0] == 'NMEA' and r[5].startswith('access$')}
    if acc:
        for root in a.root:
            for dex in sorted(os.listdir(root)):
                base = os.path.join(root, dex)
                for dp, dn, fn in os.walk(base):
                    dn.sort()
                    rel = os.path.relpath(dp, base).replace(os.sep, '/') + '/'
                    for f in sorted(fn):
                        if not f.endswith('.smali'):
                            continue
                        txt = open(os.path.join(dp, f), encoding='utf-8', errors='replace').read()
                        if not any(x in txt for x in acc):
                            continue
                        for m in M_RE.finditer(txt):
                            for x in acc:
                                if x in m.group(2):
                                    mname, desc = m.group(1).split()[-1].split('(', 1)
                                    emit('NMEA_CALL', dex, rel + f[:-6], mname, '(' + desc, x.split(';->')[1].split('(')[0], '', x)
    rows, seen = [], {}
    for r in map(keyed, raw):
        k = r[:4]
        seen[k] = seen.get(k, 0) + 1
        rows.append(r[:4] + (str(seen[k]),) + r[4:])
    with open(a.out, 'w', encoding='utf-8', newline='\n') as o:
        o.write('kind\tclass\tdesc\tdetail\tn\tdex\tmethod\tinfo\tsrc\n')
        for r in rows:
            o.write('\t'.join(r) + '\n')
    from collections import Counter
    print(len(rows), dict(Counter(r[0] for r in rows)))


if __name__ == '__main__':
    sys.exit(main())
