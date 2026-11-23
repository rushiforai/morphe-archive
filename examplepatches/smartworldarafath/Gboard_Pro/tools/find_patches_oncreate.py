with open('pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardPatchesSettingsActivity.java', 'r', encoding='utf-8') as f:
    lines = f.readlines()

for i, line in enumerate(lines):
    if 'onCreate(' in line:
        print(f"Line {i+1}: {line.strip()}")
        print("".join(lines[i:i+25]))
        break
