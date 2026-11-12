#!/usr/bin/env python3
"""Rewrite Opera's assets/op/abp.manifest for the v1.3.2 adblock-defaults patch.

Verified format (Opera stable 103 / beta 104, manifest sha256 d75fb685…, parser
mirrors z4o.l0 + izd):
  int32  head (0)
  str    base url            (u16 len + utf8, 0 = null)
  4x set (ADBLOCK_URL, CDB_URL, TRACKER_URL, ADBLOCK_CSS):
         u16 count; per entry: str name, str sha256hex
  int16  s (manifest age hint)
  u32    meta count; per entry:
         u32 blob len; blob = { str name; u32 meta len (0 = none);
           meta = { int32 MODE_BITMASK; u8 category (0 RECOMMENDED, 1 OTHER,
                    2 REGIONAL); str s1; str s2; str s3 };
           int32 version; int16 ts }

MODE_BITMASK: bit0 = enabled in BALANCED, bit1 = enabled in ENHANCED.
Custom mode = the user-selected set ("ad_blocking_mode.selected_custom_lists").

Patch operations (v1.3.2 #8, user-confirmed):
  1. every list in the ADBLOCK_URL / ADBLOCK_CSS sets gets bitmask |= 3
     (all lists ON in balanced AND enhanced; adguard_ads + all 34 regionals
     move from custom-only to default-on; ublock/adguard_mobile_ads gain
     balanced)
  2. `opera_fixes` is REMOVED from the ADBLOCK_URL + ADBLOCK_CSS sets and its
     metadata entry is dropped (the bundled compiled assets for its two hashes
     are additionally replaced with the empty list by the build pipeline)
  3. TRACKER_URL (easyprivacy) and CDB_URL (fanboy-cookiemonster) sets stay
     untouched — they follow the tracker-blocker / cookie-banner toggles

Self-test: stock input must round-trip byte-identically before any edit.
"""
import struct, sys, pathlib, hashlib

KINDS = ['ADBLOCK_URL', 'CDB_URL', 'TRACKER_URL', 'ADBLOCK_CSS']
OPERA_FIXES = 'opera_fixes'
STOCK_SHA256 = 'd75fb6859a440bb43593fac72a391659c368a625f0ff9967ff00393d17ae8cc6'

def u16(v): return struct.pack('>H', v)
def i32(v): return struct.pack('>i', v)
def u32(v): return struct.pack('>I', v)
def i16(v): return struct.pack('>h', v)

def wstr(s):
    if s is None: return u16(0)
    b = s.encode('utf-8')
    return u16(len(b)) + b

class R:
    def __init__(self, b): self.b, self.o = b, 0
    def u16(self): v = struct.unpack_from('>H', self.b, self.o)[0]; self.o += 2; return v
    def i32(self): v = struct.unpack_from('>i', self.b, self.o)[0]; self.o += 4; return v
    def u32(self): v = struct.unpack_from('>I', self.b, self.o)[0]; self.o += 4; return v
    def i16(self): v = struct.unpack_from('>h', self.b, self.o)[0]; self.o += 2; return v
    def u8(self): v = self.b[self.o]; self.o += 1; return v
    def take(self, n): v = self.b[self.o:self.o+n]; self.o += n; return v
    def s(self):
        n = self.u16()
        return None if n == 0 else self.take(n).decode('utf-8')

def parse(data):
    r = R(data)
    m = {}
    m['head'] = r.i32()
    m['url'] = r.s()
    m['sets'] = {}
    for kind in KINDS:
        cnt = r.u16()
        m['sets'][kind] = [(r.s(), r.s()) for _ in range(cnt)]
    m['s'] = r.i16()
    cnt = r.u32()
    metas = []
    for _ in range(cnt):
        blen = r.u32()
        blob = r.take(blen)
        ir = R(blob)
        name = ir.s()
        mlen = ir.u32()
        meta = None
        if mlen:
            mr = R(ir.take(mlen))
            meta = dict(bitmask=mr.i32(), category=mr.u8(),
                        s1=mr.s(), s2=mr.s(), s3=mr.s())
        version = ir.i32()
        ts = ir.i16()
        metas.append(dict(name=name, meta=meta, version=version, ts=ts))
    m['metas'] = metas
    assert r.o == len(data), f"trailing bytes: {len(data) - r.o}"
    return m

def serialize(m):
    out = i32(m['head']) + wstr(m['url'])
    for kind in KINDS:
        entries = m['sets'][kind]
        out += u16(len(entries))
        for name, h in entries:
            out += wstr(name) + wstr(h)
    out += i16(m['s'])
    out += u32(len(m['metas']))
    for e in m['metas']:
        inner = wstr(e['name'])
        if e['meta'] is None:
            inner += u32(0)
        else:
            mt = e['meta']
            mblob = (i32(mt['bitmask']) + bytes([mt['category']]) +
                     wstr(mt['s1']) + wstr(mt['s2']) + wstr(mt['s3']))
            inner += u32(len(mblob)) + mblob
        inner += i32(e['version']) + i16(e['ts'])
        out += u32(len(inner)) + inner
    return out

def patch(data):
    # roundtrip self-test
    m = parse(data)
    rt = serialize(m)
    assert rt == data, "round-trip mismatch — parser/serializer drifted from stock format"

    # 1. drop opera_fixes everywhere
    for kind in ['ADBLOCK_URL', 'ADBLOCK_CSS']:
        m['sets'][kind] = [(n, h) for n, h in m['sets'][kind] if n != OPERA_FIXES]
    m['metas'] = [e for e in m['metas'] if e['name'] != OPERA_FIXES]

    # 2. every remaining ADBLOCK_URL/ADBLOCK_CSS list → bitmask |= 3
    adblock_names = ({n for n, _ in m['sets']['ADBLOCK_URL']} |
                     {n for n, _ in m['sets']['ADBLOCK_CSS']})
    flipped = []
    for e in m['metas']:
        if e['name'] in adblock_names and e['meta'] is not None:
            old = e['meta']['bitmask']
            if old != old | 3:
                e['meta']['bitmask'] = old | 3
                flipped.append((e['name'], old, old | 3))
    return serialize(m), flipped

def main():
    src = pathlib.Path(sys.argv[1])
    dst = pathlib.Path(sys.argv[2])
    data = src.read_bytes()
    print(f"input: {src} sha256={hashlib.sha256(data).hexdigest()[:16]}… ({len(data)} B)")
    out, flipped = patch(data)
    dst.write_bytes(out)
    print(f"output: {dst} ({len(out)} B, delta {len(out) - len(data):+d})")
    print(f"opera_fixes removed from ADBLOCK_URL/ADBLOCK_CSS sets + metadata")
    print(f"{len(flipped)} lists promoted to default-on (bitmask |= 3):")
    for name, old, new in sorted(flipped):
        print(f"  {name:32} {old} -> {new}")
    # verify the patched file still parses and report the new mode map
    m = parse(out)
    be = sorted(e['name'] for e in m['metas']
                if e['meta'] and e['meta']['bitmask'] & 3 == 3)
    print(f"lists ON in balanced+enhanced after patch: {len(be)}")
    assert OPERA_FIXES not in be

if __name__ == '__main__':
    main()
