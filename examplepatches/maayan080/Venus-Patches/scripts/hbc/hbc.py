"""HBC98 reader / disassembler / module indexer for inspecting Discord's bundle. Not shipped."""
import struct, mmap, os, pickle, re, array

HERE = os.path.dirname(os.path.abspath(__file__))
OPS = []
for line in open(os.path.join(HERE, 'ops.txt')):
    p = line.split(); OPS.append((p[1], p[2:]))
SIZES = {'Reg8':1,'Reg32':4,'UInt8':1,'UInt16':2,'UInt32':4,'Addr8':1,'Addr32':4,'Imm32':4,'Double':8}
FMT = {'Reg8':'B','Reg32':'<I','UInt8':'B','UInt16':'<H','UInt32':'<I','Addr8':'b','Addr32':'<i','Imm32':'<i','Double':'<d'}
STRING_OPS = {'LoadConstString':[1],'LoadConstStringLongIndex':[1],'GetById':[3],'GetByIdLong':[3],'GetByIdShort':[3],
  'TryGetById':[3],'TryGetByIdLong':[3],'PutByIdLoose':[3],'PutByIdStrict':[3],'PutByIdLooseLong':[3],'PutByIdStrictLong':[3],
  'TryPutByIdLoose':[3],'TryPutByIdStrict':[3],'TryPutByIdLooseLong':[3],'TryPutByIdStrictLong':[3],
  'DefineOwnById':[3],'DefineOwnByIdLong':[3],'GetByIdWithReceiverLong':[4],'DeclareGlobalVar':[0]}
OPINFO = []
for _n, _a in OPS:
    _offs = []; _p = 1
    for _x in _a: _offs.append((_p, FMT[_x])); _p += SIZES[_x]
    OPINFO.append((_n, _offs, _p))
CLOSURES = {'CreateClosure','CreateClosureLongIndex','CreateGenerator','CreateGeneratorLongIndex',
            'CreateBaseClass','CreateBaseClassLongIndex','CreateDerivedClass','CreateDerivedClassLongIndex'}
HEADER = ['fileLength','globalCodeIndex','functionCount','stringKindCount','identifierCount','stringCount',
  'overflowStringCount','stringStorageSize','bigIntCount','bigIntStorageSize','regExpCount','regExpStorageSize',
  'literalValueBufferSize','objKeyBufferSize','objShapeTableCount','numStringSwitchImms','segmentID',
  'cjsModuleCount','functionSourceCount','debugInfoOffset']

def align(x): return (x + 3) & ~3

class HBC:
    def __init__(self, path):
        self.f = open(path, 'rb'); self.b = mmap.mmap(self.f.fileno(), 0, access=mmap.ACCESS_READ)
        self.h = dict(zip(HEADER, struct.unpack_from('<20I', self.b, 32)))
        h = self.h; off = 128
        self.funcOff = off; off += h['functionCount'] * 12
        off += h['stringKindCount'] * 4
        off += h['identifierCount'] * 4
        self.strTab = off; off += h['stringCount'] * 4
        self.ovfTab = off; off += h['overflowStringCount'] * 8
        self.strStore = off; off += h['stringStorageSize']
        self.litOff = align(off)
        self.keyOff = align(self.litOff + h['literalValueBufferSize'])
        self.shapeOff = align(self.keyOff + h['objKeyBufferSize'])
        self._s = {}

    def func(self, i):
        b = self.b; o = self.funcOff + i * 12
        w1, w2 = struct.unpack_from('<II', b, o); frame, flags = b[o + 8], b[o + 11]
        if flags & 0x20:
            large = ((w2 >> 14) & 255) << 24 | (w1 & 0x1ffffff)
            offset, params, loop, size, name, num, nonptr, frame = struct.unpack_from('<8I', b, large)
            return dict(id=i, offset=offset, size=size, name=name, frame=frame, read=b[large+32],
                        write=b[large+33], flags=b[large+36], header=large, expanded=True, num=num, nonptr=nonptr, small=o)
        return dict(id=i, offset=w1 & 0x1ffffff, size=w2 & 0x3fff, name=(w2 >> 14) & 255, frame=frame,
                    read=b[o+9], write=b[o+10] & 0x7f, flags=flags, header=o, expanded=False,
                    num=(w2 >> 22) & 31, nonptr=(w2 >> 27) & 31, small=o)

    def string(self, i):
        if i in self._s: return self._s[i]
        e = struct.unpack_from('<I', self.b, self.strTab + i * 4)[0]
        utf16 = e & 1; off = (e >> 1) & 0x7fffff; ln = e >> 24
        if ln == 255: off, ln = struct.unpack_from('<II', self.b, self.ovfTab + off * 8)
        start = self.strStore + off
        s = self.b[start:start + ln * (2 if utf16 else 1)].decode('utf-16-le' if utf16 else 'latin-1')
        self._s[i] = s; return s

    def instrs(self, f):
        b = self.b; pc = f['offset']; end = pc + f['size']
        while pc < end:
            name, offs, ln = OPINFO[b[pc]]
            yield pc - f['offset'], name, [struct.unpack_from(fm, b, pc + o)[0] for o, fm in offs]
            pc += ln

    def dis(self, f):
        out = []
        for pc, name, vals in self.instrs(f):
            s = f"{pc:6d} {name} {vals}"
            for k in STRING_OPS.get(name, ()): s += f"  ;{self.string(vals[k])!r}"
            if name in CLOSURES: s += f"  ;fn {self.string(self.func(vals[-1])['name'])!r}"
            out.append(s)
        return out

    def fname(self, i): return self.string(self.func(i)['name'])

    def _literal(self, p, count, strings):
        b = self.b; out = []
        while len(out) < count:
            t = b[p]; p += 1
            if t & 0x80: n = ((t & 0x0f) << 8) | b[p]; p += 1
            else: n = t & 0x0f
            tag = (t >> 4) & 7
            for _ in range(n):
                if tag == 7: out.append(struct.unpack_from('<i', b, p)[0]); p += 4
                elif tag == 3: out.append(struct.unpack_from('<d', b, p)[0]); p += 8
                elif tag == 0: out.append(None)
                elif tag == 1: out.append(True)
                elif tag == 2: out.append(False)
                elif tag == 4: out.append(strings(struct.unpack_from('<I', b, p)[0])); p += 4
                elif tag == 5: out.append(strings(struct.unpack_from('<H', b, p)[0])); p += 2
                elif tag == 6: out.append(strings(b[p])); p += 1
        return out

    def array(self, off, count): return self._literal(self.litOff + off, count, lambda i: ('s', i))
    def keys(self, shape):
        kb, n = struct.unpack_from('<II', self.b, self.shapeOff + shape * 8)
        return self._literal(self.keyOff + kb, n, self.string)

def build_index(h):
    b = h.b; children = {}; strings = {}; objkeys = {}; shapes = {}
    for i in range(h.h['functionCount']):
        f = h.func(i); pc = f['offset']; end = pc + f['size']; ch = []; st = set(); ks = set()
        while pc < end:
            name, offs, ln = OPINFO[b[pc]]
            if name in CLOSURES:
                ch.append(struct.unpack_from(offs[-1][1], b, pc + offs[-1][0])[0])
            elif name in STRING_OPS:
                for k in STRING_OPS[name]: st.add(struct.unpack_from(offs[k][1], b, pc + offs[k][0])[0])
            elif name.startswith('NewObjectWithBuffer'):
                sh = struct.unpack_from(offs[-2][1], b, pc + offs[-2][0])[0]
                if sh not in shapes: shapes[sh] = [k for k in h.keys(sh) if isinstance(k, str)]
                ks.update(shapes[sh])
            pc += ln
        children[i] = ch; strings[i] = array.array('I', sorted(st))
        if ks: objkeys[i] = ks
    regs = {}; modules = {}; deps = {}
    for pc, name, vals in h.instrs(h.func(h.h['globalCodeIndex'])):
        if name in ('LoadConstUInt8', 'LoadConstInt'): regs[vals[0]] = vals[1]
        elif name == 'LoadConstZero': regs[vals[0]] = 0
        elif name in ('CreateClosure', 'CreateClosureLongIndex'): regs[vals[0]] = ('f', vals[2])
        elif name in ('NewArrayWithBuffer', 'NewArrayWithBufferLong'): regs[vals[0]] = ('a', vals[3], vals[2])
        elif name == 'NewArray': regs[vals[0]] = ('a', None, 0)
        elif name == 'Call4':
            fv, mid, dv = regs.get(vals[3]), regs.get(vals[4]), regs.get(vals[5])
            if isinstance(fv, tuple) and isinstance(mid, int):
                modules[mid] = fv[1]
                deps[mid] = h.array(dv[1], dv[2]) if dv and dv[1] is not None else []
    return dict(children=children, strings=strings, objkeys=objkeys, modules=modules, deps=deps)

class Bundle:
    def __init__(self, path, cache=None):
        self.h = HBC(path)
        cache = cache or path + '.index.pkl'
        if os.path.exists(cache): d = pickle.load(open(cache, 'rb'))
        else:
            d = build_index(self.h); pickle.dump(d, open(cache, 'wb'))
        self.__dict__.update(d)
        self._tree = {}; self._strs = {}; self._paths = None; self._fn = None
    def tree(self, mid):
        if mid not in self._tree:
            seen = []; st = [self.modules[mid]]; s = set()
            while st:
                f = st.pop()
                if f in s: continue
                s.add(f); seen.append(f); st.extend(self.children[f])
            self._tree[mid] = seen
        return self._tree[mid]
    def strs(self, mid, deep=False):
        key = (mid, deep)
        if key not in self._strs:
            out = set()
            for f in (self.tree(mid) if deep else [self.modules[mid]]):
                for i in self.strings[f]: out.add(self.h.string(i))
                out.update(self.objkeys.get(f, ()))
            self._strs[key] = out
        return self._strs[key]
    def path(self, mid):
        for s in self.strs(mid):
            if '/' in s and re.search(r'\.(tsx?|jsx?)$', s): return s
        return None
    def paths(self):
        if self._paths is None: self._paths = {m: p for m in self.modules if (p := self.path(m))}
        return self._paths
    def grep_path(self, rx): return [(k, v) for k, v in self.paths().items() if re.search(rx, v)]
    def find(self, *need, deep=False):
        return [m for m in self.modules if all(n in self.strs(m, deep) for n in need)]
    def users(self, mid): return [k for k, v in self.deps.items() if mid in v]
    def exports(self, mid):
        """Names assigned onto the exports object (param 6 of the factory) in the factory body."""
        out = []
        for pc, name, vals in self.h.instrs(self.h.func(self.modules[mid])):
            if name.startswith('PutById'): out.append(self.h.string(vals[3]))
        return out
    def fnmods(self, name):
        if self._fn is None:
            self._fn = {}
            for m in self.modules:
                for f in self.tree(m): self._fn.setdefault(self.h.fname(f), set()).add(m)
        return sorted(self._fn.get(name, ()))
    def show(self, mid, n=30):
        return f"{mid} {self.path(mid)} deps={self.deps.get(mid, [])[:10]} {sorted(x for x in self.strs(mid) if len(x) < 40)[:n]}"
