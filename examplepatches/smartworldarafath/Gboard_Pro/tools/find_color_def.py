import re

with open('temp_decompiled/res/values/colors.xml', 'r', encoding='utf-8') as f:
    text = f.read()

for cid in ['color_0x7f060add', 'color_0x7f060ade', 'color_0x7f060b21', 'color_0x7f060b22', 'color_0x7f060b4f', 'color_0x7f060b59']:
    m = re.search(r'<color name="' + cid + r'">([^<]+)</color>', text)
    if m:
        print(f"values/colors.xml {cid} = {m.group(1)}")
