#!/usr/bin/env python3
"""Stub all native <clinit>()V methods in classes.dex (smali).

MT Manager's Application <clinit> triggers dozens of native class
initializers (l.* classes). On a re-signed APK these natives are never
registered -> UnsatisfiedLinkError. This patch replaces each
`native constructor <clinit>()V` with a non-native `return-void`, so class
init succeeds and the app gets past the crash.

Safe because Java static fields default to 0/null/false, and the native
clinits mostly set fields used later by other native calls (which we'll
handle separately or which gracefully degrade).
"""
import os, re, sys

SMALI_DIR = sys.argv[1] if len(sys.argv) > 1 else 'smali'
PATCHED = []

def patch_file(path):
    with open(path, 'r', encoding='utf-8', errors='replace') as f:
        content = f.read()
    # Pattern: .method static native constructor <clinit>()V\n.end method
    # Replace with a non-native body that returns void.
    pattern = re.compile(
        r'(\.method\s+(?:public\s+)?static\s+)native\s+(constructor\s+<clinit>\(\)V\r?\n)'
        r'(?:\.end method)',
        re.MULTILINE
    )
    def repl(m):
        return m.group(1) + m.group(2) + '    .locals 0\n\n    return-void\n.end method'
    new_content, n = pattern.subn(repl, content)
    if n:
        with open(path, 'w', encoding='utf-8') as f:
            f.write(new_content)
        PATCHED.append((path, n))
    return n

total = 0
count = 0
for root, dirs, files in os.walk(SMALI_DIR):
    for fn in files:
        if fn.endswith('.smali'):
            path = os.path.join(root, fn)
            with open(path, 'r', encoding='utf-8', errors='replace') as f:
                if 'native constructor <clinit>' in f.read():
                    n = patch_file(path)
                    total += n
                    count += 1
print('Patched %d files, %d native <clinit> methods' % (count, total))
for p, n in PATCHED[:5]:
    print('  %s: %d' % (p, n))
