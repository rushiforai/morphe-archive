import re

with open('temp_decompiled/res/values/styles.xml', 'r', encoding='utf-8') as f:
    text = f.read()

m = re.findall(r'<item name="attr_0x7f04049b">([^<]+)</item>', text)
print("attr_0x7f04049b values:", m)
