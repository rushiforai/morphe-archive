import re

with open('temp_decompiled/AndroidManifest.xml', 'r', encoding='utf-8') as f:
    content = f.read()

activities = re.findall(r'<activity[^>]+android:name="([^"]+)"', content)
print(f"Total activities: {len(activities)}")
for a in activities:
    if any(k in a.lower() for k in ['setting', 'pref', 'latin', 'sub', 'theme', 'about']):
        print("MATCH:", a)
