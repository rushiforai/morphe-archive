with open('temp_decompiled/smali_classes2/com/google/android/apps/inputmethod/latin/preference/SettingsActivity.smali', 'r', encoding='utf-8') as f:
    text = f.read()

import re
m = re.search(r'\.method.*?onResume\(.*?\.end method', text, re.DOTALL)
if m:
    print("Found onResume in SettingsActivity:")
    print(m.group(0))
else:
    print("onResume not in SettingsActivity.smali, checking parent classes...")
