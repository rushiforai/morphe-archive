import re

with open('temp_decompiled/AndroidManifest.xml', 'r', encoding='utf-8') as f:
    manifest = f.read()

for block in re.finditer(r'<(activity|activity-alias)[^>]+android:name="([^"]+)"[^>]*>(.*?)</\1>', manifest, re.DOTALL):
    tag = block.group(1)
    name = block.group(2)
    content = block.group(3)
    if 'android.intent.action.MAIN' in content and 'android.intent.category.LAUNCHER' in content:
        print('Tag:', tag, 'Name:', name)
        target = re.findall(r'android:targetActivity="([^"]+)"', block.group(0))
        print('  targetActivity:', target)
