#!/usr/bin/env python3
"""Verify DEX fingerprints against an original Taobao APK (stdlib only)."""
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys
import zipfile

LANG = 'Lcom/alibaba/ability/localization/constants/Language;'
EXPECTED = {
 ('Lcom/alibaba/ability/localization/Localization;', 'h', LANG, True),
 ('Lcom/alibaba/ability/localization/LocalizationManager;', 'd', 'Ljava/util/Locale;', False),
 ('Lcom/alibaba/ability/localization/Localization;', 'o', 'Z', True),
 ('Lcom/taobao/analysis/scene/SceneIdentifier;', 'isI18nEdition', 'I', True),
}
SHA256 = '3e709717a60fdeeb59354df60fb6cf279ffb023c01e095e16bccfbad75f683dd'

def u32(b, p):
    return struct.unpack_from('<I', b, p)[0]

def u16(b, p):
    return struct.unpack_from('<H', b, p)[0]

def uleb(b, p):
    v = 0
    for i in range(5):
        t = b[p + i]
        v |= (t & 127) << (7 * i)
        if not t & 128:
            return v, p + i + 1
    raise ValueError('Invalid ULEB128')

def extract(dex):
    if not dex.startswith(b'dex\n'):
        raise ValueError('Invalid DEX signature')
    sc, sp = u32(dex, 0x38), u32(dex, 0x3c)
    strings = []
    for i in range(sc):
        _, start = uleb(dex, u32(dex, sp + i * 4))
        strings.append(dex[start:dex.index(0, start)].decode('utf-8', 'replace'))
    tc, tp = u32(dex, 0x40), u32(dex, 0x44)
    types = [strings[u32(dex, tp + i * 4)] for i in range(tc)]
    pp = u32(dex, 0x4c)
    mc, mp = u32(dex, 0x58), u32(dex, 0x5c)
    methods = []
    for i in range(mc):
        cls, proto, name = struct.unpack_from('<HHI', dex, mp + i * 8)
        _, ret, param = struct.unpack_from('<III', dex, pp + proto * 12)
        params = tuple(types[u16(dex, param + 4 + j * 2)] for j in range(u32(dex, param))) if param else ()
        methods.append((types[cls], strings[name], types[ret], params))
    fc, fp = u32(dex, 0x50), u32(dex, 0x54)
    fields = []
    for i in range(fc):
        cls, typ, name = struct.unpack_from('<HHI', dex, fp + i * 8)
        fields.append((types[cls], strings[name], types[typ]))
    matched, english = [], False
    cc, cp = u32(dex, 0x60), u32(dex, 0x64)
    for ci in range(cc):
        class_data = u32(dex, cp + ci * 32 + 24)
        if not class_data:
            continue
        pos = class_data
        ns, pos = uleb(dex, pos)
        ni, pos = uleb(dex, pos)
        nd, pos = uleb(dex, pos)
        nv, pos = uleb(dex, pos)
        for count in (ns, ni):
            field_index = 0
            for _ in range(count):
                diff, pos = uleb(dex, pos)
                field_index += diff
                flags, pos = uleb(dex, pos)
                if fields[field_index] == (LANG, 'ENGLISH', LANG) and flags & 8:
                    english = True
        for count in (nd, nv):
            method_index = 0
            for _ in range(count):
                diff, pos = uleb(dex, pos)
                method_index += diff
                flags, pos = uleb(dex, pos)
                code, pos = uleb(dex, pos)
                cls, name, ret, params = methods[method_index]
                key = (cls, name, ret, bool(flags & 8))
                if key in EXPECTED and not params:
                    if not code:
                        raise ValueError('Target has no code: ' + name)
                    regs, ins, outs, tries, dbg, size = struct.unpack_from('<HHHHII', dex, code)
                    if regs < 1 or size < 2:
                        raise ValueError('Target has too few registers/instructions: ' + name)
                    matched.append({'class': cls, 'name': name, 'return': ret,
                                    'static': bool(flags & 8), 'registers': regs,
                                    'instructions': size, 'try_blocks': tries})
    return matched, english

def main():
    p = argparse.ArgumentParser()
    p.add_argument('apk', type=Path)
    p.add_argument('--strict-hash', action='store_true')
    args = p.parse_args()
    digest = hashlib.sha256()
    with args.apk.open('rb') as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b''):
            digest.update(chunk)
    same = digest.hexdigest() == SHA256
    if args.strict_hash and not same:
        raise ValueError('APK SHA-256 differs from the studied original')
    matches, english = [], False
    with zipfile.ZipFile(args.apk) as apk:
        names = [name for name in apk.namelist() if name.startswith('classes') and name.endswith('.dex')]
        for name in names:
            found, field = extract(apk.read(name))
            matches.extend(found)
            english |= field
    actual = {(x['class'], x['name'], x['return'], x['static']) for x in matches}
    if actual != EXPECTED or len(matches) != len(EXPECTED) or not english:
        raise ValueError(f'DEX verification failed: missing={EXPECTED - actual}; duplicate={len(matches) - len(actual)}; english={english}')
    print(json.dumps({'sha256': digest.hexdigest(), 'original_sha256_match': same,
                      'Language.ENGLISH static': english, 'matched_methods': matches}, indent=2))
    return 0

if __name__ == '__main__':
    try:
        sys.exit(main())
    except (OSError, ValueError, IndexError, zipfile.BadZipFile, struct.error) as exc:
        print(f'ERROR: {exc}', file=sys.stderr)
        sys.exit(1)
