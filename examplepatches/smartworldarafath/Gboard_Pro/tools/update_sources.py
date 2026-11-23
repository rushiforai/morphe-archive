import os

files = []
for root, dirs, fnames in os.walk(r'pixelboard-patches/extensions/extension/src/main/java'):
    for f in fnames:
        if f.endswith('.java'):
            files.append(os.path.join(root, f).replace('\\', '/'))

files.sort()
with open('tools/sources.txt', 'w', encoding='utf-8') as fp:
    for f in files:
        fp.write(f'"{f}"\n')

print(f"Wrote {len(files)} source files to tools/sources.txt")
