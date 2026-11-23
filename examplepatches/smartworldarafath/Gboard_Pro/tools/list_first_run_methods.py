with open('temp_decompiled/smali_classes3/com/google/android/apps/inputmethod/latin/firstrun/LatinFirstRunActivity.smali', 'r', encoding='utf-8') as f:
    for line in f:
        if line.startswith('.method'):
            print(line.strip())
