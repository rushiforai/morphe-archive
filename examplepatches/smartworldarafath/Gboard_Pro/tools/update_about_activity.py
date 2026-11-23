with open('pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardAboutActivity.java', 'r', encoding='utf-8') as f:
    text = f.read()

text = text.replace('" (Beta)"', '" (Beta 3.3)"')
with open('pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardAboutActivity.java', 'w', encoding='utf-8') as f:
    f.write(text)
print("Updated GboardAboutActivity.java")
