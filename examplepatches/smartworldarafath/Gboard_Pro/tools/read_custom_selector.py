import os

for s in ['smali', 'smali_classes2', 'smali_classes3', 'smali_classes4', 'smali_classes5']:
    for root, dirs, files in os.walk(os.path.join('temp_decompiled', s)):
        if 'CustomSelectorWithWidgetPreference.smali' in files:
            p = os.path.join(root, 'CustomSelectorWithWidgetPreference.smali')
            print("Found CustomSelectorWithWidgetPreference:", p)
            with open(p, 'r', encoding='utf-8') as f:
                print(f.read()[:2000])
