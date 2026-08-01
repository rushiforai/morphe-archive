#!/usr/bin/env python3
import glob, os, re, sys
root = sys.argv[1] if len(sys.argv) > 1 else "smali"
dirs = glob.glob(root + "/smali*")

# every class defined in the apk
defined = set()
for d in dirs:
    for dp, _, fns in os.walk(d):
        for fn in fns:
            if fn.endswith(".smali"):
                rel = os.path.relpath(os.path.join(dp, fn), d)[:-6]
                defined.add("L" + rel.replace(os.sep, "/") + ";")

ext = []
for d in dirs:
    ext += glob.glob(d + "/dev/chuk/extension/**/*.smali", recursive=True)
print("extension classes:", len(ext))

ref_re = re.compile(r'(L[A-Za-z0-9_$/\-]+;)')
SYSTEM = ("Ljava/", "Ljavax/", "Landroid/", "Ldalvik/", "Lsun/", "Llibcore/", "Lorg/w3c/", "Lorg/xml/", "Lorg/json/", "Lorg/apache/http/")
missing = {}
for f in ext:
    for line in open(f):
        s = line.strip()
        if not (s.startswith("invoke") or s.startswith("new-instance") or s.startswith("sget") or
                s.startswith("iget") or s.startswith("const-class") or s.startswith("check-cast") or
                s.startswith("instance-of") or s.startswith(".implements") or s.startswith(".super") or
                s.startswith("filled-new-array") or s.startswith("new-array")):
            continue
        for cls in ref_re.findall(s):
            if cls.startswith(SYSTEM) or cls in defined:
                continue
            missing.setdefault(cls, set()).add(os.path.basename(f))

if not missing:
    print("OK - every referenced class exists in the patched apk")
for cls, files in sorted(missing.items()):
    print("  MISSING", cls, "<-", ", ".join(sorted(files)))
