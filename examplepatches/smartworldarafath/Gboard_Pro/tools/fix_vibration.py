import re

# Update pny.smali f(I)V
pny_path = 'temp_decompiled/smali_classes2/pny.smali'
with open(pny_path, 'r', encoding='utf-8') as f:
    content = f.read()

f_pattern = r'\.method public final f\(I\)V.*?\.end method'
clean_f = '''.method public final f(I)V
    .locals 3

    iget-object v0, p0, Lpny;->j:Lvzq;
    if-eqz v0, :cond_0
    invoke-interface {v0}, Lvzq;->get()Ljava/lang/Object;
    move-result-object v0
    goto :goto_0
:cond_0
    const/4 v0, 0x0
:goto_0
    const/4 v1, 0x0
    invoke-static {v0, p1, v1}, Lcom/akshaykadam/pixelboard/extension/settings/GboardHapticHelper;->vibrateKeypress(Ljava/lang/Object;ILandroid/view/View;)V
    return-void
.end method'''

content = re.sub(f_pattern, clean_f, content, flags=re.DOTALL)
with open(pny_path, 'w', encoding='utf-8') as f:
    f.write(content)
print("pny.smali vibration updated!")

# Update VibrationDurationPreference.smali ap(I)V
vdp_path = 'temp_decompiled/smali_classes3/com/google/android/libraries/inputmethod/preferencewidgets/VibrationDurationPreference.smali'
with open(vdp_path, 'r', encoding='utf-8') as f:
    vdp_content = f.read()

ap_pattern = r'\.method public final ap\(I\)V.*?\.end method'
clean_ap = '''.method public final ap(I)V
    .locals 1

    if-lez p1, :cond_0

    iget-object v0, p0, Landroidx/preference/Preference;->j:Landroid/content/Context;
    invoke-static {v0, p1}, Lcom/akshaykadam/pixelboard/extension/settings/GboardHapticHelper;->vibratePreview(Landroid/content/Context;I)V

:cond_0
    return-void
.end method'''

vdp_content = re.sub(ap_pattern, clean_ap, vdp_content, flags=re.DOTALL)
with open(vdp_path, 'w', encoding='utf-8') as f:
    f.write(vdp_content)
print("VibrationDurationPreference.smali vibration preview updated!")
