import os, sys, zipfile
root, out = sys.argv[1], sys.argv[2]
files = []
for d, _, fs in os.walk(root):
    for f in fs:
        files.append(os.path.relpath(os.path.join(d, f), root))
files.sort(key=lambda p: (p != 'META-INF/MANIFEST.MF', p))
if os.path.exists(out): os.remove(out)
with zipfile.ZipFile(out, 'w', zipfile.ZIP_DEFLATED) as z:
    for p in files: z.write(os.path.join(root, p), p)
