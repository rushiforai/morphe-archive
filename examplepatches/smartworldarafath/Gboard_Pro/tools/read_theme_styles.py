import re

with open('temp_decompiled/res/values/styles.xml', 'r', encoding='utf-8') as f:
    text = f.read()

for sid in ['style_0x7f150c18', 'style_0x7f150c1f', 'style_0x7f150c20', 'style_0x7f150c22', 'style_0x7f150c23']:
    m = re.search(r'<style name="' + sid + r'"[^>]*>.*?</style>', text, re.DOTALL)
    if m:
        print(f"=== {sid} ===")
        print(m.group(0))
