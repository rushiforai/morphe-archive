with open('temp_decompiled/smali_classes3/com/android/settingslib/widget/SelectorWithWidgetPreference.smali', 'r', encoding='utf-8') as f:
    lines = f.readlines()

for i, line in enumerate(lines):
    if 'ao(' in line:
        print("".join(lines[i:i+60]))
        break
