import os
import re

smali_dir = os.path.join('temp_decompiled', 'smali', 'com', 'akshaykadam', 'pixelboard', 'extension')

def parse_smali_fields(fname):
    fields = {}
    p = os.path.join(smali_dir, fname)
    if os.path.exists(p):
        with open(p, 'r', encoding='utf-8') as f:
            for line in f:
                line = line.strip()
                if '.field public static' in line:
                    m = re.search(r'\.field public static ([a-zA-Z0-9_]+):I = (0x[0-9a-fA-F]+)', line)
                    if m:
                        fields[m.group(1)] = m.group(2)
    return fields

strings = parse_smali_fields('R$string.smali')
colors = parse_smali_fields('R$color.smali')
drawables = parse_smali_fields('R$drawable.smali')

# Add missing strings
if 'gboard_patches_restarting' not in strings:
    strings['gboard_patches_restarting'] = '0x7f030068'
if 'gboard_patches_warning_label' not in strings:
    strings['gboard_patches_warning_label'] = '0x7f030069'

out_lines = [
    "package com.akshaykadam.pixelboard.extension;",
    "",
    "public final class R {",
    "    public static final class string {"
]

for name, val in sorted(strings.items()):
    out_lines.append(f"        public static final int {name} = {val};")
out_lines.append("    }")
out_lines.append("")

out_lines.append("    public static final class color {")
for name, val in sorted(colors.items()):
    out_lines.append(f"        public static final int {name} = {val};")
out_lines.append("    }")
out_lines.append("")

out_lines.append("    public static final class drawable {")
for name, val in sorted(drawables.items()):
    out_lines.append(f"        public static final int {name} = {val};")
out_lines.append("    }")
out_lines.append("}")
out_lines.append("")

r_java_path = 'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/R.java'
os.makedirs(os.path.dirname(r_java_path), exist_ok=True)
with open(r_java_path, 'w', encoding='utf-8') as f:
    f.write('\n'.join(out_lines))

print(f"Generated {r_java_path} successfully with {len(strings)} strings, {len(colors)} colors, {len(drawables)} drawables!")
