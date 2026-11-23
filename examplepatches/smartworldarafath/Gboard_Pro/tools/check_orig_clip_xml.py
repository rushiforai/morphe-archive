import zipfile

with zipfile.ZipFile('input/gboard.apk', 'r') as z:
    for name in z.namelist():
        if 'setting_clipboard.xml' in name:
            print("Found in gboard.apk:", name)
