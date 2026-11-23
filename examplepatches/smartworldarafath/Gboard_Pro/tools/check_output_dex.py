import zipfile
import os

with zipfile.ZipFile('output/Gboard_Pro.apk', 'r') as z:
    for name in z.namelist():
        if name.endswith('.dex'):
            print("Found dex in output/Gboard_Pro.apk:", name)
