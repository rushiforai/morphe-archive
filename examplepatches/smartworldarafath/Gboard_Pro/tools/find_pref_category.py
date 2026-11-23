import re

with open('temp_decompiled/res/values/styles.xml', 'r', encoding='utf-8') as f:
    text = f.read()

# search for preferenceCategoryStyle or attr_0x7f04077c / 0x7f04077d
matches = re.findall(r'<item name="([^"]*category[^"]*)">([^<]+)</item>', text, re.IGNORECASE)
print("Category styles:", matches[:10])

# check public.xml for preferenceCategoryStyle
with open('temp_decompiled/res/values/public.xml', 'r', encoding='utf-8') as f:
    pub = f.read()

m = re.search(r'<public type="attr" name="([^"]*category[^"]*)" id="([^"]+)" />', pub, re.IGNORECASE)
if m:
    print("Found attr in public:", m.group(0))
