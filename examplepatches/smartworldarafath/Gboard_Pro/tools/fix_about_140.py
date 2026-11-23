path = 'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardAboutActivity.java'
with open(path, 'r', encoding='utf-8') as f:
    lines = f.readlines()

for i, line in enumerate(lines):
    if 'tv.setText("Gboard Pro' in line:
        lines[i] = '            tv.setText("Gboard Pro\\nVersion " + com.akshaykadam.pixelboard.extension.BuildConfig.PATCH_VERSION + "\\n\\nDeveloper: Arafath Rahman (@smartworldarafath)\\nGitHub: https://github.com/smartworldarafath/Gboard_Pro");\n'
        print(f"Fixed line {i+1}")

with open(path, 'w', encoding='utf-8') as f:
    f.writelines(lines)
