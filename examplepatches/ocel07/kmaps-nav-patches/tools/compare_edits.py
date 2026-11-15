"""Compare the edits (added/removed instructions) of two patched app versions class by class.

usage: compare_edits.py <orig A apk> <patched A apk> <orig B apk> <patched B apk>
For each class changed in B (Morphe output), take the multiset of '+' and '-' instruction lines of
original -> patched (labels dropped, branch targets as L) in both versions and report classes whose edits differ.
A = 6.10.0.16 (original -> Morphe output, which equals rate8v4), B = 6.11.2.2.
"""
import collections, difflib, os, re, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import dexclasses  # noqa: E402
from compare_naver import baksmali  # noqa: E402

SKIP = ('.line', '.local', '.end local', '.restart', '.param', '.end param', '.source', '.registers', '.annotation',
        '.end annotation', 'value =', '"', '}')


def lines(p):
    out = []
    for l in open(p, encoding='utf-8').read().splitlines():
        s = l.strip()
        if not s or s.startswith(SKIP) or s.startswith(':') or s == 'nop':
            continue
        out.append(re.sub(r'(?<=[ ,]):[A-Za-z0-9_]+$', 'L', s))
    return out


def edits(a, b):
    plus, minus = collections.Counter(), collections.Counter()
    for l in difflib.ndiff(a, b):
        if l.startswith('+ '):
            plus[l[2:]] += 1
        elif l.startswith('- '):
            minus[l[2:]] += 1
    return plus, minus


def class_files(apk, classes, tmp, tag):
    z = zipfile.ZipFile(apk)
    where = {}
    for n in z.namelist():
        if n.startswith('classes') and n.endswith('.dex'):
            d = z.read(n)
            hit = [c for c in dexclasses.classes(d) if c in classes]
            if hit:
                p = os.path.join(tmp, f'{tag}_{n}')
                open(p, 'wb').write(d)
                out = os.path.join(tmp, tag)
                baksmali(p, out, hit)
                for c in hit:
                    where[c] = os.path.join(out, c[1:-1] + '.smali')
    return where


def changed_classes(orig, patched):
    zo, zp = zipfile.ZipFile(orig), zipfile.ZipFile(patched)
    od = {n for n in zo.namelist() if n.startswith('classes') and n.endswith('.dex')}
    cs = set()
    for n in zp.namelist():
        if n.startswith('classes') and n.endswith('.dex') and n not in od:
            cs |= set(dexclasses.classes(zp.read(n)))
    return cs - {'Lcom/naver/maps/navi/mapmatching/RateGate;'}


def main(oa, pa, ob, pb):
    tmp = tempfile.mkdtemp(prefix='cmpedits')
    ca, cb = changed_classes(oa, pa), changed_classes(ob, pb)
    print(f'changed: A {len(ca)}  B {len(cb)}  only in A: {sorted(ca - cb)}  only in B: {sorted(cb - ca)}')
    allc = ca | cb
    f = {t: class_files(p, allc, tmp, t) for t, p in (('oa', oa), ('pa', pa), ('ob', ob), ('pb', pb))}
    same = 0
    for c in sorted(cb):
        eb = edits(lines(f['ob'][c]), lines(f['pb'][c]))
        if c not in ca:
            print('== new in B:', c); print('   +', dict(eb[0])); print('   -', dict(eb[1])); continue
        ea = edits(lines(f['oa'][c]), lines(f['pa'][c]))
        if ea == eb:
            same += 1
        else:
            print('== differs:', c)
            for name, i in (('+', 0), ('-', 1)):
                da, db = ea[i] - eb[i], eb[i] - ea[i]
                if da: print(f'   {name} only in A:', dict(da))
                if db: print(f'   {name} only in B:', dict(db))
    print('classes with identical edits:', same)


if __name__ == '__main__':
    main(*sys.argv[1:5])
