import os

print("Searching for DynamicColors in smali...")
for root, dirs, files in os.walk('temp_decompiled'):
    if not any(root.startswith(os.path.join('temp_decompiled', s)) for s in ['smali', 'smali_classes2', 'smali_classes3', 'smali_classes4', 'smali_classes5']):
        continue
    for f in files:
        if 'dynamic' in f.lower():
            print("Found dynamic file:", os.path.join(root, f))
