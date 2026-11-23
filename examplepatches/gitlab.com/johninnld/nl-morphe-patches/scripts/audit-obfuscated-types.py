#!/usr/bin/env python3
"""Fail if a Gboard extension or patch still names an 18.6.3 class.

Two layers are checked:
  * Java extensions: every Class.forName("x") literal.
  * Patch sources: every type descriptor inside injected smali text
    (check-cast / instance-of / new-instance / invoke-* / *get* / *put*).

A literal is reported as an ERROR only when it is *provably* stale: `Lx;` is a key
of the 18.6.3 -> 18.8 class map, the 18.6.3 class no longer exists in 18.8, and the
mapped class does. Obfuscated names are reused across versions (18.6.3 `aagb` is
also a valid 18.8 class), so a name that still exists is reported as WARN only:
only a member-level check can decide those, which is what the bindings' Validate
does for patch targets.

Usage: python3 scripts/audit-obfuscated-types.py
Exit code 1 (and a list) when anything stale is found.
"""
import pathlib, re, sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
MAP = ROOT / '.tools/artifacts/gboard-port-18.8.0-beta/classmap-18.6.3-to-18.8.0.txt'

SRC = pathlib.Path('/Users/jneerdael/Scripts/gboard/gboard-18.8-beta/sources/defpackage')
cmap = {}
for line in MAP.read_text().splitlines():
    p = line.split()
    if len(p) == 2 and p[0].startswith('L') and p[1].startswith('L'):
        cmap[p[0][1:-1]] = p[1][1:-1]

SMALI = re.compile(r'^\s*(check-cast|instance-of|new-instance|invoke-\w+|sget\w*|iget\w*|iput\w*|const-class|filled-new-array)', re.I)
DESC = re.compile(r'(?<![\w/$])L([A-Za-z0-9_]+);')

def java_findings():
    for base in ('extensions/gboard-patches/src', 'extensions/gboard/src'):
        for f in (ROOT / base).rglob('*.java'):
            t = f.read_text(errors='ignore')
            for m in re.finditer(r'Class\.forName\(\s*"([A-Za-z0-9_]+)"', t):
                n = m.group(1)
                if n in cmap and cmap[n] != n:
                    yield f, t[:m.start()].count('\n') + 1, n, cmap[n]

def patch_findings():
    for f in (ROOT / 'patches/src/main/kotlin/patches/gboard').rglob('*.kt'):
        for i, line in enumerate(f.read_text(errors='ignore').splitlines(), 1):
            if '${' in line or not SMALI.search(line):
                continue
            for m in DESC.finditer(line):
                n = m.group(1)
                if n in cmap and cmap[n] != n:
                    yield f, i, n, cmap[n]

# Accepted debt: provably stale literals that are still in the tree. They cannot
# regress silently because any *new* stale literal fails the check below. Each
# entry needs a member-level port (the 18.8 class exists but its fields/methods
# must be resolved), which is why the classmap alone is not enough here.
KNOWN_STALE = set()

def severity(n, new):
    if not (SRC / (n + '.java')).exists() and (SRC / (new + '.java')).exists():
        return 'ERROR'
    return 'WARN'

rows = list(java_findings()) + list(patch_findings())
errors = 0
for f, line, n, new in rows:
    rel = str(f.relative_to(ROOT))
    known = any(rel.endswith(rel_path) and n == name for rel_path, name in KNOWN_STALE)
    level = severity(n, new)
    if level == 'ERROR' and not known:
        errors += 1
    elif level == 'ERROR':
        level = 'KNOWN'
    print(f"{level} {rel}:{line}: L{n}; -> L{new};")
print(f"\nprovably stale: {errors}   ambiguous (name reused, needs member check): {len(rows) - errors}")
sys.exit(1 if errors else 0)
