import os
import shutil

src_dir = os.path.join('temp_smali', 'smali', 'com', 'akshaykadam', 'pixelboard', 'extension')
dest_dir = os.path.join('temp_decompiled', 'smali', 'com', 'akshaykadam', 'pixelboard', 'extension')

count = 0
for root, dirs, files in os.walk(src_dir):
    rel = os.path.relpath(root, src_dir)
    target_root = os.path.join(dest_dir, rel)
    os.makedirs(target_root, exist_ok=True)
    for f in files:
        if f.endswith('.smali'):
            src_f = os.path.join(root, f)
            dest_f = os.path.join(target_root, f)
            shutil.copy2(src_f, dest_f)
            count += 1

print(f"Copied {count} smali files to {dest_dir}!")
