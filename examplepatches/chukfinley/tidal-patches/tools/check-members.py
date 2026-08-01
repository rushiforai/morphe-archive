#!/usr/bin/env python3
import glob, os, re, sys
root = sys.argv[1] if len(sys.argv) > 1 else "smali"
dirs = glob.glob(root + "/smali*")

def path_of(cls):
    p = cls[1:-1] + ".smali"
    for d in dirs:
        f = os.path.join(d, p)
        if os.path.exists(f): return f
    return None

# cache: class -> (methods set, fields set, supers list)
cache = {}
def info(cls):
    if cls in cache: return cache[cls]
    f = path_of(cls)
    methods, fields, supers = set(), set(), []
    if f:
        for line in open(f):
            line = line.strip()
            if line.startswith(".method"):
                m = re.search(r'([^\s]+)(\([^)]*\)[^\s]+)$', line)
                if m: methods.add(m.group(1) + m.group(2))
            elif line.startswith(".field"):
                m = re.search(r'([^\s]+):([^\s]+)$', line)
                if m: fields.add(m.group(1) + ":" + m.group(2))
            elif line.startswith(".super"):
                supers.append(line.split()[1])
            elif line.startswith(".implements"):
                supers.append(line.split()[1])
    cache[cls] = (methods, fields, supers)
    return cache[cls]

def has_member(cls, member, kind, depth=0):
    if depth > 8: return False
    methods, fields, supers = info(cls)
    if (member in methods) if kind == "m" else (member in fields): return True
    return any(has_member(s, member, kind, depth+1) for s in supers)

SYSTEM = ("Ljava/", "Ljavax/", "Landroid/", "Ldalvik/", "Lsun/", "Llibcore/", "Lorg/")
ext = []
for d in dirs:
    ext += glob.glob(d + "/dev/chuk/extension/**/*.smali", recursive=True)

inv = re.compile(r'invoke-\S+\s+\{[^}]*\},\s+(L[^;]+;)->([^(]+)(\([^)]*\)\S+)')
fld = re.compile(r'[si]?[gp]et[-a-z0-9]*\s+[^,]+,\s*(?:[^,]+,\s*)?(L[^;]+;)->([^:]+):(\S+)')
bad, checked = [], 0
for f in ext:
    for line in open(f):
        s = line.strip()
        m = inv.search(s)
        if m:
            cls, name, desc = m.groups()
            if cls.startswith(SYSTEM): continue
            checked += 1
            if not has_member(cls, name + desc, "m"):
                bad.append(("METHOD", cls, name + desc, os.path.basename(f)))
        m = fld.search(s)
        if m:
            cls, name, typ = m.groups()
            if cls.startswith(SYSTEM): continue
            checked += 1
            if not has_member(cls, name + ":" + typ, "f"):
                bad.append(("FIELD", cls, name + ":" + typ, os.path.basename(f)))

print(f"checked {checked} non-system member references")
if not bad: print("OK - all resolve (including inherited)")
for b in bad: print("  MISSING", *b)
