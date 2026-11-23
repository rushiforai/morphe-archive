import os
import re

smali_path = os.path.join('temp_decompiled', 'smali', 'com', 'akshaykadam', 'pixelboard', 'extension', 'R$string.smali')
smali_strings = {}
if os.path.exists(smali_path):
    with open(smali_path, 'r', encoding='utf-8') as f:
        for line in f:
            line = line.strip()
            if '.field public static' in line:
                # e.g.: .field public static gboard_patches_about_author_title:I = 0x7f030000
                m = re.search(r'\.field public static ([a-zA-Z0-9_]+):I = (0x[0-9a-fA-F]+)', line)
                if m:
                    smali_strings[m.group(1)] = int(m.group(2), 16)

print(f'Total smali strings found: {len(smali_strings)}')

# Check refs
pattern = re.compile(r'R\.string\.([a-zA-Z0-9_]+)')
refs = set()
for root, dirs, files in os.walk('pixelboard-patches/extensions/extension/src/main/java'):
    for f in files:
        if f.endswith('.java'):
            p = os.path.join(root, f)
            with open(p, encoding='utf-8', errors='ignore') as jf:
                for match in pattern.finditer(jf.read()):
                    refs.add(match.group(1))

print(f'Total referenced strings in java: {len(refs)}')
missing = refs - set(smali_strings.keys())
print(f'Missing strings: {missing}')
