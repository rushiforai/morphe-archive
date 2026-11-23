with open('pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardPatchesSettingsActivity.java', 'r', encoding='utf-8') as f:
    text = f.read()

text = text.replace('BuildConfig.PATCH_VERSION + " (Beta)"', 'BuildConfig.PATCH_VERSION + " (Beta 3.3)"')
with open('pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardPatchesSettingsActivity.java', 'w', encoding='utf-8') as f:
    f.write(text)
print("Updated GboardPatchesSettingsActivity.java version text")
