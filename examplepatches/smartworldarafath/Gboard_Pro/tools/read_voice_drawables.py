import os

for f in ['temp_decompiled/res/drawable/drawable_0x7f080485.xml', 'temp_decompiled/res/drawable/drawable_0x7f080486.xml']:
    if os.path.exists(f):
        print(f"=== {f} ===")
        with open(f, 'r', encoding='utf-8') as df:
            print(df.read())
    else:
        print(f"{f} not found")
