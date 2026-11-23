import os

for s in ['smali', 'smali_classes2', 'smali_classes3', 'smali_classes4', 'smali_classes5']:
    for root, dirs, files in os.walk(os.path.join('temp_decompiled', s)):
        if 'LatinFirstRunActivity.smali' in files:
            print("Found LatinFirstRunActivity:", os.path.join(root, 'LatinFirstRunActivity.smali'))
