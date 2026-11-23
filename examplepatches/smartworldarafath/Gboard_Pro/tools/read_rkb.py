with open('temp_decompiled/smali_classes3/rkb.smali', 'r', encoding='utf-8') as f:
    text = f.read()

import re
matches = [m.start() for m in re.finditer(r'7f150c18', text)]
for idx in matches:
    start = max(0, idx - 500)
    end = min(len(text), idx + 500)
    print("--- MATCH ---")
    print(text[start:end])
