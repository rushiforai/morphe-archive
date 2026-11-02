import struct, sys, glob, os, re

def uleb(b, o):
    r = 0; s = 0
    while True:
        x = b[o]; o += 1
        r |= (x & 0x7f) << s
        if not x & 0x80: return r, o
        s += 7

def mutf8(b, o):
    e = b.index(0, o)
    return b[o:e].decode('utf-8', 'replace')

# instruction widths
W = [1]*256
def setw(lo, hi, w):
    for i in range(lo, hi+1): W[i] = w
setw(0x02,0x02,2); setw(0x03,0x03,3); setw(0x05,0x05,2); setw(0x06,0x06,3)
setw(0x08,0x08,2); setw(0x09,0x09,3); setw(0x13,0x13,2); setw(0x14,0x14,3)
setw(0x15,0x16,2); setw(0x17,0x17,3); setw(0x18,0x18,5); setw(0x19,0x19,2)
setw(0x1a,0x1a,2); setw(0x1b,0x1b,3); setw(0x1c,0x1c,2); setw(0x1f,0x20,2)
setw(0x22,0x23,2); setw(0x24,0x26,3); setw(0x29,0x29,2); setw(0x2a,0x2c,3)
setw(0x2d,0x3d,2); setw(0x44,0x6d,2); setw(0x6e,0x72,3); setw(0x74,0x78,3)
setw(0x90,0xaf,2); setw(0xd0,0xe2,2); setw(0xfa,0xfb,4); setw(0xfc,0xfd,3); setw(0xfe,0xff,2)

class Dex:
    def __init__(self, path):
        self.path = path
        b = self.b = open(path, 'rb').read()
        (self.ssz, self.soff, self.tsz, self.toff, self.psz, self.poff,
         self.fsz, self.foff, self.msz, self.moff, self.csz, self.coff) = struct.unpack_from('<12I', b, 56)
        self._strs = {}
    def string(self, i):
        if i in self._strs: return self._strs[i]
        off = struct.unpack_from('<I', self.b, self.soff + 4*i)[0]
        _, o = uleb(self.b, off)
        s = mutf8(self.b, o); self._strs[i] = s; return s
    def type(self, i):
        return self.string(struct.unpack_from('<I', self.b, self.toff + 4*i)[0])
    def proto(self, i):
        sh, rt, po = struct.unpack_from('<3I', self.b, self.poff + 12*i)
        params = []
        if po:
            n = struct.unpack_from('<I', self.b, po)[0]
            params = [self.type(struct.unpack_from('<H', self.b, po+4+2*k)[0]) for k in range(n)]
        return '(' + ''.join(params) + ')' + self.type(rt)
    def field(self, i):
        c, t, n = struct.unpack_from('<HHI', self.b, self.foff + 8*i)
        return self.type(c), self.string(n), self.type(t)
    def method(self, i):
        c, p, n = struct.unpack_from('<HHI', self.b, self.moff + 8*i)
        return self.type(c), self.string(n), self.proto(p)
    def classes(self):
        for k in range(self.csz):
            ci, af, sup, ifs, sf, ann, cd, sv = struct.unpack_from('<8I', self.b, self.coff + 32*k)
            yield k, self.type(ci), af, self.type(sup) if sup != 0xffffffff else None, ifs, cd
    def interfaces(self, off):
        if not off: return []
        n = struct.unpack_from('<I', self.b, off)[0]
        return [self.type(struct.unpack_from('<H', self.b, off+4+2*i)[0]) for i in range(n)]
    def class_data(self, cd):
        """returns (static_fields, inst_fields, direct, virtual); methods: (midx, access, code_off)"""
        if not cd: return [], [], [], []
        b = self.b; o = cd
        sfn, o = uleb(b, o); ifn, o = uleb(b, o); dmn, o = uleb(b, o); vmn, o = uleb(b, o)
        res = []
        for cnt, kind in ((sfn, 'f'), (ifn, 'f')):
            lst = []; idx = 0
            for _ in range(cnt):
                d, o = uleb(b, o); af, o = uleb(b, o); idx += d; lst.append((idx, af))
            res.append(lst)
        for cnt in (dmn, vmn):
            lst = []; idx = 0
            for _ in range(cnt):
                d, o = uleb(b, o); af, o = uleb(b, o); co, o = uleb(b, o)
                idx += d; lst.append((idx, af, co))
            res.append(lst)
        return res
    def insns(self, code_off):
        """yield (unit_offset, opcode, refs) for a code item"""
        b = self.b
        regs, ins, outs, tries, dbg, size = struct.unpack_from('<4HIi'[:0] or '<HHHHII', b, code_off)
        base = code_off + 16
        u = 0
        out = []
        while u < size:
            w0 = struct.unpack_from('<H', b, base + 2*u)[0]
            op = w0 & 0xff
            if op == 0 and w0 != 0:
                if w0 == 0x0100:
                    n = struct.unpack_from('<H', b, base+2*u+2)[0]; u += 4 + n*2
                elif w0 == 0x0200:
                    n = struct.unpack_from('<H', b, base+2*u+2)[0]; u += 2 + n*4
                else:
                    ew, n = struct.unpack_from('<HI', b, base+2*u+2); u += 4 + (n*ew + 1)//2
                continue
            idx = None; kind = None
            if op == 0x1a: idx = struct.unpack_from('<H', b, base+2*u+2)[0]; kind = 's'
            elif op == 0x1b: idx = struct.unpack_from('<I', b, base+2*u+2)[0]; kind = 's'
            elif op in (0x1c, 0x1f, 0x20, 0x22, 0x23): idx = struct.unpack_from('<H', b, base+2*u+2)[0]; kind = 't'
            elif 0x52 <= op <= 0x6d: idx = struct.unpack_from('<H', b, base+2*u+2)[0]; kind = 'f'
            elif 0x6e <= op <= 0x72 or 0x74 <= op <= 0x78: idx = struct.unpack_from('<H', b, base+2*u+2)[0]; kind = 'm'
            out.append((u, op, kind, idx, w0))
            u += W[op]
        return out

def load_all(d):
    return [Dex(p) for p in sorted(glob.glob(d + '/classes*.dex'), key=lambda x: (len(x), x))]



# ----------------------------------------------------------------------------------------------
# Full (register-level) disassembly, for reading branches. `dis --full [--range LO HI]`
# ----------------------------------------------------------------------------------------------
_NAMES = {}
def _n(op, name, fmt): _NAMES[op] = (name, fmt)
for op, name, fmt in [
    (0x00,'nop','10x'),(0x01,'move','12x'),(0x02,'move/from16','22x'),(0x03,'move/16','32x'),(0x04,'move-wide','12x'),
    (0x05,'move-wide/from16','22x'),(0x06,'move-wide/16','32x'),(0x07,'move-object','12x'),(0x08,'move-object/from16','22x'),
    (0x09,'move-object/16','32x'),(0x0a,'move-result','11x'),(0x0b,'move-result-wide','11x'),(0x0c,'move-result-object','11x'),
    (0x0d,'move-exception','11x'),(0x0e,'return-void','10x'),(0x0f,'return','11x'),(0x10,'return-wide','11x'),
    (0x11,'return-object','11x'),(0x12,'const/4','11n'),(0x13,'const/16','21s'),(0x14,'const','31i'),(0x15,'const/high16','21h'),
    (0x16,'const-wide/16','21s'),(0x17,'const-wide/32','31i'),(0x18,'const-wide','51l'),(0x19,'const-wide/high16','21h'),
    (0x1a,'const-string','21c'),(0x1b,'const-string/jumbo','31c'),(0x1c,'const-class','21c'),(0x1d,'monitor-enter','11x'),
    (0x1e,'monitor-exit','11x'),(0x1f,'check-cast','21c'),(0x20,'instance-of','22c'),(0x21,'array-length','12x'),
    (0x22,'new-instance','21c'),(0x23,'new-array','22c'),(0x24,'filled-new-array','35c'),(0x25,'filled-new-array/range','3rc'),
    (0x26,'fill-array-data','31t'),(0x27,'throw','11x'),(0x28,'goto','10t'),(0x29,'goto/16','20t'),(0x2a,'goto/32','30t'),
    (0x2b,'packed-switch','31t'),(0x2c,'sparse-switch','31t'),
    (0x2d,'cmpl-float','23x'),(0x2e,'cmpg-float','23x'),(0x2f,'cmpl-double','23x'),(0x30,'cmpg-double','23x'),(0x31,'cmp-long','23x'),
    (0x32,'if-eq','22t'),(0x33,'if-ne','22t'),(0x34,'if-lt','22t'),(0x35,'if-ge','22t'),(0x36,'if-gt','22t'),(0x37,'if-le','22t'),
    (0x38,'if-eqz','21t'),(0x39,'if-nez','21t'),(0x3a,'if-ltz','21t'),(0x3b,'if-gez','21t'),(0x3c,'if-gtz','21t'),(0x3d,'if-lez','21t'),
    (0x6e,'invoke-virtual','35c'),(0x6f,'invoke-super','35c'),(0x70,'invoke-direct','35c'),(0x71,'invoke-static','35c'),
    (0x72,'invoke-interface','35c'),(0x74,'invoke-virtual/range','3rc'),(0x75,'invoke-super/range','3rc'),
    (0x76,'invoke-direct/range','3rc'),(0x77,'invoke-static/range','3rc'),(0x78,'invoke-interface/range','3rc'),
]: _n(op, name, fmt)
for i, nm in enumerate(['aget','aget-wide','aget-object','aget-boolean','aget-byte','aget-char','aget-short',
                        'aput','aput-wide','aput-object','aput-boolean','aput-byte','aput-char','aput-short']): _n(0x44+i, nm, '23x')
for i, nm in enumerate(['iget','iget-wide','iget-object','iget-boolean','iget-byte','iget-char','iget-short',
                        'iput','iput-wide','iput-object','iput-boolean','iput-byte','iput-char','iput-short']): _n(0x52+i, nm, '22c')
for i, nm in enumerate(['sget','sget-wide','sget-object','sget-boolean','sget-byte','sget-char','sget-short',
                        'sput','sput-wide','sput-object','sput-boolean','sput-byte','sput-char','sput-short']): _n(0x60+i, nm, '21c')
for i, nm in enumerate(['neg-int','not-int','neg-long','not-long','neg-float','neg-double','int-to-long','int-to-float','int-to-double',
                        'long-to-int','long-to-float','long-to-double','float-to-int','float-to-long','float-to-double',
                        'double-to-int','double-to-long','double-to-float','int-to-byte','int-to-char','int-to-short']): _n(0x7b+i, nm, '12x')
_arith = ['add','sub','mul','div','rem','and','or','xor','shl','shr','ushr']
for i, nm in enumerate([a+'-int' for a in _arith]+[a+'-long' for a in _arith]+[a+'-float' for a in _arith[:5]]+[a+'-double' for a in _arith[:5]]):
    _n(0x90+i, nm, '23x'); _n(0xb0+i, nm+'/2addr', '12x')
for i, nm in enumerate(['add-int/lit16','rsub-int','mul-int/lit16','div-int/lit16','rem-int/lit16','and-int/lit16','or-int/lit16','xor-int/lit16']): _n(0xd0+i, nm, '22s')
for i, nm in enumerate(['add-int/lit8','rsub-int/lit8','mul-int/lit8','div-int/lit8','rem-int/lit8','and-int/lit8','or-int/lit8','xor-int/lit8','shl-int/lit8','shr-int/lit8','ushr-int/lit8']): _n(0xd8+i, nm, '22b')

def _s(v, bits): return v - (1 << bits) if v >= (1 << (bits-1)) else v

def full_insns(d, co, lo=0, hi=1 << 30):
    """yield (unit, text) with registers, literals, branch targets (absolute unit offsets)."""
    b = d.b
    import struct as _st
    regs, ins, outs, tries, dbg, size = _st.unpack_from('<HHHHII', b, co)
    base = co + 16
    W16 = lambda k: _st.unpack_from('<H', b, base + 2*k)[0]
    u = 0
    while u < size:
        w0 = W16(u); op = w0 & 0xff
        if op == 0 and w0 != 0:
            if w0 == 0x0100: n = W16(u+1); w = 4 + n*2
            elif w0 == 0x0200: n = W16(u+1); w = 2 + n*4
            else: ew, n = _st.unpack_from('<HI', b, base+2*u+2); w = 4 + (n*ew + 1)//2
            if lo <= u <= hi: yield u, '.payload (%d units)' % w
            u += w; continue
        name, fmt = _NAMES.get(op, ('op%02x' % op, '10x'))
        A = (w0 >> 8) & 0xff; a4 = (w0 >> 8) & 0xf; b4 = (w0 >> 12) & 0xf
        t = ''
        if fmt == '10x': t = name
        elif fmt == '12x': t = '%s v%d, v%d' % (name, a4, b4)
        elif fmt == '11n': t = '%s v%d, #%d' % (name, a4, _s(b4, 4))
        elif fmt == '11x': t = '%s v%d' % (name, A)
        elif fmt == '10t': t = '%s ->%04x' % (name, u + _s(A, 8))
        elif fmt == '20t': t = '%s ->%04x' % (name, u + _s(W16(u+1), 16))
        elif fmt == '22x': t = '%s v%d, v%d' % (name, A, W16(u+1))
        elif fmt == '21t': t = '%s v%d, ->%04x' % (name, A, u + _s(W16(u+1), 16))
        elif fmt == '21s': t = '%s v%d, #%d' % (name, A, _s(W16(u+1), 16))
        elif fmt == '21h': t = '%s v%d, #%d<<16' % (name, A, _s(W16(u+1), 16))
        elif fmt == '21c':
            k = W16(u+1)
            ref = d.string(k) if op in (0x1a,) else d.type(k) if op in (0x1c,0x1f,0x22) else '%s.%s:%s' % d.field(k)
            t = '%s v%d, %s' % (name, A, repr(ref) if op == 0x1a else ref)
        elif fmt == '23x': t = '%s v%d, v%d, v%d' % (name, A, W16(u+1) & 0xff, W16(u+1) >> 8)
        elif fmt == '22b': t = '%s v%d, v%d, #%d' % (name, A, W16(u+1) & 0xff, _s(W16(u+1) >> 8, 8))
        elif fmt == '22t': t = '%s v%d, v%d, ->%04x' % (name, a4, b4, u + _s(W16(u+1), 16))
        elif fmt == '22s': t = '%s v%d, v%d, #%d' % (name, a4, b4, _s(W16(u+1), 16))
        elif fmt == '22c':
            k = W16(u+1)
            ref = d.type(k) if op in (0x20, 0x23) else '%s.%s:%s' % d.field(k)
            t = '%s v%d, v%d, %s' % (name, a4, b4, ref)
        elif fmt == '30t': t = '%s ->%04x' % (name, u + _s(W16(u+1) | (W16(u+2) << 16), 32))
        elif fmt == '32x': t = '%s v%d, v%d' % (name, W16(u+1), W16(u+2))
        elif fmt == '31i': t = '%s v%d, #%d' % (name, A, _s(W16(u+1) | (W16(u+2) << 16), 32))
        elif fmt == '31t': t = '%s v%d, payload@%04x' % (name, A, u + _s(W16(u+1) | (W16(u+2) << 16), 32))
        elif fmt == '31c': t = '%s v%d, %r' % (name, A, d.string(W16(u+1) | (W16(u+2) << 16)))
        elif fmt == '51l': t = '%s v%d, #%d' % (name, A, W16(u+1) | (W16(u+2)<<16) | (W16(u+3)<<32) | (W16(u+4)<<48))
        elif fmt == '35c':
            k = W16(u+1); w2 = W16(u+2); cnt = b4
            rg = [w2 & 0xf, (w2 >> 4) & 0xf, (w2 >> 8) & 0xf, (w2 >> 12) & 0xf, a4][:cnt]
            t = '%s {%s}, %s.%s%s' % (name, ', '.join('v%d' % r for r in rg), *d.method(k))
        elif fmt == '3rc':
            k = W16(u+1); first = W16(u+2)
            t = '%s {v%d..v%d}, %s.%s%s' % (name, first, first + A - 1, *d.method(k))
        if lo <= u <= hi: yield u, t
        u += W[op]

# ----------------------------------------------------------------------------------------------
# CLI
# ----------------------------------------------------------------------------------------------
def _fmt(d, kind, idx):
    if kind == 's': return repr(d.string(idx))
    if kind == 't': return d.type(idx)
    if kind == 'f': return '%s.%s:%s' % d.field(idx)
    if kind == 'm': return '%s.%s%s' % d.method(idx)
    return ''

def _index(dexes):
    cls = {}
    for di, d in enumerate(dexes):
        for k, name, af, sup, ifs, cd in d.classes():
            cls[name] = (di, sup, d.interfaces(ifs), cd)
    return cls

def _methods(d, cd):
    sf, inf, dm, vm = d.class_data(cd)
    return sf, inf, dm + vm

def main(argv):
    import argparse, pickle
    ap = argparse.ArgumentParser(description='Poke around the classes*.dex files of an unpacked APK.')
    ap.add_argument('dexdir', help='directory containing classes*.dex (unzip them from the APK)')
    sub = ap.add_subparsers(dest='cmd', required=True)
    p = sub.add_parser('strings', help='regex over all dex strings'); p.add_argument('regex')
    p = sub.add_parser('strref', help='methods that const-string the given exact strings'); p.add_argument('strs', nargs='+')
    p = sub.add_parser('callers', help='who calls Class.method'); p.add_argument('cls'); p.add_argument('method')
    p = sub.add_parser('class', help='fields + methods of a class'); p.add_argument('cls')
    p = sub.add_parser('dis', help='dump a class: per method register counts and referenced strings/types/fields/calls')
    p.add_argument('cls'); p.add_argument('methods', nargs='*')
    p.add_argument('--full', action='store_true', help='full register-level listing with branch targets')
    p.add_argument('--range', nargs=2, type=lambda x: int(x, 16), metavar=('LO', 'HI'), help='hex unit offsets, with --full')
    p = sub.add_parser('subclasses', help='classes extending / implementing a type'); p.add_argument('cls')
    a = ap.parse_args(argv)
    dexes = load_all(a.dexdir)

    if a.cmd == 'strings':
        import re
        pat = re.compile(a.regex)
        for di, d in enumerate(dexes):
            for i in range(d.ssz):
                s = d.string(i)
                if pat.search(s): print(di + 1, i, repr(s))
        return
    if a.cmd == 'strref':
        targets = set(a.strs)
        for di, d in enumerate(dexes):
            want = {i: d.string(i) for i in range(d.ssz) if d.string(i) in targets}
            if not want: continue
            for k, name, af, sup, ifs, cd in d.classes():
                for mi, acc, co in _methods(d, cd)[2]:
                    if not co: continue
                    for u, op, kind, idx, w0 in d.insns(co):
                        if kind == 's' and idx in want:
                            print(want[idx], '| dex', di + 1, name, *d.method(mi)[1:], '@%04x' % u)
        return
    if a.cmd == 'callers':
        for di, d in enumerate(dexes):
            ids = {i for i in range(d.msz) if d.method(i)[:2] == (a.cls, a.method)}
            if not ids: continue
            for k, name, af, sup, ifs, cd in d.classes():
                for mi, acc, co in _methods(d, cd)[2]:
                    if not co: continue
                    if any(kind == 'm' and idx in ids for u, op, kind, idx, w0 in d.insns(co)):
                        print('from', name, *d.method(mi)[1:], '| dex', di + 1)
        return
    cls = _index(dexes)
    if a.cmd == 'subclasses':
        for n, (di, sup, ifs, cd) in cls.items():
            if sup == a.cls or a.cls in ifs: print(n, 'extends', sup, ifs)
        return
    di, sup, ifs, cd = cls[a.cls]; d = dexes[di]
    sf, inf, ms = _methods(d, cd)
    print(a.cls, '| dex', di + 1, '| super', sup, '| implements', ifs)
    if a.cmd == 'class':
        for i, acc in sf + inf: print('  F', *d.field(i)[1:], hex(acc))
        for i, acc, co in ms: print('  M', *d.method(i)[1:], hex(acc))
        return
    if a.cmd == 'dis':
        import struct
        for i, acc, co in ms:
            m = d.method(i)
            if a.methods and m[1] not in a.methods: continue
            if not co: print('==', *m[1:], '(abstract/native)'); continue
            regs, ins, outs, tries, dbg, size = struct.unpack_from('<HHHHII', d.b, co)
            print('==', *m[1:], '| registers=%d ins=%d (p0=v%d) locals=%d tries=%d' % (regs, ins, regs - ins, regs - ins, tries))
            if a.full:
                lo, hi = a.range or (0, 1 << 30)
                for u, t in full_insns(d, co, lo, hi): print('   %04x  %s' % (u, t))
                continue
            for u, op, kind, idx, w0 in d.insns(co):
                if kind: print('   %04x  op=%02x  %s' % (u, op, _fmt(d, kind, idx)))

if __name__ == '__main__':
    main(sys.argv[1:])
