#!/usr/bin/env python3
"""Verify the merged v9 APK: dex class-set equality vs original base dexes,
z4 presence, manifest sanity, META-INF services, compression methods."""
import re
import struct
import sys
import zipfile


def uleb128(data, off):
    result = 0
    shift = 0
    while True:
        b = data[off]
        off += 1
        result |= (b & 0x7F) << shift
        if not (b & 0x80):
            break
        shift += 7
    return result, off


def dex_classes(data):
    (str_ids_size, str_ids_off) = struct.unpack_from('<II', data, 0x38)
    strings = []
    for i in range(str_ids_size):
        (str_data_off,) = struct.unpack_from('<I', data, str_ids_off + i * 4)
        _l, pos = uleb128(data, str_data_off)
        end = data.index(b'\x00', pos)
        strings.append(data[pos:end].decode('utf-8', 'replace'))
    (type_ids_size, type_ids_off) = struct.unpack_from('<II', data, 0x40)
    types = []
    for i in range(type_ids_size):
        (di,) = struct.unpack_from('<I', data, type_ids_off + i * 4)
        types.append(strings[di])
    (cd_size, cd_off) = struct.unpack_from('<II', data, 0x60)
    out = set()
    for i in range(cd_size):
        (class_idx,) = struct.unpack_from('<I', data, cd_off + i * 32)
        out.add(types[class_idx])
    return out


def main():
    merged_apk, base_dex_dir = sys.argv[1], sys.argv[2]
    ok = True

    # 1. DEX class-set comparison
    base_classes = set()
    import glob
    import os
    for f in sorted(glob.glob(os.path.join(base_dex_dir, '*.dex'))):
        base_classes |= dex_classes(open(f, 'rb').read())
    print(f"[1] original base classes: {len(base_classes)}")

    zf = zipfile.ZipFile(merged_apk)
    merged_classes = set()
    dex_entries = [n for n in zf.namelist() if re.fullmatch(r'classes\d*\.dex', n)]
    per_dex = {}
    for n in sorted(dex_entries):
        cs = dex_classes(zf.read(n))
        per_dex[n] = cs
        merged_classes |= cs
        print(f"    {n}: {len(cs)} classes")
    print(f"[1] merged classes total: {len(merged_classes)} across {len(dex_entries)} dex files")

    missing = base_classes - merged_classes
    extra = merged_classes - base_classes
    if missing:
        ok = False
        print(f"[1] FAIL - classes MISSING from merge ({len(missing)}): {sorted(missing)[:20]}")
    else:
        print(f"[1] OK - every original base class present (no losses)")
    if extra:
        print(f"[1] NOTE - extra classes vs base ({len(extra)}): {sorted(extra)[:10]}")

    # 2. z4 presence
    if 'Lz4;' in merged_classes:
        where = [n for n, cs in per_dex.items() if 'Lz4;' in cs]
        print(f"[2] OK - Lz4; present in {where}")
    else:
        ok = False
        print("[2] FAIL - Lz4; (Kotlin AbstractList base) MISSING")

    # 3. Manifest sanity (binary XML string pool may be UTF-8 or UTF-16LE)
    man = zf.read('AndroidManifest.xml')
    for needle_s, want_absent in [
        ('requiredSplitTypes', True), ('requiredSplits', True),
        ('isSplitRequired', True), ('isolatedSplits', True),
        ('com.opera.android.OperaApplication', False),
        ('com.opera.browser.beta', False),
    ]:
        present = (needle_s.encode('utf-16-le') in man) or (needle_s.encode() in man)
        if want_absent and present:
            ok = False
            print(f"[3] FAIL - manifest still contains {needle_s}")
        elif not want_absent and not present:
            ok = False
            print(f"[3] FAIL - manifest lost {needle_s}")
    print("[3] manifest split-requirement strings checked (utf-8 + utf-16le)")

    # 4. META-INF services + kotlin modules preserved
    names = zf.namelist()
    svc = [n for n in names if n.startswith('META-INF/services/')]
    km = [n for n in names if n.endswith('.kotlin_module')]
    print(f"[4] META-INF/services: {len(svc)} files, kotlin_module: {len(km)} files")
    if not svc:
        ok = False
        print("[4] FAIL - no service loader files in META-INF")

    # 5. Compression: .so and resources.arsc must be STORED (extractNativeLibs=false)
    bad = []
    for info in zf.infolist():
        if (info.filename.endswith('.so') or info.filename == 'resources.arsc') and info.compress_type != zipfile.ZIP_STORED:
            bad.append(info.filename)
    if bad:
        ok = False
        print(f"[5] FAIL - compressed entries that must be stored: {bad[:5]}")
    else:
        sos = sum(1 for i in zf.infolist() if i.filename.endswith('.so'))
        print(f"[5] OK - resources.arsc and all {sos} .so files are STORED (uncompressed)")

    # 6. arm64 placeholder warning
    arm64 = [n for n in names if n.startswith('lib/arm64-v8a/')]
    v7a = [n for n in names if n.startswith('lib/armeabi-v7a/')]
    print(f"[6] lib/armeabi-v7a: {len(v7a)} libs, lib/arm64-v8a: {len(arm64)} -> {arm64}")

    print("OVERALL:", "PASS" if ok else "FAIL")
    sys.exit(0 if ok else 1)


if __name__ == '__main__':
    main()
