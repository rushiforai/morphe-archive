with open('temp_decompiled/smali_classes3/com/android/settingslib/widget/SelectorWithWidgetPreference.smali', 'r', encoding='utf-8') as f:
    text = f.read()

import re
m = re.search(r'\.method private final ao\(.*?\.end method', text, re.DOTALL)
if m:
    print(m.group(0))
