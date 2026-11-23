import re

lines = open(r'temp_decompiled/smali/com/akshaykadam/pixelboard/extension/settings/GboardM3Helper.smali', encoding='utf-8').readlines()
invokes = set()
for l in lines:
    m = re.search(r'invoke-[a-z/]+\s+\{[^}]*\}\s*,\s*([^;\s]+;->[^\s]+)', l)
    if m:
        invokes.add(m.group(1))

print("Total invoke targets in GboardM3Helper:", len(invokes))
for target in sorted(invokes):
    print(target)
