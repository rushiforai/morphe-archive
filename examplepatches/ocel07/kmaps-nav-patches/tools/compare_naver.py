"""Compare classes changed by the Morphe NAVER patch with a reference build (smali, label-normalized).

usage: compare_naver.py <morphe output apk> <original base apk> <reference dex>... [--out dir]
Every class that differs between the Morphe output and the original APK is baksmali'd from both the Morphe output
and the first reference dex that defines it, labels are renamed in order of appearance, and the texts are diffed.
Reference dex for 6.10.0.16: probe_out/naver/rate/v4/classes4.dex, probe_out/naver/rate/classes5.dex,
probe_out/naver/rate/classes12.dex, and classes.dex of probe_out/naver/nmap-6.10.0.16-8hz-base.apk (N1).
"""
import argparse, difflib, os, re, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import dexclasses  # noqa: E402
from env import JAVA, JADX  # noqa: E402

LABEL = re.compile(r':[A-Za-z_][A-Za-z0-9_]*')


def baksmali(dex, out, classes=None):
    a = [JAVA, '-cp', JADX, 'com.android.tools.smali.baksmali.Main', 'd', '--debug-info', 'false', '-o', out]
    if classes:
        a += ['--classes', ','.join(classes)]
    subprocess.run(a + [dex], check=True)


def norm(path):
    txt = open(path, encoding='utf-8').read()
    names = {}

    def ren(m):
        return names.setdefault(m.group(0), f':L{len(names)}')
    out = []
    for l in txt.splitlines():
        s = l.strip()
        if not s or s.startswith(('.line', '.local', '.end local', '.restart', '.param', '.end param', '.source')) or s == 'nop':
            continue
        out.append(LABEL.sub(ren, s) if not s.startswith(('const-string', '"', '.annotation', 'value =')) else s)
    return out


def classes_of(dex_bytes):
    return set(dexclasses.classes(dex_bytes))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('patched')
    ap.add_argument('original')
    ap.add_argument('refs', nargs='+')
    ap.add_argument('--skip', default='Lcom/naver/maps/navi/mapmatching/RateGate;')
    a = ap.parse_args()
    tmp = tempfile.mkdtemp(prefix='cmpnaver')
    zp, zo = zipfile.ZipFile(a.patched), zipfile.ZipFile(a.original)
    orig_dex = {n for n in zo.namelist() if n.startswith('classes') and n.endswith('.dex')}
    new_dex = [n for n in zp.namelist() if n.startswith('classes') and n.endswith('.dex') and n not in orig_dex]
    changed = set()
    for n in new_dex:
        p = os.path.join(tmp, 'p_' + n)
        open(p, 'wb').write(zp.read(n))
        cs = classes_of(zp.read(n)) - {a.skip}
        changed |= cs
        baksmali(p, os.path.join(tmp, 'P'), sorted(cs))
    ref_index = {}
    for r in a.refs:
        if '!' in r:
            apk, entry = r.split('!')
            data = zipfile.ZipFile(apk).read(entry)
            r = os.path.join(tmp, 'r_' + os.path.basename(apk) + '_' + entry)
            open(r, 'wb').write(data)
        for c in classes_of(open(r, 'rb').read()):
            ref_index.setdefault(c, r)
    same, diff, missing = 0, [], []
    for c in sorted(changed):
        r = ref_index.get(c)
        if not r:
            missing.append(c); continue
        rd = os.path.join(tmp, 'R', os.path.basename(r))
        baksmali(r, rd, [c])
        rel = c[1:-1] + '.smali'
        x, y = norm(os.path.join(tmp, 'P', rel)), norm(os.path.join(rd, rel))
        if x == y:
            same += 1
        else:
            d = list(difflib.unified_diff(y, x, 'reference', 'morphe', lineterm='', n=1))
            diff.append((c, d))
    print(f'changed classes: {len(changed)}  identical to reference: {same}  different: {len(diff)}  not in reference: {len(missing)}')
    for c in missing:
        print('  not in reference:', c)
    for c, d in diff:
        print('==', c)
        print('\n'.join(d[:60]))


if __name__ == '__main__':
    main()
