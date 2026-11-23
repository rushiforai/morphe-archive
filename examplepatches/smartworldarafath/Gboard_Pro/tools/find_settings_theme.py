import re

with open('temp_decompiled/AndroidManifest.xml', 'r', encoding='utf-8') as f:
    text = f.read()

m = re.search(r'<activity[^>]+SettingsActivity[^>]*>', text)
if m:
    print(m.group(0))
else:
    # search across multi-line
    m = re.search(r'<activity[^>]*?android:name="com\.google\.android\.apps\.inputmethod\.latin\.preference\.SettingsActivity"[^>]*?>', text, re.DOTALL)
    print(m.group(0) if m else "Not found")
