with open('temp_decompiled/smali_classes2/qpm.smali', 'r', encoding='utf-8') as f:
    text = f.read()

import re
m = re.search(r'\.method.*?ac\(Lced;Landroidx/preference/Preference;\)V.*?\.end method', text, re.DOTALL)
if m:
    print(m.group(0))
