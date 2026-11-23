import os

for root, dirs, files in os.walk('temp_decompiled'):
    if not any(root.startswith(os.path.join('temp_decompiled', s)) for s in ['smali', 'smali_classes2', 'smali_classes3', 'smali_classes4', 'smali_classes5']):
        continue
    for f in files:
        if f == 'qpc.smali':
            p = os.path.join(root, f)
            print("Found qpc.smali:", p)
            with open(p, 'r', encoding='utf-8') as sf:
                for line in sf:
                    if line.startswith('.class') or line.startswith('.super') or 'onCreate(' in line:
                        print("  ", line.strip())
