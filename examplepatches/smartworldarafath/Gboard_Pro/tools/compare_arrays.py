import re

with open('scratch/pixelboard_apk/res/values/arrays.xml', 'r', encoding='utf-8') as f:
    pb_arr = f.read()
with open('temp_decompiled/res/values/arrays.xml', 'r', encoding='utf-8') as f:
    our_arr = f.read()

pb_dict = dict(re.findall(r'<string-array name="([^"]+)">(.*?)</string-array>', pb_arr, re.DOTALL))
our_dict = dict(re.findall(r'<string-array name="([^"]+)">(.*?)</string-array>', our_arr, re.DOTALL))

for k in pb_dict:
    if k in our_dict:
        if pb_dict[k].strip() != our_dict[k].strip():
            print(f"Diff in array: {k}")
            print(f"  PB : {pb_dict[k].strip()}")
            print(f"  Our: {our_dict[k].strip()}")
