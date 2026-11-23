import re

with open('temp_decompiled/res/values/public.xml', 'r', encoding='utf-8') as f:
    text = f.read()

attrs = ['0x7f04049d', '0x7f0404a1', '0x7f0404a7', '0x7f0404aa', '0x7f0404ad', '0x7f0404ae', '0x7f0404b4', '0x7f0404b5', '0x7f0404b8', '0x7f0404b9', '0x7f0404bc', '0x7f0404bd', '0x7f0404c0', '0x7f0404c8', '0x7f0404c9', '0x7f0404ca', '0x7f0404cb', '0x7f0404cc', '0x7f0404ce', '0x7f0404cf', '0x7f0404de', '0x7f0404df', '0x7f0404e1', '0x7f0404e7', '0x7f0404e9', '0x7f0404ea', '0x7f0404eb', '0x7f0404ec', '0x7f0404ed', '0x7f0404ee', '0x7f0404ef', '0x7f0404f0', '0x7f0404f2', '0x7f0404f3', '0x7f0404f5', '0x7f0406d9']

for aid in attrs:
    m = re.search(r'<public type="attr" name="([^"]+)" id="' + aid + r'" />', text)
    if m:
        print(f"{aid} -> {m.group(1)}")
    else:
        print(f"{aid} -> NOT FOUND")
