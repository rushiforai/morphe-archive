#!/usr/bin/env python3
"""Derive PairIP reflective-trampoline Method bindings from the dex (smali) alone.

PairIP method-extraction keeps the real body under a *renamed* method (e.g. `y(Bundle)V`)
and replaces the original with a reflective trampoline:

    sget-object vX, L<holder>;-><field>:Ljava/lang/reflect/Method;
    invoke-virtual {vX, null, [receiver, args...]}, Method;->invoke(...)

plus a **static synthetic bridge** in the same class:

    .method public static synthetic y$011(L<C>;Landroid/os/Bundle;)V
        invoke-virtual/range {p0 .. p1}, L<C>;->y(Landroid/os/Bundle;)V
        return-void

So the Method the field must hold is exactly that bridge — a static method in the trampoline's
class whose parameters are (receiver, <trampoline params>) and whose return type equals the
trampoline's. We find it by signature and emit a `<clinit>` snippet that resolves it with
`Class.getDeclaredMethod`, so the app never needs the PairIP VM.

Usage: gd_methods.py <smali-root> <holders.txt> <methods.json>
"""
import glob
import json
import re
import sys

CLASS_RE = re.compile(r'^\.class .*?(L\S+;)\s*$', re.M)
DEF_RE = re.compile(r'^\.method(?P<head>[^\n]*?) (?P<name>[A-Za-z0-9_$<>]+)'
                    r'\((?P<params>[^)]*)\)(?P<ret>\S+)\s*$', re.M)
FIELD_USE_RE = re.compile(
    r'sget-object\s+v\d+,\s*(L[^;]+;)->([A-Za-z0-9_$]+):Ljava/lang/reflect/Method;')
INVOKE_METHOD_RE = re.compile(r'Ljava/lang/reflect/Method;->invoke\(')
BODY_RE = re.compile(r'^\.method[^\n]*\n(.*?)^\.end method', re.M | re.S)


def params_of(sig):
    """Split a smali parameter descriptor string into individual type descriptors."""
    out, i = [], 0
    while i < len(sig):
        c = sig[i]
        if c == 'L':
            j = sig.index(';', i)
            out.append(sig[i:j + 1])
            i = j + 1
        elif c == '[':
            j = i
            while sig[j] == '[':
                j += 1
            if sig[j] == 'L':
                k = sig.index(';', j)
                out.append(sig[i:k + 1])
                i = k + 1
            else:
                out.append(sig[i:j + 1])
                i = j + 1
        else:
            out.append(c)
            i += 1
    return out


def main(smali_root, holders_path, out_json):
    holders = {l.strip() for l in open(holders_path) if l.strip()}

    classes = {}          # klass -> list[(name, params, ret, is_static)]
    trampolines = []      # (klass, name, params, ret, holder, field)

    for f in glob.glob(smali_root + '/**/*.smali', recursive=True):
        txt = open(f, encoding='utf-8', errors='ignore').read()
        m = CLASS_RE.search(txt)
        if not m:
            continue
        klass = m.group(1)
        defs = []
        for d in DEF_RE.finditer(txt):
            defs.append((d.group('name'), d.group('params'), d.group('ret'),
                         ' static ' in d.group('head')))
        classes[klass] = defs

        # trampoline = small body that reads a Method field and invokes it
        for bm in BODY_RE.finditer(txt):
            body = bm.group(1)
            if not INVOKE_METHOD_RE.search(body):
                continue
            fm = FIELD_USE_RE.search(body)
            if not fm:
                continue
            insns = [l.strip() for l in body.splitlines()
                     if l.strip() and not l.strip().startswith('.') and not l.strip().endswith(':')]
            if len(insns) > 14:
                continue
            # the trampoline's own definition: match the def whose body this is
            head = txt[bm.start():bm.start() + 200].splitlines()[0]
            dm = DEF_RE.match(head)
            if not dm:
                continue
            if fm.group(1) in holders:
                trampolines.append((klass, dm.group('name'), dm.group('params'),
                                    dm.group('ret'), fm.group(1), fm.group(2)))

    # Second pass: for each class hosting a trampoline, read method bodies to (a) see which
    # method each candidate bridge dispatches to, and (b) see which renamed body calls
    # `invoke-super -> <originalName>` (that pins the bridge semantically).
    host_classes = {t[0] for t in trampolines}
    dispatch = {}     # (klass, bridgeName) -> called method name within klass
    super_of = {}     # (klass, bodyName) -> original name it invokes super for
    for f in glob.glob(smali_root + '/**/*.smali', recursive=True):
        txt = open(f, encoding='utf-8', errors='ignore').read()
        m = CLASS_RE.search(txt)
        if not m or m.group(1) not in host_classes:
            continue
        klass = m.group(1)
        esc = re.escape(klass)
        for bm in re.finditer(r'^\.method[^\n]*? ([A-Za-z0-9_$<>]+)\([^)]*\)\S+\n(.*?)^\.end method',
                              txt, re.M | re.S):
            name, body = bm.group(1), bm.group(2)
            if name in dispatch:
                continue
            self_calls = re.findall(esc + r'->([A-Za-z0-9_$<>]+)\(', body)
            if name not in ('<init>',):
                dispatch[(klass, name)] = self_calls
            sm = re.search(r'invoke-super[^\n]*' + esc.replace('L', r'L') +
                           r'?->([A-Za-z0-9_$<>]+)\(', body)
            if sm:
                super_of[(klass, name)] = sm.group(1)
            else:
                # invoke-super targets the superclass, not klass; capture the target name
                sm2 = re.search(r'invoke-super[^\n]*->([A-Za-z0-9_$<>]+)\(', body)
                if sm2:
                    super_of[(klass, name)] = sm2.group(1)

    snippets, unresolved = {}, []
    for klass, mname, tparams, tret, holder, field in trampolines:
        p = params_of(tparams)
        cands = []
        for n, ps, ret, st in classes.get(klass, []):
            if not st or ret != tret or not re.fullmatch(r'.+\$\d+', n):
                continue
            cp = params_of(ps)
            if len(cp) == len(p) + 1 and cp[1:] == p and cp[0].startswith('L'):
                cands.append((n, cp))
        # (a) semantic: the bridge dispatches to a body that calls super.<mname>
        sem = []
        for n, cp in cands:
            for d in dispatch.get((klass, n), []):
                if super_of.get((klass, d)) == mname:
                    sem.append((n, cp))
        if len(sem) == 1:
            cands = sem
        else:
            # (b) name prefix: PairIP keeps the original name for the extracted-body bridge
            pref = [c for c in cands if c[0].rsplit('$', 1)[0] == mname]
            if len(pref) == 1:
                cands = pref
            elif len(sem) > 1:
                cands = sem
        if len(cands) != 1:
            unresolved.append((klass, mname, holder, field, [c[0] for c in cands]))
            continue
        bridge, full = cands[0]
        lines = [
            f'const-class v0, {klass}',
            f'const-string v1, "{bridge}"',
            f'const/16 v2, 0x{len(full):x}',
            'new-array v2, v2, [Ljava/lang/Class;',
        ]
        for i, pt in enumerate(full):
            lines.append(f'const/16 v3, 0x{i:x}')
            lines.append(f'const-class v4, {pt}')
            lines.append('aput-object v4, v2, v3')
        lines.append('invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod('
                     'Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;')
        lines.append('move-result-object v0')
        lines.append(f'sput-object v0, {holder}->{field}:Ljava/lang/reflect/Method;')
        snippets.setdefault(holder, []).append(lines)

    json.dump(snippets, open(out_json, 'w'), indent=1)
    n = sum(len(v) for v in snippets.values())
    print(f"trampolines {len(trampolines)} | bindings {n} | holders {len(snippets)}")
    for u in unresolved:
        print("  UNRESOLVED:", u)


if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2], sys.argv[3])
