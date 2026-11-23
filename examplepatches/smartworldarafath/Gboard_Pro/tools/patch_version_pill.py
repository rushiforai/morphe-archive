path = 'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardPatchesSettingsActivity.java'
with open(path, 'r', encoding='utf-8') as f:
    c = f.read()

target = 'versionPill.setText("v1.0.5 (Beta)");'
replacement = 'versionPill.setText("v" + com.akshaykadam.pixelboard.extension.BuildConfig.PATCH_VERSION + " (Beta)");'
if target in c:
    c = c.replace(target, replacement)
    with open(path, 'w', encoding='utf-8') as f:
        f.write(c)
    print('Updated version pill in GboardPatchesSettingsActivity.java')
else:
    print('Target not found in GboardPatchesSettingsActivity.java')
