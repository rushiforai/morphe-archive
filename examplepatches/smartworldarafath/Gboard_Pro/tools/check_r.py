import os

path = os.path.join("temp_decompiled", "smali", "com", "akshaykadam", "pixelboard", "extension", "R$string.smali")
with open(path) as f:
    for line in f:
        if "gboard_patches" in line:
            print(line.strip())
