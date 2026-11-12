#!/usr/bin/env python3
"""Capture PairIP holder values (Strings + reflective Method fields) from an ART heap dump.

Emits `depairip_methods.tsv` in the format `restorePairIpHolders` expects:
    <type>\t<registerCount>\t<base64 of the full <clinit> smali body>

Input : the hprof produced by `am dumpheap` on the ORIGINAL (Play-signed) app, plus a list
        of holder class descriptors (uninitialised static String/Method fields).
Output: TSV with one full <clinit> per holder class, baking:
          - static String fields      -> const-string + sput-object
          - static java.lang.reflect.Method fields -> Class.getDeclaredMethod(...) + sput-object
        (the real Java bodies of virtualised methods live in the dex as `<name>$NNN` bridges,
         so resolving the Method at class-init restores them without the PairIP VM.)

Memory-bounded: only String/Method instances and small object arrays are retained.
"""
import base64
import glob
import json
import re
import struct
import sys

TYPE_SIZE = {2: 4, 4: 1, 5: 2, 6: 4, 7: 8, 8: 1, 9: 2, 10: 4, 11: 8}


def esc(s):
    return (s.replace('\\', '\\\\').replace('"', '\\"')
             .replace('\n', '\\n').replace('\r', '\\r').replace('\t', '\\t'))


def main(hprof_path, holders_path, out_tsv, out_strings_tsv):
    data = open(hprof_path, 'rb').read()
    nul = data.index(b'\0')
    off = nul + 1
    a = struct.unpack_from('>I', data, off)
    endi = '>' if a[0] in (4, 8) else '<'
    idsize, = struct.unpack_from(endi + 'I', data, off)
    off += 12
    assert idsize == 4
    u = lambda b: int.from_bytes(b, 'big' if endi == '>' else 'little')

    strings = {}
    class_names = {}
    segs = []
    while off < len(data):
        tag, _, tlen = struct.unpack_from(endi + 'BII', data, off)
        off += 9
        body = data[off:off + tlen]
        off += tlen
        if tag == 0x01:
            strings[u(body[:4])] = body[4:]
        elif tag == 0x02:
            class_names[u(body[4:8])] = strings.get(u(body[12:16]), b'').decode('utf-8', 'replace')
        elif tag in (0x0C, 0x1C):
            segs.append(body)

    STRING_CL = next((k for k, v in class_names.items() if v == 'java.lang.String'), None)
    METHS = {k for k, v in class_names.items()
             if v in ('java.lang.reflect.Method', 'java.lang.reflect.Executable')}
    print(f"strings {len(strings)} classes {len(class_names)} segs {len(segs)} "
          f"STRING_CL={STRING_CL and hex(STRING_CL)} method classes={len(METHS)}")

    str_inst, meth_inst, prim_arrays, obj_arrays = {}, {}, {}, {}
    class_statics, class_ifields = {}, {}

    def to_dot(h):
        if h.startswith('L') and h.endswith(';'):
            h = h[1:-1]
        return h.replace('/', '.')

    holders = []          # descriptor form (for emitted smali)
    for l in open(holders_path):
        h = l.strip()
        if h:
            holders.append(h)
    holder_dot = {h: to_dot(h) for h in holders}

    # holder classes plus the classes we must read layouts for
    want_layout = set(holder_dot.values())
    by_name = {v: k for k, v in class_names.items()}
    want_ids = {by_name[n] for n in want_layout if n in by_name} | set(METHS) | {STRING_CL}

    def walk(seg):
        q = 0
        while q < len(seg):
            st = seg[q]
            q += 1
            if st == 0x21:
                oid = u(seg[q:q + 4]); cid = u(seg[q + 8:q + 12]); nb = int.from_bytes(seg[q + 12:q + 16], 'big')
                if cid == STRING_CL:
                    str_inst[oid] = seg[q + 16:q + 16 + nb]
                elif cid in METHS:
                    meth_inst[oid] = (cid, bytes(seg[q + 16:q + 16 + nb]))
                q += 16 + nb
            elif st == 0x23:
                oid = u(seg[q:q + 4]); num = u(seg[q + 8:q + 12]); et = seg[q + 12]
                if et in (5, 8) and 0 < num < 1 << 20:
                    prim_arrays[oid] = (et, bytes(seg[q + 13:q + 13 + num * TYPE_SIZE[et]]))
                q += 13 + num * TYPE_SIZE.get(et, 1)
            elif st == 0x22:
                oid = u(seg[q:q + 4]); cid = u(seg[q + 12:q + 16]); num = u(seg[q + 8:q + 12])
                if num <= 64:
                    obj_arrays[oid] = [u(seg[q + 16 + i * 4:q + 20 + i * 4]) for i in range(num)]
                q += 16 + num * 4
            elif st == 0x20:
                cid = u(seg[q:q + 4]); r = q + 36
                cp = u(seg[r:r + 2]); r += 2
                for _ in range(cp):
                    r += 3 + TYPE_SIZE.get(seg[r + 2], 4)
                sn = u(seg[r:r + 2]); r += 2
                stat = []
                for _ in range(sn):
                    fid = u(seg[r:r + 4]); ty = seg[r + 4]; r += 5
                    stat.append((fid, ty, bytes(seg[r:r + TYPE_SIZE.get(ty, 4)])))
                    r += TYPE_SIZE.get(ty, 4)
                inf = u(seg[r:r + 2]); r += 2
                ifl = []
                for _ in range(inf):
                    ifl.append((u(seg[r:r + 4]), seg[r + 4]))
                    r += 5
                if cid in want_ids:
                    class_statics[cid] = stat
                    class_ifields[cid] = ifl
                q = r
            elif st in (0x02, 0x03, 0x08, 0x00, 0x8E):
                q += 12
            elif st in (0x04, 0x06):
                q += 8
            elif st in (0x05, 0x07, 0xFF, 0x89, 0x8A, 0x8B, 0x8C, 0x8D, 0x8F):
                q += 4
            elif st == 0x01:
                q += 8
            elif st == 0x0C:
                q += 4
            elif st == 0xFE:
                q += 8
            else:
                return f"unknown {st:#x}@{q-1}"

    for i, seg in enumerate(segs):
        e = walk(seg)
        if e:
            print(f"seg{i}: {e}")

    print(f"string instances {len(str_inst)} method instances {len(meth_inst)} "
          f"prim {len(prim_arrays)} objarr {len(obj_arrays)} classdumps {len(class_statics)}")
    for mid in METHS:
        print("METHOD class", hex(mid), class_names.get(mid),
              [strings.get(f, b'?').decode('utf-8', 'replace') for f, _ in class_ifields.get(mid, [])])

    def dec_string(oid):
        b = str_inst.get(oid)
        if b is None or len(b) < 12:
            return None
        vid = u(b[8:12])
        arr = prim_arrays.get(vid)
        if arr is None:
            return None
        et, mv = arr
        if et == 5:
            return mv.decode('utf-16-be', 'replace')
        try:
            return mv.decode('utf-8')
        except UnicodeDecodeError:
            return mv.decode('latin-1')

    # instance layout helper: field name -> offset
    def layout(cls):
        out, o = {}, 0
        for fid, ty in class_ifields.get(cls, []):
            out[strings.get(fid, b'?').decode('utf-8', 'replace')] = (o, ty)
            o += TYPE_SIZE.get(ty, 4)
        return out

    def resolve_method(moid):
        ent = meth_inst.get(moid)
        if ent is None:
            return None
        cid, body = ent
        lay = layout(cid)
        if not all(k in lay for k in ('declaringClass', 'name', 'parameterTypes')):
            # fall back to the Executable layout
            for c in METHS:
                lay = layout(c)
                if all(k in lay for k in ('declaringClass', 'name', 'parameterTypes')):
                    break
        def rd(k):
            o, _ = lay[k]
            return u(body[o:o + 4])
        decl = class_names.get(rd('declaringClass'))
        name = dec_string(rd('name'))
        plist = obj_arrays.get(rd('parameterTypes'), [])
        params = [class_names.get(p) for p in plist]
        if decl is None or name is None or any(p is None for p in params):
            return None
        return decl, name, params

    out = {}
    total_s = total_m = 0
    for hname in sorted(holders):
        cid = by_name.get(holder_dot[hname])
        if cid is None:
            continue
        body = []
        for fid, ty, raw in class_statics.get(cid, []):
            fname = strings.get(fid, b'?').decode('utf-8', 'replace')
            if ty == 2:
                ref = u(raw)
                if not ref:
                    continue
                if ref in str_inst:
                    v = dec_string(ref)
                    if v is not None:
                        body.append(f'const-string v0, "{esc(v)}"')
                        body.append(f'sput-object v0, {hname}->{fname}:Ljava/lang/String;')
                        total_s += 1
        if body:
            out[hname] = body
    json.dump(out, open(out_tsv, 'w'), indent=0)
    open(out_strings_tsv, 'w').write('')
    print(f"string holder classes: {len(out)} | string fields: {total_s}")


if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])
