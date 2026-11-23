with open('temp_decompiled/smali_classes2/mxg.smali', 'r', encoding='utf-8') as f:
    content = f.read()

import re

# Clean method B
method_b_pattern = r'\.method protected final B\(Lad;\)Lbg;.*?\.end method'
clean_b = '''.method protected final B(Lad;)Lbg;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lag;->fm()Lay;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Lc;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lc;-><init>(Lay;)V

    const p0, 0x7f0b01e0

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p0, p1}, Lbg;->l(ILad;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method'''

content = re.sub(method_b_pattern, clean_b, content, flags=re.DOTALL)

# Clean method C
method_c_pattern = r'\.method public final C\(Lad;\)Lbg;.*?\.end method'
clean_c = '''.method public final C(Lad;)Lbg;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lmxg;->s:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    instance-of v0, p1, Lcom/google/android/libraries/inputmethod/preferencewidgets/PreferenceHeaderFragment;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lmxg;->B(Lad;)Lbg;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-virtual {p0}, Lag;->fm()Lay;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v0, Lc;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Lc;-><init>(Lay;)V

    const p0, 0x7f0b0225

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p0, p1}, Lbg;->l(ILad;)V

    .line 27
    .line 28
    .line 29
    return-object v0

    .line 30
    :cond_1
    invoke-virtual {p0, p1}, Lmxg;->B(Lad;)Lbg;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method'''

content = re.sub(method_c_pattern, clean_c, content, flags=re.DOTALL)

with open('temp_decompiled/smali_classes2/mxg.smali', 'w', encoding='utf-8') as f:
    f.write(content)

print("mxg.smali cleaned successfully!")
