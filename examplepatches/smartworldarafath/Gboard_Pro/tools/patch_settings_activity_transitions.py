path = r'temp_decompiled\smali_classes2\com\google\android\apps\inputmethod\latin\preference\SettingsActivity.smali'
with open(path, 'r', encoding='utf-8') as f:
    code = f.read()

# Add applyActivityEnterTransition in onCreate if not already present
if 'applyActivityEnterTransition' not in code:
    target = 'invoke-static {v0}, Lcom/akshaykadam/pixelboard/extension/settings/GboardM3Helper;->enforceHighRefreshRate(Landroid/view/Window;)V'
    replacement = target + '\n\n    invoke-static {p0}, Lcom/akshaykadam/pixelboard/extension/settings/GboardM3Helper;->applyActivityEnterTransition(Landroid/app/Activity;)V'
    if target in code:
        code = code.replace(target, replacement)
        print("Added applyActivityEnterTransition to SettingsActivity.onCreate")

# Add finish() override if not present
if '.method public finish()V' not in code:
    finish_method = '''
.method public finish()V
    .locals 0

    invoke-super {p0}, Lexp;->finish()V

    invoke-static {p0}, Lcom/akshaykadam/pixelboard/extension/settings/GboardM3Helper;->applyActivityExitTransition(Landroid/app/Activity;)V

    return-void
.end method
'''
    code += finish_method
    print("Added finish() with applyActivityExitTransition to SettingsActivity")

with open(path, 'w', encoding='utf-8') as f:
    f.write(code)
print("SettingsActivity transitions updated!")
