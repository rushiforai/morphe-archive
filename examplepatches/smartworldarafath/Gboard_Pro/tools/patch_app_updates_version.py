path = 'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardAppUpdatesActivity.java'
with open(path, 'r', encoding='utf-8') as f:
    c = f.read()

c = c.replace('private static final String CURRENT_VERSION = "1.0.4";',
              'private static final String CURRENT_VERSION = com.akshaykadam.pixelboard.extension.BuildConfig.PATCH_VERSION;')

with open(path, 'w', encoding='utf-8') as f:
    f.write(c)
print('Updated GboardAppUpdatesActivity.java with dynamic BuildConfig version')
