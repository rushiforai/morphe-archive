import re

with open('temp_decompiled/AndroidManifest.xml', 'r', encoding='utf-8') as f:
    manifest = f.read()

extra_aliases = ['Purple', 'Slate', 'ForestGreen', 'NavyBlue']
for alias in extra_aliases:
    pattern = rf'\s*<activity-alias[^>]*android:name="com\.gboardpro\.app\.launcher\.{alias}"[^>]*>.*?</activity-alias>'
    manifest = re.sub(pattern, '', manifest, flags=re.DOTALL)

with open('temp_decompiled/AndroidManifest.xml', 'w', encoding='utf-8') as f:
    f.write(manifest)

print('Extra launcher aliases removed from AndroidManifest.xml!')
