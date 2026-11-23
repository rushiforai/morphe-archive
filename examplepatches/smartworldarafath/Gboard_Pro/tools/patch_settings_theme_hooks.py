# Patch SettingsActivity.smali
settings_smali = 'temp_decompiled/smali_classes2/com/google/android/apps/inputmethod/latin/preference/SettingsActivity.smali'
with open(settings_smali, 'r', encoding='utf-8') as f:
    text = f.read()

# 1. In onCreate:
target_call = 'invoke-static {p0}, Lcom/akshaykadam/pixelboard/extension/settings/GboardM3Helper;->applyActivityEnterTransition(Landroid/app/Activity;)V'
apply_call = target_call + '\n\n    invoke-static {p0}, Lcom/akshaykadam/pixelboard/extension/settings/GboardM3Helper;->applyTheme(Landroid/app/Activity;)V'

if 'GboardM3Helper;->applyTheme' not in text:
    if target_call in text:
        text = text.replace(target_call, apply_call)
        print("Hooked applyTheme into SettingsActivity.onCreate")
    else:
        print("Warning: target_call not found in SettingsActivity")

# 2. Add onResume
resume_method = '''.method protected onResume()V
    .locals 0

    invoke-super {p0}, Lexp;->onResume()V

    invoke-static {p0}, Lcom/akshaykadam/pixelboard/extension/settings/GboardM3Helper;->onActivityResume(Landroid/app/Activity;)V

    return-void
.end method
'''

if 'onActivityResume' not in text:
    # Append right before the last line or before end of class
    text = text.rstrip() + '\n\n' + resume_method
    print("Added onResume to SettingsActivity.smali")

with open(settings_smali, 'w', encoding='utf-8') as f:
    f.write(text)

# Patch LatinFirstRunActivity.smali
first_run_smali = 'temp_decompiled/smali_classes3/com/google/android/apps/inputmethod/latin/firstrun/LatinFirstRunActivity.smali'
with open(first_run_smali, 'r', encoding='utf-8') as f:
    fr_text = f.read()

fr_target = 'invoke-static {p0}, Lcom/akshaykadam/pixelboard/extension/updater/GboardNotificationHelper;->requestNotificationPermission(Landroid/app/Activity;)V'
fr_apply = fr_target + '\n\n    invoke-static {p0}, Lcom/akshaykadam/pixelboard/extension/settings/GboardM3Helper;->onActivityResume(Landroid/app/Activity;)V'

if 'GboardM3Helper;->onActivityResume' not in fr_text:
    if fr_target in fr_text:
        fr_text = fr_text.replace(fr_target, fr_apply)
        print("Hooked onActivityResume into LatinFirstRunActivity.onResume")
        with open(first_run_smali, 'w', encoding='utf-8') as f:
            f.write(fr_text)
    else:
        print("Warning: fr_target not found in LatinFirstRunActivity")
