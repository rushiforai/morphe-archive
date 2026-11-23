import os

path = r'temp_decompiled/smali_classes3/com/google/android/libraries/inputmethod/launcher/LauncherActivity.smali'
with open(path, 'r', encoding='utf-8') as f:
    code = f.read()

import re

new_on_create = """.method protected final onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    new-instance v0, Lrxp;

    invoke-direct {v0, p0}, Lrxp;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lrxp;->n()Z

    move-result v1

    if-eqz v1, :cond_setup

    invoke-virtual {v0}, Lrxp;->p()Z

    move-result v0

    if-nez v0, :cond_settings

    :cond_setup
    const/4 v0, 0x1

    :try_start_0
    invoke-static {p0, v0}, Lppc;->b(Landroid/content/Context;Z)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/android/libraries/inputmethod/launcher/LauncherActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_setup

    invoke-virtual {p0}, Lcom/google/android/libraries/inputmethod/launcher/LauncherActivity;->finish()V

    return-void

    :catch_setup
    :cond_settings
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/google/android/apps/inputmethod/latin/preference/SettingsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const v1, 0x14000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    :try_start_1
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/inputmethod/launcher/LauncherActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    invoke-virtual {p0}, Lcom/google/android/libraries/inputmethod/launcher/LauncherActivity;->finish()V

    return-void
.end method"""

pattern = r'\.method protected final onCreate\(Landroid/os/Bundle;\)V.*?\.end method'
code, count = re.subn(pattern, new_on_create, code, flags=re.DOTALL)

if count > 0:
    with open(path, 'w', encoding='utf-8') as f:
        f.write(code)
    print("LauncherActivity.smali onCreate successfully patched to check keyboard activation!")
else:
    print("Error: Could not find onCreate in LauncherActivity.smali")
