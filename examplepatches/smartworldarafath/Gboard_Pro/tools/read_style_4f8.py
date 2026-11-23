import re

with open('temp_decompiled/res/values/styles.xml', 'r', encoding='utf-8') as f:
    text = f.read()

m = re.search(r'<style name="style_0x7f1504f8"[^>]*>.*?</style>', text, re.DOTALL)
if m:
    print(m.group(0))
