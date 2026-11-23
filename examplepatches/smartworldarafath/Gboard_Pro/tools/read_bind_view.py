with open('temp_decompiled/smali_classes3/com/android/settingslib/widget/SelectorWithWidgetPreference.smali', 'r', encoding='utf-8') as f:
    text = f.read()

import re
m = re.search(r'\.method public final a\(Lcel;\)V.*?\.end method', text, re.DOTALL)
if m:
    print(m.group(0)[:2000])
else:
    m = re.search(r'\.method public a\(Lcel;\)V.*?\.end method', text, re.DOTALL)
    print(m.group(0)[:2000] if m else "Not found")
