with open('temp_decompiled/smali_classes3/rkb.smali', 'r', encoding='utf-8') as f:
    text = f.read()

import re
clinit = re.search(r'\.method static constructor <clinit>\(\)V.*?\.end method', text, re.DOTALL)
if clinit:
    c_text = clinit.group(0)
    # find all string constants and style IDs put into map
    lines = c_text.splitlines()
    for i, line in enumerate(lines):
        if 'const-string' in line or '0x7f15' in line:
            print(line.strip())
