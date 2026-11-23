with open('pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardAboutFeature.java', 'r', encoding='utf-8') as f:
    text = f.read()

text = text.replace('" (Beta Dynamic Colors)"', '" (Beta 3.3)"')
text = text.replace('"v" + com.akshaykadam.pixelboard.extension.BuildConfig.PATCH_VERSION + " (Beta)"', '"v" + com.akshaykadam.pixelboard.extension.BuildConfig.PATCH_VERSION + " (Beta 3.3)"')

with open('pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardAboutFeature.java', 'w', encoding='utf-8') as f:
    f.write(text)
print("Updated GboardAboutFeature.java")
