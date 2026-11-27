#!/usr/bin/env python3
"""
rename_apk.py - side-by-side identity rename for the Rambler Bangla
experimental build. Rewrites, with audit output:

  - AndroidManifest.xml: package attribute, provider authorities, declared/
    referenced permissions, phenotype registration meta-data, deeplink host,
    application label (UTF-16 AXML string pool, content-level rewrite)
  - res/*.xml shortcut/provider XMLs referencing the package (UTF-8 AXML)
  - resources.arsc: ResTable_package name field
  - classes.dex: exact whole-string values (package identity, whitelist
    sentence, feature keys, UI label) via baksmali -> exact-match rewrite ->
    smali round-trip; class descriptors are never touched
  - repack preserving per-entry compression, zipalign (4-byte), re-sign

Class NAMES (Lcom/akshaykadam/pixelboard/extension/...;) are internal Java
identifiers and are intentionally kept: renaming them adds risk and no
install-identity benefit.

GPL-3.0; part of the rambler-bangla project. Contains no Google content.
"""
import argparse
import hashlib
import json
import os
import re
import shutil
import struct
import subprocess
import sys
import zipfile

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from axml_pool import rewrite_axml, rewrite_arsc  # noqa: E402

OLD_PACKAGE = 'com.akshaykadam.pixelboard'
OLD_LABEL = 'PixelBoard'
SMALI_STRING_RE = re.compile(r'"((?:[^"\\]|\\.)*)"')


def smali_unescape(s):
    out, i = [], 0
    while i < len(s):
        c = s[i]
        if c != '\\':
            out.append(c); i += 1; continue
        e = s[i + 1]; i += 2
        if e == 'u':
            out.append(chr(int(s[i:i + 4], 16))); i += 4
        else:
            out.append({'n': '\n', 'r': '\r', 't': '\t', 'b': '\b', 'f': '\f',
                        '\\': '\\', '"': '"', "'": "'"}[e])
    return ''.join(out)


def smali_escape(s):
    return (s.replace('\\', '\\\\').replace('"', '\\"')
             .replace('\n', '\\n').replace('\t', '\\t').replace('\r', '\\r'))


def manifest_rules(old, new, new_label):
    def rule(v):
        if v == OLD_LABEL:
            return new_label
        if old in v and not v.startswith(old + '.extension.'):
            return v.replace(old, new)
        return None
    return rule


def res_rules(old, new):
    def rule(v):
        if old in v and not v.startswith(old + '.extension.'):
            return v.replace(old, new)
        return None
    return rule


def build_rules_from_pool(data, make_rule):
    from axml_pool import StringPool
    pool = StringPool(data, 8)
    rules = {}
    for s in pool.strings:
        r = make_rule(s)
        if r:
            rules[s] = r
    return rules


def run(cmd):
    p = subprocess.run(cmd, capture_output=True, text=True)
    if p.returncode != 0:
        raise RuntimeError('failed: %s\n%s%s' % (' '.join(cmd), p.stdout, p.stderr))


def rewrite_dex_strings(dex_path, out_path, exact_rules, workdir, smali_cp):
    java = os.path.join(os.environ.get('JAVA_HOME', ''), 'bin', 'java') \
        if os.environ.get('JAVA_HOME') else 'java'
    src = os.path.join(workdir, 'smali')
    if os.path.isdir(src):
        shutil.rmtree(src)
    run([java, '-cp', smali_cp, 'org.jf.baksmali.Main', 'd', dex_path, '-o', src])
    applied = {k: 0 for k in exact_rules}
    for root, _d, files in os.walk(src):
        for fn in files:
            if not fn.endswith('.smali'):
                continue
            path = os.path.join(root, fn)
            with open(path, encoding='utf-8') as fh:
                lines = fh.read().splitlines()
            changed = False
            for li, line in enumerate(lines):
                def sub(m):
                    nonlocal changed
                    value = smali_unescape(m.group(1))
                    if value in exact_rules:
                        applied[value] += 1
                        changed = True
                        return '"%s"' % smali_escape(exact_rules[value])
                    return m.group(0)
                new_line = SMALI_STRING_RE.sub(sub, line)
                if new_line != line:
                    lines[li] = new_line
            if changed:
                with open(path, 'w', encoding='utf-8') as fh:
                    fh.write('\n'.join(lines) + '\n')
    run([java, '-cp', smali_cp, 'org.jf.smali.Main', 'a', src, '-o', out_path])
    return applied


def build_aligned_zip(entries, out_path):
    """Write the APK as a manual ZIP (local headers + central directory +
    EOCD) so stored-entry data offsets are exactly what we compute.
    Stored entries get zipalign-style padding via a proper 0xFFFF extra
    TLV; .so libraries are page-aligned to 4096 because the manifest
    sets android:extractNativeLibs="false" and Android refuses to
    install unaligned page loads. Stale JAR signature files
    (META-INF/MANIFEST.MF, *.SF, *.RSA, *.DSA, *.EC) are dropped: the APK
    is re-signed v2 afterwards and a leftover v1 signature over the old
    content would fail verification. Compressed entries are deflated at
    level 9 with raw DEFLATE (same stream zipfile would produce)."""
    import zlib, struct, binascii, re as _re
    sig_drop = _re.compile(
        r'^META-INF/(MANIFEST\.MF|[^/]+\.(SF|RSA|DSA|EC))$',
        _re.IGNORECASE)
    body = bytearray()
    central = []
    for name, data, ctype in entries:
        if sig_drop.match(name):
            continue
        name_b = name.encode('utf-8')
        crc = binascii.crc32(data) & 0xFFFFFFFF
        if ctype == zipfile.ZIP_DEFLATED:
            co = zlib.compressobj(9, zlib.DEFLATED, -15)
            cdata = co.compress(data) + co.flush()
        else:
            cdata = data
        extra = b''
        if ctype == zipfile.ZIP_STORED:
            align = 4096 if name.endswith('.so') else 4
            pad = (align - ((len(body) + 30 + len(name_b)) % align)) % align
            if 0 < pad < 4:
                pad += align
            if pad:
                extra = struct.pack('<HH', 0xFFFF, pad - 4) + b'\x00' * (pad - 4)
        flag = 0x0800  # UTF-8 names
        lho = len(body)
        body += struct.pack('<IHHHHHIIIHH', 0x04034b50, 20, flag, ctype,
                            0, 0, crc, len(cdata), len(data),
                            len(name_b), len(extra))
        body += name_b + extra + cdata
        central.append((name_b, crc, cdata, data, ctype, flag, lho))
    cd_start = len(body)
    for name_b, crc, cdata, data, ctype, flag, lho in central:
        body += struct.pack('<IHHHHHHIIIHHHHHII', 0x02014b50, 20, 20, flag,
                            ctype, 0, 0, crc, len(cdata), len(data),
                            len(name_b), 0, 0, 0, 0, 0, lho)
        body += name_b
    body += struct.pack('<IHHHHIIH', 0x06054b50, 0, 0, len(central),
                        len(central), len(body) - cd_start, cd_start, 0)
    with open(out_path, 'wb') as fh:
        fh.write(body)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--in-apk', required=True)
    ap.add_argument('--out-apk', required=True)
    ap.add_argument('--new-package', required=True)
    ap.add_argument('--new-label', required=True)
    ap.add_argument('--workdir', required=True)
    ap.add_argument('--smali-cp', default=os.environ.get('SMALI_CP', ''))
    ap.add_argument('--report', required=True)
    args = ap.parse_args()

    old, new = OLD_PACKAGE, args.new_package
    report = {'in': args.in_apk, 'out': args.out_apk, 'new_package': new,
              'new_label': args.new_label, 'steps': {}}
    if os.path.isdir(args.workdir):
        shutil.rmtree(args.workdir)
    os.makedirs(args.workdir)

    zf = zipfile.ZipFile(args.in_apk)
    entries = [(i.filename, zf.read(i.filename), i.compress_type)
               for i in zf.infolist()]

    # 1. manifest + res xmls (AXML)
    mrules_cache = {}
    out_entries = []
    for name, data, ctype in entries:
        if name == 'AndroidManifest.xml':
            rules = build_rules_from_pool(data, manifest_rules(old, new, args.new_label))
            data, applied = rewrite_axml(data, rules)
            report['steps']['manifest'] = applied
        elif name in ('res/B_o.xml', 'res/IeH.xml'):
            rules = build_rules_from_pool(data, res_rules(old, new))
            data, applied = rewrite_axml(data, rules)
            report['steps'][name] = applied
        elif name == 'resources.arsc':
            data, changed = rewrite_arsc(data, old, new)
            report['steps']['resources.arsc'] = {'package_name_fields': changed}
        elif name == 'classes.dex':
            tmp_in = os.path.join(args.workdir, 'classes-in.dex')
            tmp_out = os.path.join(args.workdir, 'classes-out.dex')
            with open(tmp_in, 'wb') as fh:
                fh.write(data)
            dex_rules = {
                old: new,
                old + '.feature.advanced_voice_typing':
                    new + '.feature.advanced_voice_typing',
                old + '.feature.ai_writing_tools':
                    new + '.feature.ai_writing_tools',
                ('The current Gboard package is %1$s. PixelBoard Patches '
                 'supports only the official package '
                 'com.google.android.inputmethod.latin and ' + old + '. Mixing '
                 'Gboard builds from multiple sources may cause instability.'):
                ('The current Gboard package is %1$s. Rambler Bangla patches '
                 'support only the official package '
                 'com.google.android.inputmethod.latin and ' + new + '. Mixing '
                 'Gboard builds from multiple sources may cause instability.'),
                OLD_LABEL: args.new_label,
            }
            applied = rewrite_dex_strings(tmp_in, tmp_out, dex_rules,
                                          os.path.join(args.workdir, 'dex'),
                                          args.smali_cp)
            report['steps']['classes.dex'] = applied
            with open(tmp_out, 'rb') as fh:
                data = fh.read()
        out_entries.append((name, data, ctype))

    # 2. aligned repack
    unsigned = os.path.join(args.workdir, 'unsigned.apk')
    build_aligned_zip(out_entries, unsigned)

    # 3. copy to out (signing is a separate step: rename_sign.sh)
    shutil.copyfile(unsigned, args.out_apk)
    report['sha256_unsigned'] = hashlib.sha256(
        open(args.out_apk, 'rb').read()).hexdigest()
    with open(args.report, 'w') as fh:
        json.dump(report, fh, indent=2)
    print(json.dumps(report['steps'], indent=2)[:3000])


if __name__ == '__main__':
    main()
