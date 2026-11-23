import re

with open('temp_decompiled/res/values/public.xml', 'r', encoding='utf-8') as f:
    text = f.read()

m = re.search(r'<public[^>]+id="0x7f0404cc"[^>]*/>', text)
print(m.group(0) if m else "Not found")

# Also search styles.xml or attrs.xml for attr_0x7f0404cc
for fn in ['temp_decompiled/res/values/attrs.xml', 'temp_decompiled/res/values/styles.xml']:
    with open(fn, 'r', encoding='utf-8') as f:
        t = f.read()
    found = re.findall(r'<item name="attr_0x7f0404cc">([^<]+)</item>', t)
    if found:
        print(f"Values in {fn}:", found[:5])
