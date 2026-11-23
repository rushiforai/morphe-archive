import os

for root, dirs, files in os.walk('temp_decompiled/res'):
    for f in files:
        if f == 'colors.xml':
            print("Found colors file:", os.path.join(root, f))
