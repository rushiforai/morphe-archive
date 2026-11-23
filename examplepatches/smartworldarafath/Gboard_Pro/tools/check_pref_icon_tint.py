import os

for s in ['smali', 'smali_classes2', 'smali_classes3', 'smali_classes4', 'smali_classes5']:
    p = os.path.join('temp_decompiled', s, 'androidx', 'preference', 'Preference.smali')
    if os.path.exists(p):
        print("Found Preference.smali:", p)
        with open(p, 'r', encoding='utf-8') as f:
            t = f.read()
            if 'setColorFilter' in t or 'setTint' in t or 'iconTint' in t:
                print("Preference.smali has tinting code!")
            else:
                print("No tinting code in Preference.smali")
