"""List class descriptors defined in .dex files (optionally only those under package prefixes).

usage: dexclasses.py <apk or dex>... [--pkg Lcom/naver/maps/navi/,Lcom/naver/map/core/navigation/] [--count]
Prints "<dex name>\t<class descriptor>" (or per-dex counts with --count).
       dexclasses.py <apk> --srcmap out.tsv  writes "<dex>\t<class path>\t<SourceFile>" for every class. Apps whose class
       names are obfuscated per version keep the original source file name; scan_smali.py --srcmap keys on it.
"""
import argparse, struct, sys, zipfile


def uleb(b, o):
    r = s = 0
    while True:
        x = b[o]; o += 1
        r |= (x & 0x7f) << s; s += 7
        if x < 0x80:
            return r, o


def classes(d, source=False):
    """yield class descriptors, or (descriptor, SourceFile or '') with source=True"""
    sid_sz, sid_off, tid_sz, tid_off = struct.unpack_from('<4I', d, 0x38)
    cd_sz, cd_off = struct.unpack_from('<2I', d, 0x60)

    def string(i):
        off = struct.unpack_from('<I', d, sid_off + 4 * i)[0]
        _, o = uleb(d, off)
        return d[o:d.index(b'\0', o)].decode('utf-8', 'replace')
    for k in range(cd_sz):
        tidx = struct.unpack_from('<I', d, cd_off + 32 * k)[0]
        c = string(struct.unpack_from('<I', d, tid_off + 4 * tidx)[0])
        if source:
            sidx = struct.unpack_from('<I', d, cd_off + 32 * k + 16)[0]
            yield c, ('' if sidx == 0xffffffff else string(sidx))
        else:
            yield c


def method_refs(d):
    """yield 'Lclass;->name' for every method_id (methods the dex defines or calls)"""
    sid_sz, sid_off, tid_sz, tid_off = struct.unpack_from('<4I', d, 0x38)
    mid_sz, mid_off = struct.unpack_from('<2I', d, 0x58)

    def string(i):
        off = struct.unpack_from('<I', d, sid_off + 4 * i)[0]
        _, o = uleb(d, off)
        return d[o:d.index(b'\0', o)].decode('utf-8', 'replace')
    for k in range(mid_sz):
        cls, _proto, name = struct.unpack_from('<HHI', d, mid_off + 8 * k)
        yield string(struct.unpack_from('<I', d, tid_off + 4 * cls)[0]) + '->' + string(name)


def dexes(path):
    if path.endswith('.dex'):
        yield path.replace('\\', '/').split('/')[-1], open(path, 'rb').read()
        return
    with zipfile.ZipFile(path) as z:
        for n in sorted(z.namelist(), key=lambda n: (len(n), n)):
            if n.startswith('classes') and n.endswith('.dex'):
                yield n, z.read(n)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('inputs', nargs='+')
    ap.add_argument('--pkg', default='')
    ap.add_argument('--count', action='store_true')
    ap.add_argument('--refs', help='comma list of substrings; print dexes whose method_ids match (e.g. ->requestLocationUpdates)')
    ap.add_argument('--srcmap', help='write "<dex>\\t<class path>\\t<SourceFile>" for every class to this file')
    a = ap.parse_args()
    pk = [p for p in a.pkg.split(',') if p]
    if a.srcmap:
        with open(a.srcmap, 'w', encoding='utf-8', newline='\n') as o:
            for inp in a.inputs:
                for name, d in dexes(inp):
                    for c, s in classes(d, source=True):
                        o.write(f'{name[:-4]}\t{c[1:-1]}\t{s}\n')
        return
    for inp in a.inputs:
        for name, d in dexes(inp):
            if a.refs:
                keys = a.refs.split(',')
                for r in sorted({r for r in method_refs(d) if any(k in r for k in keys)}):
                    print(f'{name}\t{r}')
                continue
            hits = [c for c in classes(d) if not pk or c.startswith(tuple(pk))]
            if a.count:
                if hits:
                    print(f'{name}\t{len(hits)}')
            else:
                for c in hits:
                    print(f'{name}\t{c}')


if __name__ == '__main__':
    sys.exit(main())
