with open('temp_decompiled/smali_classes3/com/google/android/libraries/inputmethod/preferencewidgets/LabelSummarySliderPreference.smali', 'r', encoding='utf-8') as f:
    text = f.read()

for line in text.splitlines():
    if 'GboardClipboard' in line:
        print(line)
