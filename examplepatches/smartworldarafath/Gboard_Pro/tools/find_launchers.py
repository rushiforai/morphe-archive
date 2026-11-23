import re

with open('temp_decompiled/AndroidManifest.xml', 'r', encoding='utf-8') as f:
    c = f.read()

print("=== ACTIVITIES WITH MAIN / LAUNCHER ===")
for m in re.finditer(r'<activity\b([^>]*)>(.*?)</activity>', c, re.DOTALL):
    attrs = m.group(1)
    body = m.group(2)
    if 'android.intent.action.MAIN' in body or 'android.intent.category.LAUNCHER' in body:
        name_m = re.search(r'android:name="([^"]+)"', attrs)
        name = name_m.group(1) if name_m else 'unknown'
        print(f"Activity: {name}")
        for action in re.findall(r'<action\s+android:name="([^"]+)"', body):
            print(f"  Action: {action}")
        for cat in re.findall(r'<category\s+android:name="([^"]+)"', body):
            print(f"  Category: {cat}")

print("\n=== ACTIVITY-ALIASES WITH MAIN / LAUNCHER ===")
for m in re.finditer(r'<activity-alias\b([^>]*)>(.*?)</activity-alias>', c, re.DOTALL):
    attrs = m.group(1)
    body = m.group(2)
    if 'android.intent.action.MAIN' in body or 'android.intent.category.LAUNCHER' in body:
        name_m = re.search(r'android:name="([^"]+)"', attrs)
        target_m = re.search(r'android:targetActivity="([^"]+)"', attrs)
        enabled_m = re.search(r'android:enabled="([^"]+)"', attrs)
        name = name_m.group(1) if name_m else 'unknown'
        target = target_m.group(1) if target_m else 'unknown'
        enabled = enabled_m.group(1) if enabled_m else 'default(true)'
        print(f"Alias: {name} -> Target: {target} (enabled: {enabled})")
        for action in re.findall(r'<action\s+android:name="([^"]+)"', body):
            print(f"  Action: {action}")
        for cat in re.findall(r'<category\s+android:name="([^"]+)"', body):
            print(f"  Category: {cat}")
