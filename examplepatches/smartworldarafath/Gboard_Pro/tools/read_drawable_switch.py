import os

for root, dirs, files in os.walk('temp_decompiled/res'):
    for f in files:
        if 'drawable_0x7f08025d' in f:
            p = os.path.join(root, f)
            print("Found drawable:", p)
            with open(p, 'r', encoding='utf-8') as df:
                print(df.read())
