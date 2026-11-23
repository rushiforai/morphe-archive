path = r'temp_decompiled\smali_classes3\com\google\android\libraries\inputmethod\launcher\LauncherActivity.smali'
with open(path, 'r', encoding='utf-8') as f:
    code = f.read()

target = """.method protected final onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Lrcq;->bl(Landroid/content/Context;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Lcom/google/android/libraries/inputmethod/launcher/LauncherActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/google/android/libraries/inputmethod/launcher/LauncherActivity;->d:Z

    .line 13
    .line 14
    return-void
.end method"""

replacement = """.method protected final onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/google/android/apps/inputmethod/latin/preference/SettingsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const v1, 0x14000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/inputmethod/launcher/LauncherActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    invoke-virtual {p0}, Lcom/google/android/libraries/inputmethod/launcher/LauncherActivity;->finish()V

    return-void
.end method"""

if target in code:
    code = code.replace(target, replacement)
    with open(path, 'w', encoding='utf-8') as f:
        f.write(code)
    print("Patched LauncherActivity.smali successfully!")
else:
    print("Error: Target not found in LauncherActivity.smali")
