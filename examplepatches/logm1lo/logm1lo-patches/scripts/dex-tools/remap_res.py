#!/usr/bin/env python3
"""
MT Manager resource re-architecting:
Duplicate root-level obfuscated resource files into res/<type>/ paths so
standard Android resource resolution works without the app's native hook.
Usage: remap_res.py <in.apk> <aapt2_dump.txt> <out.apk>
"""
import zipfile
import re
import sys
import os

APK = sys.argv[1] if len(sys.argv) > 1 else 'in.apk'
DUMP = sys.argv[2] if len(sys.argv) > 2 else 'resources_dump.txt'
OUT = sys.argv[3] if len(sys.argv) > 3 else 'resmapped.apk'

FILE_TYPES = {
    'anim': 'anim', 'animator': 'animator', 'drawable': 'drawable',
    'interpolator': 'interpolator', 'layout': 'layout', 'menu': 'menu',
    'mipmap': 'mipmap', 'xml': 'xml',
}

file_values = {}
type_to_values = {}
current_type = None
with open(DUMP, 'r', encoding='utf-8') as f:
    for line in f:
        m = re.match(r'  type (\w+) id=\w+ entryCount=', line)
        if m:
            current_type = m.group(1)
            type_to_values.setdefault(current_type, set())
            continue
        if current_type is None:
            continue
        vm = re.match(r'\s+\(\) "([^"]+)"', line)
        if vm:
            val = vm.group(1)
            if val and val != 'MT_Protector':
                type_to_values[current_type].add(val)
                file_values[val] = current_type

zin = zipfile.ZipFile(APK)
names = set(zin.namelist())

mapped = {}
for val, vtype in file_values.items():
    res_dir = FILE_TYPES.get(vtype)
    if not res_dir:
        continue
    src = None
    for cand in (val, val + '.xml', val + '.png', val + '.9.png', val + '.webp', val + '.jpg'):
        if cand in names:
            src = cand
            break
    if not src:
        continue
    ext = os.path.splitext(src)[1]
    dest_name = val if val.endswith(ext) else val + ext
    dest = f'res/{res_dir}/{dest_name}'
    mapped[src] = dest

print(f"Mapped {len(mapped)} root files to res paths")

src_data = {}
fail = 0
for src in mapped:
    try:
        src_data[src] = zin.read(src)
    except Exception as e:
        fail += 1
        print(f"  READ FAIL {src!r}: {e}")
print(f"Read {len(src_data)}/{len(mapped)} (fail={fail})")

zout = zipfile.ZipFile(OUT, 'w', zipfile.ZIP_DEFLATED)
seen = set()
for item in zin.infolist():
    if item.filename in seen:
        continue
    seen.add(item.filename)
    try:
        zout.writestr(item, zin.read(item.filename))
    except Exception as e:
        print(f"  COPY FAIL {item.filename}: {e}")

added = 0
for src, dest in mapped.items():
    if dest in seen:
        continue
    data = src_data.get(src)
    if data is None:
        continue
    zout.writestr(dest, data)
    seen.add(dest)
    added += 1

zout.close()
zin.close()
print(f"Added {added} res/ entries -> {OUT}")
