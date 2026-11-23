import os

for root, dirs, files in os.walk('temp_decompiled/res'):
    for f in files:
        if f.endswith('.xml'):
            p = os.path.join(root, f)
            with open(p, 'r', encoding='utf-8', errors='ignore') as xf:
                t = xf.read()
                if 'color_0x7f060b21' in t or 'color_0x7f060b22' in t or 'color_0x7f060b4f' in t:
                    print(f"Used in {p}")
