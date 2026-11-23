path = 'temp_decompiled/res/xml/setting_about.xml'
with open(path, 'r', encoding='utf-8') as f:
    c = f.read()

c = c.replace('summary="1.0.4 (18.4.1.985164140)"',
              'summary="v2.0.2 (18.4.1.985164140)"')

with open(path, 'w', encoding='utf-8') as f:
    f.write(c)
print('Updated setting_about.xml')
