path = 'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardAboutActivity.java'
with open(path, 'r', encoding='utf-8') as f:
    c = f.read()

c = c.replace('"1.0.4 (18.4.1.985164140-release-arm64-v8a)"',
              '"v" + com.akshaykadam.pixelboard.extension.BuildConfig.PATCH_VERSION + " (18.4.1.985164140-release-arm64-v8a)"')
c = c.replace('versionChip.setText("v1.0.4 Stable");',
              'versionChip.setText("v" + com.akshaykadam.pixelboard.extension.BuildConfig.PATCH_VERSION + " (Beta)");')
c = c.replace('tv.setText("Gboard Pro\\nVersion 1.0.4',
              'tv.setText("Gboard Pro\\nVersion " + com.akshaykadam.pixelboard.extension.BuildConfig.PATCH_VERSION')

with open(path, 'w', encoding='utf-8') as f:
    f.write(c)
print('Updated GboardAboutActivity.java successfully')
