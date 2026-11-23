import re

with open('temp_decompiled/res/values/public.xml', 'r', encoding='utf-8') as f:
    text = f.read()

for id_str in ['0x7f08025d', '0x7f0404aa', '0x7f070721']:
    m = re.search(r'<public[^>]+id="' + id_str + r'"[^>]*/>', text)
    if m:
        print(m.group(0))
