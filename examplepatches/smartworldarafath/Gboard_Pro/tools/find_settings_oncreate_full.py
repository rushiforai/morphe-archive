with open('temp_decompiled/smali_classes2/com/google/android/apps/inputmethod/latin/preference/SettingsActivity.smali', 'r', encoding='utf-8') as f:
    lines = f.readlines()
in_on_create = False
for line in lines:
    if 'onCreate(' in line:
        in_on_create = True
    if in_on_create:
        print(line, end="")
        if '.end method' in line:
            break
