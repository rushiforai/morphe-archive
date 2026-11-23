import os

path = r'temp_decompiled/smali_classes3/com/google/android/libraries/inputmethod/launcher/LauncherActivity.smali'
with open(path, 'r', encoding='utf-8') as f:
    content = f.read()

target = """.method protected final onResume()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/google/android/libraries/inputmethod/launcher/LauncherActivity;->b:Z"""

rep = """.method protected final onResume()V
    .locals 3

    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    invoke-virtual {p0}, Lcom/google/android/libraries/inputmethod/launcher/LauncherActivity;->finish()V

    return-void

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/google/android/libraries/inputmethod/launcher/LauncherActivity;->b:Z"""

norm_content = content.replace('\\r\\n', '\\n')
norm_target = target.replace('\\r\\n', '\\n')
norm_rep = rep.replace('\\r\\n', '\\n')

if norm_target in norm_content:
    norm_content = norm_content.replace(norm_target, norm_rep, 1)
    with open(path, 'w', encoding='utf-8') as f:
        f.write(norm_content)
    print("LauncherActivity onResume patched successfully!")
else:
    print("Target not found in LauncherActivity.smali")
