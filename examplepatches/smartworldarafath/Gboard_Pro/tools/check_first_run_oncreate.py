with open('temp_decompiled/smali_classes3/com/google/android/apps/inputmethod/latin/firstrun/LatinFirstRunActivity.smali', 'r', encoding='utf-8') as f:
    text = f.read()

import re
m = re.search(r'\.method protected.*?onCreate\(.*?\.end method', text, re.DOTALL)
if m:
    print(m.group(0))
