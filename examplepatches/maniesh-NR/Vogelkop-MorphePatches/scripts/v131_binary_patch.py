#!/usr/bin/env python3
"""v1.3.1 binary patcher — applies the v1.3.1 patch set at the BYTE level.

apktool-free replacement for scripts/apply_v131_patches.py. Never decodes or
recompiles resources: dex edits are equal-length instruction replacements,
manifest/arsc edits are surgical byte cuts. All edits assert the expected
original bytes first and abort on mismatch; dex adler32+SHA-1 are recomputed.

Usage:
  v131_binary_patch.py --inspect APK
  v131_binary_patch.py --patch APK OUT.apk
"""
import argparse
import hashlib
import struct
import sys
import zipfile
import zlib

# --- canonical Dalvik opcodes (verified against androguard DALVIK_OPCODES_FORMAT) ---
OP_MOVE_RESULT = 0x0a
OP_RETURN = 0x0f
OP_RETURN_VOID = 0x0e
OP_CONST4 = 0x12
OP_CONST_STRING = 0x1a
OP_CONST_STRING_JUMBO = 0x1b
OP_IF_EQZ = 0x38
OP_IF_NEZ = 0x39
OP_IGET_BOOLEAN = 0x55
INVOKE_OPS = set(range(0x6e, 0x73)) | set(range(0x74, 0x79))

# --- anchors (identical to docs/v1.3.1/patches/) ---
WELCOME = 'Lcom/opera/android/startup/WelcomeActivity;'
SETTINGS_MGR = 'Lcom/opera/android/settings/SettingsManager;'
SM_I = '(Ljava/lang/String;)Z'
R65 = 'Lr65;'
MM6 = 'Lmm6;'
WDN = 'Lwdn;'
GB_CLASS = 'Landroid/content/SharedPreferences;'
GB_NAME = 'getBoolean'
GB_PROTO = '(Ljava/lang/String;Z)Z'
EULA_KEY = b'eula_accepted.gdpr'
DEFBR_KEY = b'show_enable_default_browser_dialog_on_startpage'
VPN_COMPONENTS = (
    'com.opera.android.vpn.VpnProReceiver',
    'com.opera.android.vpn.quick_settings_tile.VpnProQuickSettingsTileService',
    'com.opera.android.vpn.app_widget.VpnProAppWidget',
)
BLANK_NAMES = (
    'vpn_pro_title',
    'omnibox_suggested_vpn_pro_title',
    'switch_to_vpn_pro_button',
    'switch_to_vpn_pro_banner_body',
    'switch_to_vpn_pro_reminder_dialog_title',
)
ANDROID_NS = 'http://schemas.android.com/apk/res/android'


def u16(b, o):
    return struct.unpack_from('<H', b, o)[0]


def u32(b, o):
    return struct.unpack_from('<I', b, o)[0]


def die(msg):
    print(f'FAIL: {msg}', file=sys.stderr)
    sys.exit(1)


# ===========================================================================
# instruction walker
# ===========================================================================

_S1 = ({0x00, 0x01, 0x04, 0x07} | set(range(0x0a, 0x13))
       | {0x1d, 0x1e, 0x21, 0x27, 0x28}
       | set(range(0x7b, 0x90)) | set(range(0xb0, 0xd0)))
_S2 = ({0x02, 0x05, 0x08, 0x13, 0x15, 0x16, 0x19, 0x1a, 0x1c, 0x1f, 0x20,
        0x22, 0x23, 0x29}
       | set(range(0x2d, 0x3e)) | set(range(0x44, 0x6e)) | set(range(0x90, 0xb0))
       | set(range(0xd0, 0xe3)) | {0xfe, 0xff})
_S3 = ({0x03, 0x06, 0x09, 0x14, 0x17, 0x1b, 0x24, 0x25, 0x26, 0x2a, 0x2b,
        0x2c}
       | set(range(0x6e, 0x73)) | set(range(0x74, 0x79)) | {0xfc, 0xfd})
_S4 = {0xfa, 0xfb}
_S5 = {0x18}


def walk_insns(insns):
    """Yield (unit_off, opcode, size_units). Raises on unknown opcode."""
    n = len(insns) // 2
    i = 0
    while i < n:
        u0 = u16(insns, 2 * i)
        op = u0 & 0xff
        hi = u0 >> 8
        if op == 0x00 and hi in (1, 2, 3):  # payload pseudo-instruction
            if hi == 1:
                total = 4 + 2 * u16(insns, 2 * (i + 1))
            elif hi == 2:
                total = 2 + 4 * u16(insns, 2 * (i + 1))
            else:
                ew = u16(insns, 2 * (i + 1))
                cnt = u32(insns, 2 * (i + 2))
                total = 4 + (ew * cnt + 1) // 2
            yield (i, 0x00, total)
            i += total
            continue
        if op in _S1:
            s = 1
        elif op in _S2:
            s = 2
        elif op in _S3:
            s = 3
        elif op in _S4:
            s = 4
        elif op in _S5:
            s = 5
        else:
            raise ValueError(f'unknown opcode 0x{op:02x} at unit {i}')
        yield (i, op, s)
        i += s


def const4(reg, val):
    if not (0 <= reg <= 15):
        die(f'const/4: register v{reg} out of 4-bit range')
    return bytes([OP_CONST4, (val << 4) | reg])


CONST4_RET = bytes([OP_CONST4, 0x00, OP_RETURN, 0x00])  # const/4 v0,0; return v0


# ===========================================================================
# DEX
# ===========================================================================

class Dex:
    def __init__(self, data, name):
        self.data = bytearray(data)
        self.name = name
        if bytes(self.data[0:4]) != b'dex\n':
            die(f'{name}: not a dex')
        if bytes(self.data[4:7]) not in (b'035', b'036', b'037', b'038', b'039'):
            die(f'{name}: unsupported dex version')
        (self.str_n, self.str_off) = struct.unpack_from('<II', self.data, 56)
        (self.typ_n, self.typ_off) = struct.unpack_from('<II', self.data, 64)
        (self.pro_n, self.pro_off) = struct.unpack_from('<II', self.data, 72)
        (self.met_n, self.met_off) = struct.unpack_from('<II', self.data, 88)
        (self.cls_n, self.cls_off) = struct.unpack_from('<II', self.data, 96)
        self._strcache = [None] * self.str_n

    def uleb(self, off):
        result = 0
        shift = 0
        while True:
            b = self.data[off]
            off += 1
            result |= (b & 0x7f) << shift
            if not b & 0x80:
                return result, off
            shift += 7

    def raw_string(self, idx):
        v = self._strcache[idx]
        if v is not None:
            return v
        off = u32(self.data, self.str_off + 4 * idx)
        _, off = self.uleb(off)
        end = self.data.index(b'\x00', off)
        v = bytes(self.data[off:end])
        self._strcache[idx] = v
        return v

    def find_string(self, target):
        for i in range(self.str_n):
            if self.raw_string(i) == target:
                return i
        return -1

    def type_desc(self, idx):
        return self.raw_string(u32(self.data, self.typ_off + 4 * idx)).decode('utf-8', 'replace')

    def proto_str(self, idx):
        base = self.pro_off + 12 * idx
        ret = self.type_desc(u32(self.data, base + 4))
        po = u32(self.data, base + 8)
        ps = ''
        if po:
            cnt = u32(self.data, po)
            for k in range(cnt):
                ps += self.type_desc(u16(self.data, po + 4 + 2 * k))
        return f'({ps}){ret}'

    def method_info(self, idx):
        base = self.met_off + 8 * idx
        cls = self.type_desc(u16(self.data, base))
        proto = self.proto_str(u16(self.data, base + 2))
        name = self.raw_string(u32(self.data, base + 4)).decode('utf-8', 'replace')
        return cls, name, proto

    def find_method(self, cls, name, proto):
        for i in range(self.met_n):
            if self.method_info(i) == (cls, name, proto):
                return i
        return -1

    def class_def_off(self, cls):
        for i in range(self.cls_n):
            base = self.cls_off + 32 * i
            if self.type_desc(u32(self.data, base)) == cls:
                return u32(self.data, base + 24)  # class_data_off
        return 0

    def methods(self, cls):
        cd = self.class_def_off(cls)
        if cd == 0:
            return
        off = cd
        counts = []
        for _ in range(4):
            v, off = self.uleb(off)
            counts.append(v)
        for _ in range(counts[0] + counts[1]):
            _, off = self.uleb(off)
            _, off = self.uleb(off)
        for kind in (0, 1):
            midx = 0
            for _ in range(counts[2 + kind]):
                d, off = self.uleb(off)
                acc, off = self.uleb(off)
                code, off = self.uleb(off)
                midx += d
                _, name, proto = self.method_info(midx)
                yield (name, proto, code, acc)

    def code_item(self, code_off):
        regs, ins, outs, tries, dbg, isz = struct.unpack_from(
            '<HHHHII', self.data, code_off)
        return isz, code_off + 16

    def fix_sums(self):
        self.data[12:32] = hashlib.sha1(bytes(self.data[32:])).digest()
        self.data[8:12] = struct.pack(
            '<I', zlib.adler32(bytes(self.data[12:])) & 0xffffffff)


def find_invoke_sites(dex, cls, method_names, callee_midx):
    """Find invoke+move-result sites of callee in methods of cls.
    Each hit: (method, proto, code_off, invoke_unit, invoke_units, reg,
    branch_op, key_sidx)."""
    sites = []
    for (mname, proto, code_off, _acc) in dex.methods(cls):
        if mname not in method_names or code_off == 0:
            continue
        isz, base = dex.code_item(code_off)
        insns = bytes(dex.data[base: base + 2 * isz])
        last_str = None
        seq = list(walk_insns(insns))
        for k, (uoff, op, sz) in enumerate(seq):
            if op in (OP_CONST_STRING, OP_CONST_STRING_JUMBO):
                if op == OP_CONST_STRING:
                    last_str = u16(insns, 2 * uoff + 2)
                else:
                    last_str = u32(insns, 2 * uoff + 2)
            elif op in INVOKE_OPS:
                midx = u16(insns, 2 * uoff + 2)
                if midx == callee_midx and k + 2 < len(seq):
                    u2, op2, s2 = seq[k + 1]
                    u3, op3, _ = seq[k + 2]
                    if op2 == OP_MOVE_RESULT and s2 == 1:
                        reg = (u16(insns, 2 * u2) >> 8) & 0xff
                        sites.append((mname, proto, code_off, uoff, sz, reg,
                                      op3, last_str))
    return sites


# ===========================================================================
# string pool (shared by AXML and ARSC)
# ===========================================================================

class Pool:
    def __init__(self, data, off):
        t, hs, sz = struct.unpack_from('<HHI', data, off)
        if t != 0x0001:
            die(f'string pool: bad chunk type 0x{t:04x} at {off}')
        cnt, _styles, flags, str_start, _st = struct.unpack_from(
            '<IIIII', data, off + 8)
        self.data = data
        self.off = off
        self.cnt = cnt
        self.utf8 = bool(flags & 0x100)
        self.data_start = off + str_start
        self.offsets = [u32(data, off + hs + 4 * i) for i in range(cnt)]

    def _len8(self, p):
        b = self.data[p]
        if b & 0x80:
            return ((b & 0x7f) << 8) | self.data[p + 1], p + 2
        return b, p + 1

    def _len16(self, p):
        w = u16(self.data, p)
        if w & 0x8000:
            return ((w & 0x7fff) << 16) | u16(self.data, p + 2), p + 4
        return w, p + 2

    def get(self, i):
        p = self.data_start + self.offsets[i]
        if self.utf8:
            _chars, p = self._len8(p)
            nbytes, p = self._len8(p)
            return bytes(self.data[p:p + nbytes]).decode('utf-8', 'replace')
        chars, p = self._len16(p)
        return bytes(self.data[p:p + 2 * chars]).decode('utf-16-le', 'replace')

    def set_inplace(self, i, new):
        p = self.data_start + self.offsets[i]
        nb16 = new.encode('utf-16-le')
        nb8 = new.encode('utf-8')
        if self.utf8:
            _c, q = self._len8(p)
            ob, q = self._len8(q)
            old_total = (q - p) + ob + 1  # incl trailing NUL
            if 2 + len(nb8) + 1 > old_total:
                die('pool: utf-8 replacement does not fit')
            self.data[p] = len(new)
            self.data[p + 1] = len(nb8)
            self.data[p + 2:p + 2 + len(nb8)] = nb8
            self.data[p + 2 + len(nb8)] = 0
        else:
            chars, q = self._len16(p)
            old_total = (q - p) + 2 * chars
            if 2 + len(nb16) > old_total:
                die('pool: utf-16 replacement does not fit')
            struct.pack_into('<H', self.data, p, 1)
            self.data[p + 2:p + 2 + len(nb16)] = nb16


# ===========================================================================
# binary AXML (manifest)
# ===========================================================================

def parse_manifest(data):
    if u16(data, 0) != 0x0003:
        die('manifest: not binary XML')
    pool = Pool(data, 8)
    ns_idx = name_attr_idx = None
    for i in range(pool.cnt):
        s = pool.get(i)
        if s == ANDROID_NS:
            ns_idx = i
        elif s == 'name' and name_attr_idx is None:
            name_attr_idx = i
    if ns_idx is None or name_attr_idx is None:
        die('manifest: android ns / name attr missing')
    elements = []
    stack = []
    off = u16(data, 2)  # headerSize of the file chunk
    end = u32(data, 4)
    while off < end:
        t, hs, sz = struct.unpack_from('<HHI', data, off)
        if t == 0x0102:
            _line, _cmt, _ns, name = struct.unpack_from('<IIII', data, off + 8)
            (attr_start, _asz, attr_count, _i, _cl, _st) = struct.unpack_from(
                '<HHHHHH', data, off + 24)
            android_name = None
            for k in range(attr_count):
                a = off + 16 + attr_start + 20 * k  # attrStart is relative to attrExt (chunk+16)
                if u32(data, a) == ns_idx and u32(data, a + 4) == name_attr_idx:
                    rv = u32(data, a + 8)
                    dtype = data[a + 15]
                    dta = u32(data, a + 16)
                    if rv != 0xFFFFFFFF:
                        android_name = pool.get(rv)
                    elif dtype == 0x03:
                        android_name = pool.get(dta)
                    break
            el = {'off': off, 'name': pool.get(name),
                  'android_name': android_name, 'end': None}
            elements.append(el)
            stack.append(el)
        elif t == 0x0103:
            stack.pop()['end'] = off + sz
        elif t not in (0x0100, 0x0101, 0x0104, 0x0180, 0x0001):
            die(f'manifest: unexpected chunk 0x{t:04x} at {off}')
        off += sz
    if stack:
        die('manifest: unbalanced elements')
    return pool, elements


def cut_components(man, targets):
    data = bytearray(man)
    _pool, elements = parse_manifest(bytes(data))
    cuts = []
    for el in elements:
        if el['name'] in ('receiver', 'service') and \
                el['android_name'] in targets and el['end'] is not None:
            cuts.append((el['off'], el['end'], el['android_name']))
    if len(cuts) != len(targets):
        die(f'manifest: expected {len(targets)} cuts, found {len(cuts)}: '
            f'{[c[2] for c in cuts]}')
    cuts.sort()
    out = bytearray()
    pos = 0
    for a, b, _nm in cuts:
        out += data[pos:a]
        pos = b
    out += data[pos:]
    struct.pack_into('<I', out, 4, u32(data, 4) - sum(b - a for a, b, _ in cuts))
    return bytes(out), [c[2] for c in cuts]


# ===========================================================================
# resources.arsc
# ===========================================================================

def collect_string_entries(data, pool, names):
    """Walk all packages; return {name: [global pool idx]} for string-type
    entries whose key is in names."""
    per_name = {n: set() for n in names}
    hdr_sz = u16(data, 2)
    off = hdr_sz
    end = u32(data, 4)
    while off < end:
        t, hs, sz = struct.unpack_from('<HHI', data, off)
        if t == 0x0200:
            pkg = off
            tpool = Pool(data, pkg + u32(data, pkg + 268))
            kpool = Pool(data, pkg + u32(data, pkg + 276))
            string_tids = {i + 1 for i in range(tpool.cnt) if tpool.get(i) == 'string'}
            inner = pkg + hs
            while inner < pkg + sz:
                it, ihs, isz = struct.unpack_from('<HHI', data, inner)
                if it == 0x0201:
                    tid = data[inner + 8]
                    entry_count = u32(data, inner + 12)
                    entries_start = u32(data, inner + 16)
                    if tid in string_tids:
                        for k in range(entry_count):
                            eo = u32(data, inner + ihs + 4 * k)
                            if eo == 0xFFFFFFFF:
                                continue
                            e = inner + entries_start + eo
                            esz = u16(data, e)
                            eflags = u16(data, e + 2)
                            if eflags & 0x0001:
                                continue
                            key = kpool.get(u32(data, e + 4))
                            if key not in per_name:
                                continue
                            voff = e + esz
                            if data[voff + 3] != 0x03:  # not STRING
                                continue
                            per_name[key].add(u32(data, voff + 4))
                inner += isz
        off += sz
    return per_name


def blank_arsc_strings(arsc, names, dry=False):
    data = bytearray(arsc)
    if u16(data, 0) != 0x0002:
        die('arsc: bad magic')
    hdr_sz = u16(data, 2)
    t, hs, sz = struct.unpack_from('<HHI', data, hdr_sz)
    if t != 0x0001:
        die('arsc: global string pool not first chunk')
    pool = Pool(data, hdr_sz)
    per_name = collect_string_entries(data, pool, names)
    report = []
    for n in names:
        idxs = sorted(per_name[n])
        if not idxs:
            die(f'arsc: no string entries for {n}')
        if not dry:
            for i in idxs:
                pool.set_inplace(i, ' ')
        report.append((n, len(idxs)))
    return bytes(data) if not dry else None, report


# ===========================================================================
# APK level
# ===========================================================================

def load_dexes(zf):
    out = []
    for info in zf.infolist():
        if info.filename.startswith('classes') and info.filename.endswith('.dex'):
            out.append((info.filename, info.compress_type,
                        Dex(zf.read(info.filename), info.filename)))
    return out


def patch_dexes(dexes):
    report = []

    # ---- 02a ----
    # C1 ground truth (androguard-verified): WelcomeActivity has FOUR
    # SettingsManager.i("eula_accepted.gdpr") sites:
    #   onCreate #1 (reg v4, if-eqz)  -> gates m9k.S() pre-onboarding hook
    #   onCreate #2 (reg v1, if-eqz)  -> THE "show onboarding/T&C fragment vs
    #                                    proceed via q0o.f()" gate (missed by
    #                                    the v1.3.1 smali recon / D1)
    #   onStop    (reg v0, if-nez)    -> re-lock user into welcome flow
    #   startActivityForResult (reg v0, if-nez) -> lock-in wrapper (always
    #                                    active when eula stays false)
    # All four are forced to "accepted" (const/4 vN, 0x1).
    hits = []
    for fn, _ct, dex in dexes:
        if dex.class_def_off(WELCOME) == 0:
            continue
        smi = dex.find_method(SETTINGS_MGR, 'i', SM_I)
        if smi < 0:
            die('02a: SettingsManager.i(String)Z not found')
        esidx = dex.find_string(EULA_KEY)
        if esidx < 0:
            die('02a: eula key string not found')
        for s in find_invoke_sites(dex, WELCOME,
                                   {'onCreate', 'onStop', 'startActivityForResult'}, smi):
            if s[7] == esidx:
                hits.append((fn, dex) + s)
    per_method = {}
    for h in hits:
        per_method.setdefault(h[2], []).append(h)
    expect = {'onCreate': (2, OP_IF_EQZ), 'onStop': (1, OP_IF_NEZ),
              'startActivityForResult': (1, OP_IF_NEZ)}
    if set(per_method) != set(expect):
        die(f'02a: method set mismatch: {sorted(per_method)}')
    for mname, (cnt, bop) in expect.items():
        got = per_method.get(mname, [])
        if len(got) != cnt:
            die(f'02a: {mname}: expected {cnt} eula site(s), found {len(got)}')
        for h in got:
            if h[8] != bop:
                die(f'02a: {mname}: expected branch 0x{bop:02x}, got 0x{h[8]:02x}')
    for (fn, dex, mname, proto, code_off, uoff, iunits, reg, bop, _k) in hits:
        isz, base = dex.code_item(code_off)
        a = base + 2 * uoff
        orig = bytes(dex.data[a:a + 8])
        if orig[0] == OP_CONST4:
            report.append(f'02a {fn} {mname}: already patched')
            continue
        if orig[0] not in INVOKE_OPS or iunits != 3 or \
                (u16(dex.data, a + 6) >> 8) != reg:
            die(f'02a: byte sanity failed in {mname}: {orig.hex()}')
        dex.data[a:a + 8] = const4(reg, 1) + b'\x00' * 6
        report.append(f'02a {fn} {mname}: invoke+move-result v{reg} -> const/4 v{reg},0x1 '
                      f'(branch 0x{bop:02x} untouched)')

    # ---- 02b ----
    done = False
    for fn, _ct, dex in dexes:
        if dex.class_def_off(R65) == 0:
            continue
        for (mname, proto, code_off, _acc) in dex.methods(R65):
            if (mname, proto) == ('l', '(Z)Z') and code_off:
                _, base = dex.code_item(code_off)
                head = bytes(dex.data[base:base + 2])
                if head == b'\x12\x00':
                    report.append('02b: already patched')
                elif head != b'\x12\x10':
                    die(f'02b: unexpected head {head.hex()} (want 1210 = const/4 v0,1)')
                else:
                    dex.data[base:base + 4] = CONST4_RET
                    report.append(f'02b {fn} r65.l(Z)Z: -> const/4 v0,0; return v0')
                done = True
                break
        if done:
            break
    if not done:
        die('02b: r65.l(Z)Z not found')

    # ---- 02c ----
    done = False
    for fn, _ct, dex in dexes:
        if dex.class_def_off(MM6) == 0:
            continue
        gb = dex.find_method(GB_CLASS, GB_NAME, GB_PROTO)
        ksidx = dex.find_string(DEFBR_KEY)
        if ksidx < 0:
            die('02c: default-browser key not in dex')
        for (mname, _proto, code_off, _acc) in dex.methods(MM6):
            if mname != 'e' or code_off == 0:
                continue
            isz, base = dex.code_item(code_off)
            insns = bytes(dex.data[base: base + 2 * isz])
            seq = list(walk_insns(insns))
            for k, (uoff, op, sz) in enumerate(seq):
                if op == OP_CONST_STRING and u16(insns, 2 * uoff + 2) == ksidx:
                    u2, op2, s2 = seq[k + 1]
                    u3, op3, _ = seq[k + 2]
                    u4, op4, _ = seq[k + 3]
                    if op2 not in INVOKE_OPS or s2 != 3 or op3 != OP_MOVE_RESULT or op4 != OP_IF_EQZ:
                        die(f'02c: unexpected sequence ops {op2:#x}/{op3:#x}/{op4:#x}')
                    a = base + 2 * u2
                    orig = bytes(dex.data[a:a + 8])
                    reg = (u16(insns, 2 * u3) >> 8) & 0xff
                    if orig[0] == OP_CONST4:
                        report.append('02c: already patched')
                        done = True
                        break
                    dex.data[a:a + 8] = const4(reg, 0) + b'\x00' * 6
                    report.append(f'02c {fn} mm6.e: getBoolean+move-result v{reg} -> const/4 v{reg},0x0')
                    done = True
                    break
            if done:
                break
        if done:
            break
    if not done:
        die('02c: site not found in mm6.e')

    # ---- 03b ----
    done = False
    for fn, _ct, dex in dexes:
        if dex.class_def_off(WDN) == 0:
            continue
        for (mname, proto, code_off, _acc) in dex.methods(WDN):
            if (mname, proto) == ('a', '()Z') and code_off:
                _, base = dex.code_item(code_off)
                head = bytes(dex.data[base:base + 2])
                if head == b'\x12\x00':
                    report.append('03b: already patched')
                elif head != b'\x55\x10':
                    die(f'03b: unexpected head {head.hex()} (want 5510 = iget-boolean v0,p0)')
                else:
                    dex.data[base:base + 4] = CONST4_RET
                    report.append(f'03b {fn} wdn.a()Z: -> const/4 v0,0; return v0')
                done = True
                break
        if done:
            break
    if not done:
        die('03b: wdn.a()Z not found')

    for _fn, _ct, dex in dexes:
        dex.fix_sums()
    return report


def inspect(apk):
    print(f'=== inspect {apk} ===')
    zf = zipfile.ZipFile(apk)
    infos = zf.infolist()
    print(f'entries: {len(infos)}')
    for nm in ('AndroidManifest.xml', 'resources.arsc'):
        i = zf.getinfo(nm)
        print(f'  {nm}: {i.file_size} bytes compress={i.compress_type}')
    dexes = load_dexes(zf)
    print(f'dex files: {len(dexes)}')
    for fn, ct, d in dexes:
        print(f'  {fn}: {len(d.data)}B strings={d.str_n} methods={d.met_n}')
    for cls in (WELCOME, R65, MM6, WDN):
        where = [fn for fn, _ct, d in dexes if d.class_def_off(cls) != 0]
        print(f'{cls}: {where or "NOT FOUND"}')
    man = zf.read('AndroidManifest.xml')
    _pool, elements = parse_manifest(man)
    for el in elements:
        if el['name'] in ('receiver', 'service') and el['android_name'] and \
                'Vpn' in el['android_name']:
            print(f"  manifest {el['name']}: {el['android_name']}")
    for fn, _ct, dex in dexes:
        if dex.class_def_off(WELCOME) == 0:
            continue
        smi = dex.find_method(SETTINGS_MGR, 'i', SM_I)
        esidx = dex.find_string(EULA_KEY)
        allm = {m for m, p, c, a in dex.methods(WELCOME)}
        for s in find_invoke_sites(dex, WELCOME, allm, smi):
            key = dex.raw_string(s[7]).decode('utf-8', 'replace') if s[7] is not None else None
            print(f'  02a-candidate {s[0]}: reg=v{s[5]} branch=0x{s[6]:02x} key={key!r}')
        if dex.class_def_off(R65) != 0:
            for mname, proto, code_off, _a in dex.methods(R65):
                if (mname, proto) == ('l', '(Z)Z') and code_off:
                    isz, base = dex.code_item(code_off)
                    print(f'  02b head: {bytes(dex.data[base:base+8]).hex()} isz={isz}')
        if dex.class_def_off(WDN) != 0:
            for mname, proto, code_off, _a in dex.methods(WDN):
                if (mname, proto) == ('a', '()Z') and code_off:
                    isz, base = dex.code_item(code_off)
                    print(f'  03b head: {bytes(dex.data[base:base+8]).hex()} isz={isz}')
    arsc = zf.read('resources.arsc')
    _, rep = blank_arsc_strings(arsc, BLANK_NAMES, dry=True)
    for n, cnt in rep:
        print(f'  03c {n}: {cnt} pool entr{"y" if cnt == 1 else "ies"} (all configs)')


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--inspect', metavar='APK')
    ap.add_argument('--patch', nargs=2, metavar=('APK', 'OUT'))
    args = ap.parse_args()
    if args.inspect:
        inspect(args.inspect)
        return
    if not args.patch:
        ap.print_help()
        return
    src, out = args.patch
    zf = zipfile.ZipFile(src)
    print(f'=== patch {src} -> {out} ===')
    dexes = load_dexes(zf)
    if not dexes:
        die('no classes*.dex found')
    for line in patch_dexes(dexes):
        print(f'  {line}')

    man = zf.read('AndroidManifest.xml')
    new_man, cut = cut_components(man, VPN_COMPONENTS)
    print(f'  03a manifest: cut {cut}')
    _p, elements = parse_manifest(new_man)
    left = [e['android_name'] for e in elements
            if e['android_name'] and 'VpnPro' in e['android_name']
            and e['name'] in ('receiver', 'service')]
    kept = [e['android_name'] for e in elements
            if e['android_name'] and e['android_name'].endswith('.vpn.VpnReceiver')]
    if left:
        die(f'03a: VpnPro components still present: {left}')
    print(f'  03a check: VpnPro=0, free VpnReceiver kept={kept}')

    arsc = zf.read('resources.arsc')
    new_arsc, srep = blank_arsc_strings(arsc, BLANK_NAMES)
    for n, cnt in srep:
        print(f'  03c {n}: blanked {cnt} pool string(s)')

    replacements = {'AndroidManifest.xml': new_man, 'resources.arsc': new_arsc}
    for fn, _ct, dex in dexes:
        replacements[fn] = bytes(dex.data)
    zout = zipfile.ZipFile(out, 'w')
    kept_n = dropped_n = 0
    for info in zf.infolist():
        nm = info.filename
        if nm.startswith('META-INF/') and (
                nm.endswith(('.SF', '.RSA', '.DSA', '.EC')) or nm == 'META-INF/MANIFEST.MF'):
            dropped_n += 1
            continue
        if nm == 'resources.arsc' and info.compress_type != zipfile.ZIP_STORED:
            die('resources.arsc not STORED in substrate')
        zi = zipfile.ZipInfo(nm, date_time=info.date_time)
        zi.compress_type = info.compress_type
        zi.external_attr = info.external_attr
        zout.writestr(zi, replacements.get(nm, zf.read(nm)))
        kept_n += 1
    zout.close()
    print(f'  zip: {kept_n} entries written, {dropped_n} signature files dropped')
    print('DONE')


if __name__ == '__main__':
    main()
