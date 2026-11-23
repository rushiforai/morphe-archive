with open('temp_decompiled/smali_classes3/rkb.smali', 'r', encoding='utf-8') as f:
    lines = f.readlines()

print("".join(lines[:60]))
print("...")
for i, line in enumerate(lines):
    if '.method' in line:
        print(line.strip())
