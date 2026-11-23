import os

for s in ['smali', 'smali_classes2', 'smali_classes3', 'smali_classes4', 'smali_classes5']:
    for root, dirs, files in os.walk(os.path.join('temp_decompiled', s)):
        if 'SelectorWithWidgetPreference.smali' in files:
            p = os.path.join(root, 'SelectorWithWidgetPreference.smali')
            print("Found SelectorWithWidgetPreference:", p)
            with open(p, 'r', encoding='utf-8') as f:
                print(f.read()[:2000])
