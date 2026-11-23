import zipfile

for apk in ['input/gboard.apk', 'input/PixelBoard-18.4.1-V7.apk']:
    try:
        with zipfile.ZipFile(apk, 'r') as z:
            matches = [n for n in z.namelist() if 'setting_clipboard' in n]
            print(f"{apk}: {matches}")
    except Exception as e:
        print(f"Error {apk}: {e}")
