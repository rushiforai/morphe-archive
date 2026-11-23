import re

# 1. Patch LatinFirstRunActivity.smali
path_firstrun = 'temp_decompiled/smali_classes3/com/google/android/apps/inputmethod/latin/firstrun/LatinFirstRunActivity.smali'
with open(path_firstrun, 'r', encoding='utf-8') as f:
    fr_code = f.read()

hook_call = '    invoke-static {p0}, Lcom/akshaykadam/pixelboard/extension/updater/GboardNotificationHelper;->requestNotificationPermission(Landroid/app/Activity;)V\n'
if 'GboardNotificationHelper;->requestNotificationPermission' not in fr_code:
    fr_code = fr_code.replace('invoke-super {p0}, Lppi;->onResume()V\n', 'invoke-super {p0}, Lppi;->onResume()V\n' + hook_call)
    with open(path_firstrun, 'w', encoding='utf-8') as f:
        f.write(fr_code)
    print("Patched LatinFirstRunActivity.smali with notification request hook")
else:
    print("LatinFirstRunActivity.smali already patched")

# 2. Patch SettingsActivity.smali
path_settings = 'temp_decompiled/smali_classes2/com/google/android/apps/inputmethod/latin/preference/SettingsActivity.smali'
with open(path_settings, 'r', encoding='utf-8') as f:
    st_code = f.read()

if 'GboardNotificationHelper;->requestNotificationPermission' not in st_code:
    st_code = st_code.replace('invoke-super {p0, p1}, Lexp;->onCreate(Landroid/os/Bundle;)V\n',
                               'invoke-super {p0, p1}, Lexp;->onCreate(Landroid/os/Bundle;)V\n' + hook_call)
    with open(path_settings, 'w', encoding='utf-8') as f:
        f.write(st_code)
    print("Patched SettingsActivity.smali with notification request hook")
else:
    print("SettingsActivity.smali already patched")

# 3. Patch GboardPatchesSettingsActivity.java
path_patch_act = 'pixelboard-patches/extensions/extension/src/main/java/com/akshaykadam/pixelboard/extension/settings/GboardPatchesSettingsActivity.java'
with open(path_patch_act, 'r', encoding='utf-8') as f:
    act_code = f.read()

if 'GboardNotificationHelper.requestNotificationPermission' not in act_code:
    target = 'registerBackCallback();'
    replacement = '''registerBackCallback();
            com.akshaykadam.pixelboard.extension.updater.GboardNotificationHelper.requestNotificationPermission(this);
            com.akshaykadam.pixelboard.extension.updater.GboardNotificationHelper.ensureNotificationChannel(this);
            if (com.akshaykadam.pixelboard.extension.updater.PixelBoardUpdateManager.isAutoCheckEnabled(this)) {
                com.akshaykadam.pixelboard.extension.updater.GboardUpdateCheckReceiver.scheduleUpdateCheck(this);
            }'''
    act_code = act_code.replace(target, replacement)
    with open(path_patch_act, 'w', encoding='utf-8') as f:
        f.write(act_code)
    print("Patched GboardPatchesSettingsActivity.java with notification & 8hr update init")
else:
    print("GboardPatchesSettingsActivity.java already patched")
