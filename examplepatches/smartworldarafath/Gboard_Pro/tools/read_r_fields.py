import os

for fname in ['R.smali', 'R$string.smali', 'R$color.smali', 'R$drawable.smali']:
    p = os.path.join('temp_decompiled', 'smali', 'com', 'akshaykadam', 'pixelboard', 'extension', fname)
    if os.path.exists(p):
        print(f"=== {fname} ===")
        with open(p) as f:
            for line in f:
                if '.field' in line:
                    print(line.strip())
