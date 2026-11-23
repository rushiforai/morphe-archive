import os
import re

print("--- Reverting v2.0.3 theming changes ---")

# 1. Clean styles.xml
styles_path = 'temp_decompiled/res/values/styles.xml'
if os.path.exists(styles_path):
    with open(styles_path, 'r', encoding='utf-8') as f:
        content = f.read()
    if 'GboardProTheme' in content:
        content = re.sub(r'\s*<!-- Gboard Pro Dynamic Theme Overlays -->.*?</style>\s*', '\n', content, flags=re.DOTALL)
        content = re.sub(r'\s*<style name="GboardProTheme_.*?</style>\s*', '\n', content, flags=re.DOTALL)
        with open(styles_path, 'w', encoding='utf-8') as f:
            f.write(content)
        print("1. Successfully removed GboardProTheme from styles.xml")
    else:
        print("1. GboardProTheme not present in styles.xml")

# 2. Revert SettingsActivity.smali
settings_smali = 'temp_decompiled/smali_classes2/com/google/android/apps/inputmethod/latin/preference/SettingsActivity.smali'
if os.path.exists(settings_smali):
    with open(settings_smali, 'r', encoding='utf-8') as f:
        text = f.read()

    # Remove applyTheme
    apply_call = '\n\n    invoke-static {p0}, Lcom/akshaykadam/pixelboard/extension/settings/GboardM3Helper;->applyTheme(Landroid/app/Activity;)V'
    if apply_call in text:
        text = text.replace(apply_call, '')
        print("2a. Removed applyTheme from SettingsActivity.onCreate")
    else:
        # Try regex if spacing differs
        text = re.sub(r'\s*invoke-static \{p0\}, Lcom/akshaykadam/pixelboard/extension/settings/GboardM3Helper;->applyTheme\(Landroid/app/Activity;\)V', '', text)
        print("2a. Cleaned applyTheme from SettingsActivity.onCreate via regex")

    # Remove onResume
    resume_block = r'\.method protected onResume\(\)V.*?invoke-static \{p0\}, Lcom/akshaykadam/pixelboard/extension/settings/GboardM3Helper;->onActivityResume\(Landroid/app/Activity;\)V.*?\.end method'
    if re.search(resume_block, text, flags=re.DOTALL):
        text = re.sub(resume_block, '', text, flags=re.DOTALL)
        print("2b. Removed onResume from SettingsActivity.smali")
    else:
        print("2b. onResume not found or already removed in SettingsActivity.smali")

    with open(settings_smali, 'w', encoding='utf-8') as f:
        f.write(text)

# 3. Revert LatinFirstRunActivity.smali
first_run_smali = 'temp_decompiled/smali_classes3/com/google/android/apps/inputmethod/latin/firstrun/LatinFirstRunActivity.smali'
if os.path.exists(first_run_smali):
    with open(first_run_smali, 'r', encoding='utf-8') as f:
        fr_text = f.read()

    apply_resume = '\n\n    invoke-static {p0}, Lcom/akshaykadam/pixelboard/extension/settings/GboardM3Helper;->onActivityResume(Landroid/app/Activity;)V'
    if apply_resume in fr_text:
        fr_text = fr_text.replace(apply_resume, '')
        print("3. Removed onActivityResume from LatinFirstRunActivity.smali")
    else:
        fr_text = re.sub(r'\s*invoke-static \{p0\}, Lcom/akshaykadam/pixelboard/extension/settings/GboardM3Helper;->onActivityResume\(Landroid/app/Activity;\)V', '', fr_text)
        print("3. Cleaned onActivityResume from LatinFirstRunActivity.smali via regex")

    with open(first_run_smali, 'w', encoding='utf-8') as f:
        f.write(fr_text)

# 4. Remove GboardCustomClipboardRetentionActivity from AndroidManifest.xml
manifest_path = 'temp_decompiled/AndroidManifest.xml'
if os.path.exists(manifest_path):
    with open(manifest_path, 'r', encoding='utf-8') as f:
        m_text = f.read()

    if 'GboardCustomClipboardRetentionActivity' in m_text:
        m_text = re.sub(r'\s*<activity[^>]*GboardCustomClipboardRetentionActivity[^>]*>.*?</activity>\s*', '\n', m_text, flags=re.DOTALL)
        m_text = re.sub(r'\s*<activity[^>]*GboardCustomClipboardRetentionActivity[^>]*/>\s*', '\n', m_text, flags=re.DOTALL)
        with open(manifest_path, 'w', encoding='utf-8') as f:
            f.write(m_text)
        print("4. Removed GboardCustomClipboardRetentionActivity from AndroidManifest.xml")
    else:
        print("4. GboardCustomClipboardRetentionActivity not found in AndroidManifest.xml")

# 5. Delete lingering smali files for clipboard retention & preference helper
smali_base = 'temp_decompiled/smali'
deleted_count = 0
for root, dirs, files in os.walk(smali_base):
    for f in files:
        if 'GboardClipboardPreferenceHelper' in f or 'GboardCustomClipboardRetentionActivity' in f:
            full_path = os.path.join(root, f)
            os.remove(full_path)
            print("5. Deleted smali:", full_path)
            deleted_count += 1
print(f"5. Total deleted lingering clipboard smali files: {deleted_count}")

print("--- Done ---")
