import re

with open('temp_decompiled/res/values/public.xml', 'r', encoding='utf-8') as f:
    pub = f.read()

for m in re.finditer(r'<public type="attr" name="([^"]+)" id="([^"]+)" />', pub):
    name = m.group(1)
    if 'category' in name.lower() or 'preference' in name.lower():
        print(m.group(0))
