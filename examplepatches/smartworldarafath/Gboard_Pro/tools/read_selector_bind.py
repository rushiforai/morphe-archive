with open('temp_decompiled/smali_classes3/com/android/settingslib/widget/SelectorWithWidgetPreference.smali', 'r', encoding='utf-8') as f:
    text = f.read()

import re
matches = re.findall(r'\.method.*?a\(Lcel;\)V.*?\.end method', text, re.DOTALL)
if matches:
    print("Found onBindViewHolder:")
    print(matches[0][:2000])
