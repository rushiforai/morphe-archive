#!/usr/bin/env python3
"""Parse Opera's assets/op/abp.manifest per z4o.l0 (beta 104.0.5262).
Format: readInt(); h()=url; 4x u0(kind sets); readShort(); k()=metaCount;
per meta: k()-len blob {h()=name, k()-len inner {readInt=bitmask, readByte=category,
h()x3}, readInt=version, readShort=ts}."""
import struct, sys, pathlib

KINDS = ['ADBLOCK_URL', 'CDB_URL', 'TRACKER_URL', 'ADBLOCK_CSS']
CATS = {0: 'RECOMMENDED', 1: 'OTHER', 2: 'REGIONAL'}

class R:
    def __init__(self, b): self.b, self.o = b, 0
    def u16(self): v = struct.unpack_from('>H', self.b, self.o)[0]; self.o += 2; return v
    def i32(self): v = struct.unpack_from('>i', self.b, self.o)[0]; self.o += 4; return v
    def u32(self): v = struct.unpack_from('>I', self.b, self.o)[0]; self.o += 4; return v
    def i16(self): v = struct.unpack_from('>h', self.b, self.o)[0]; self.o += 2; return v
    def byte(self): v = self.b[self.o]; self.o += 1; return v
    def blob(self, n): v = self.b[self.o:self.o+n]; self.o += n; return v
    def s(self):
        n = self.u16()
        return None if n == 0 else self.blob(n).decode('utf-8')

def parse(path):
    r = R(pathlib.Path(path).read_bytes())
    head = r.i32()
    url = r.s()
    sets = {}
    for kind in KINDS:
        cnt = r.u16()
        sets[kind] = [(r.s(), r.s()) for _ in range(cnt)]
    s = r.i16()
    metacnt = r.u32()
    meta = {}
    for _ in range(metacnt):
        blen = r.u32()
        inner = R(r.blob(blen))
        name = inner.s()
        mlen = inner.u32()
        if mlen == 0:
            xi = None
        else:
            m = R(inner.blob(mlen))
            xi = dict(bitmask=m.i32(), category=m.byte(),
                      s1=m.s(), s2=m.s(), s3=m.s())
        version = inner.i32()
        ts = inner.i16()
        meta[name] = dict(xi=xi, version=version, ts=ts)
    leftover = len(r.b) - r.o
    return head, url, sets, s, meta, leftover

head, url, sets, s, meta, leftover = parse(sys.argv[1] if len(sys.argv) > 1 else
    '/home/z/my-project/.tools/recon/abp/assets/op/abp.manifest')
print(f"head={head} url={url!r} s={s} leftover={leftover} meta_entries={len(meta)}")
for kind in KINDS:
    print(f"\n== {kind}: {len(sets[kind])} entries")
    for name, h in sets[kind]:
        m = meta.get(name)
        if m and m['xi']:
            bm, cat = m['xi']['bitmask'], CATS.get(m['xi']['category'], '?')
            balanced = 'B' if bm & 1 else '-'
            enhanced = 'E' if bm & 2 else '-'
            print(f"  [{balanced}{enhanced}] {cat:<12} v{m['version']:<3} {name}  ({m['xi']['s1']!r})")
        else:
            print(f"  [--] no-meta      {name} -> {h[:12]}…")
