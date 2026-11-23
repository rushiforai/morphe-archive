import os

# Fix 1: GboardM3Helper.java
m3_path = r'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardM3Helper.java'
with open(m3_path, 'r', encoding='utf-8') as f:
    m3_code = f.read()

m3_code = m3_code.replace('dp(context, 1.5f)', 'dp(context, 2)')
with open(m3_path, 'w', encoding='utf-8') as f:
    f.write(m3_code)
print('Fixed GboardM3Helper.java')

# Fix 2: GboardPatchesSettingsActivity.java
act_path = r'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardPatchesSettingsActivity.java'
with open(act_path, 'r', encoding='utf-8') as f:
    act_code = f.read()

act_code = act_code.replace('PreferenceManager.getDefaultSharedPreferences(context)',
                            'android.preference.PreferenceManager.getDefaultSharedPreferences(context)')
with open(act_path, 'w', encoding='utf-8') as f:
    f.write(act_code)
print('Fixed GboardPatchesSettingsActivity.java')
