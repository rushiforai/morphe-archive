import re

with open('pixelboard-patches/extensions/extension/src/main/settings-text/gboard_settings_text.xml', 'r', encoding='utf-8') as f:
    text = f.read()

for m in re.finditer(r'<string name="([^"]+)">([^<]+)</string>', text):
    k, v = m.group(1), m.group(2)
    if 'emoji' in k.lower() or 'emoji' in v.lower():
        print(f'{k}: {v}')
