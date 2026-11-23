import re

with open('temp_decompiled/res/values/styles.xml', 'r', encoding='utf-8') as f:
    text = f.read()

for cid in ['color_0x7f060ade', 'color_0x7f060b21', 'color_0x7f060b4f', 'color_0x7f060b59', 'color_0x7f060add']:
    m = re.findall(r'<item name="([^"]+)">@color/' + cid + r'</item>', text)
    if m:
        print(f"styles.xml uses {cid} for attrs:", m[:5])
