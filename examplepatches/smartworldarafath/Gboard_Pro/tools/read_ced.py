with open('temp_decompiled/smali_classes3/ced.smali', 'r', encoding='utf-8') as f:
    text = f.read()

print(text[:500])
import re
m = re.search(r'\.method.*?onPreferenceStartFragment.*?\.end method', text, re.DOTALL)
if m:
    print(m.group(0))
