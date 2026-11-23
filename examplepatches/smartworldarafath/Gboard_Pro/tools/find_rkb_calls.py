import os

for s in ['smali', 'smali_classes2', 'smali_classes3', 'smali_classes4', 'smali_classes5']:
    for root, dirs, files in os.walk(os.path.join('temp_decompiled', s)):
        for f in files:
            p = os.path.join(root, f)
            with open(p, 'r', encoding='utf-8', errors='ignore') as sf:
                t = sf.read()
                if 'Lrkb;->a(' in t:
                    print("Found call to rkb.a:", p)
