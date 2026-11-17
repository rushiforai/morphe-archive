"""Baksmali every dex of an APK into <out>/smali/classesN/ (debug info off, as the ledger tools expect), write the
srcmap (class -> SourceFile) and a concatenated index per dex (<out>/idx/classesN.txt, 'path:line:text') for fast grep.

usage: decompile.py <base.apk> <out dir> [--jobs 6]
Run it with an app APK as data only: nothing in the APK is executed.
"""
import argparse, concurrent.futures, os, subprocess, sys, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import dexclasses  # noqa: E402
from env import JAVA, JADX  # noqa: E402


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('apk')
    ap.add_argument('out')
    ap.add_argument('--jobs', type=int, default=6)
    a = ap.parse_args()
    dexdir, smali, idx = (os.path.join(a.out, d) for d in ('dex', 'smali', 'idx'))
    for d in (dexdir, smali, idx):
        os.makedirs(d, exist_ok=True)
    names = []
    with zipfile.ZipFile(a.apk) as z:
        for n in z.namelist():
            if n.startswith('classes') and n.endswith('.dex') and '/' not in n:
                open(os.path.join(dexdir, n), 'wb').write(z.read(n))
                names.append(n[:-4])

    def one(n):
        subprocess.run([JAVA, '-cp', JADX, 'com.android.tools.smali.baksmali.Main', 'd', '--debug-info', 'false',
                        '-o', os.path.join(smali, n), os.path.join(dexdir, n + '.dex')], check=True)
        with open(os.path.join(idx, n + '.txt'), 'w', encoding='utf-8', newline='\n') as o:
            base = os.path.join(smali, n)
            for dp, dn, fn in os.walk(base):
                for f in fn:
                    p = os.path.join(dp, f)
                    rel = os.path.relpath(p, base).replace(os.sep, '/')
                    for i, line in enumerate(open(p, encoding='utf-8', errors='replace')):
                        o.write(f'{rel}:{i + 1}:{line}')
        return n

    with concurrent.futures.ThreadPoolExecutor(a.jobs) as ex:
        for n in ex.map(one, sorted(names, key=lambda s: (len(s), s))):
            print('done', n, flush=True)
    with open(os.path.join(a.out, 'srcmap.tsv'), 'w', encoding='utf-8', newline='\n') as o:
        for name, d in dexclasses.dexes(a.apk):
            for c, s in dexclasses.classes(d, source=True):
                o.write(f'{name[:-4]}\t{c[1:-1]}\t{s}\n')
    print(len(names), 'dex ->', a.out)


if __name__ == '__main__':
    sys.exit(main())
