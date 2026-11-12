#!/usr/bin/env python3
"""apply_x_rung_patches.py — apply v1.3.1-R3 smali edits (02f, 02h) to a
decoded smali tree of the W2 rebuilt classes3.dex.

Usage:
  apply_x_rung_patches.py <smali-tree> 02f [02h]

Edits (see docs/v1.3.1-R3/patches/):
  02f  m9k.<init>: insert `const/4 p5, 0x1` before the
       `invoke-static {p5}, Boolean.valueOf` that seeds the `jze` waiter
       state -> the waiter starts TRUE (fresh-install parity with
       steady-state launches).
  02h  q0o.f(): replace `if-eq v0, v1, :cond_2e` with `goto/16 :cond_2e`
       so the `pushed.sequence != 2` posting of the hch splash
       (q0n(15), delayed_launch_fragment) is dead code.

Every edit is anchored on a unique multi-line pattern (whitespace-flexible)
and asserts exactly one match; the script fails loudly instead of producing
a bad tree.
"""
import re
import sys


def edit(path, pattern, repl, flags=0):
    src = open(path).read()
    matches = list(re.finditer(pattern, src, flags))
    if len(matches) != 1:
        sys.exit(f'{path}: anchor matched {len(matches)}x (want 1): {pattern!r}')
    out = re.sub(pattern, repl, src, count=1, flags=flags)
    open(path, 'w').write(out)
    print(f'  patched {path} (anchor at offset {matches[0].start()})')
    return matches[0].start()


def apply_02f(tree):
    m9k = f'{tree}/m9k.smali'
    # the jze seed: :cond_35 label directly above the p5 valueOf call
    pat = r'(    :cond_35\n)(    invoke-static \{p5\}, Ljava/lang/Boolean;->valueOf\(Z\)Ljava/lang/Boolean;)'
    pos = edit(m9k, pat,
               r'\1    const/4 p5, 0x1\n\n\2')
    # sanity: bac's construction (which consumes the m9c param p5) must be
    # BEFORE our overwrite of p5
    src = open(m9k).read()
    i_bac = src.find('Lbac;-><init>')
    if not (0 <= i_bac < pos):
        sys.exit('02f sanity failed: bac construction not before the patch site')
    # sanity: the waiter seed now reads const/4 p5,0x1 -> valueOf
    if not re.search(r'const/4 p5, 0x1\n\s*invoke-static \{p5\}, Ljava/lang/Boolean;->valueOf', src):
        sys.exit('02f sanity failed: seed not forced true')


def apply_02h(tree):
    q0o = f'{tree}/q0o.smali'
    # inside f(): the sequence==2 guard directly followed by the pyl null check
    pat = (r'(    const/4 v1, 0x2\n)'
           r'\s*'
           r'    if-eq v0, v1, :cond_2e\n'
           r'\s*'
           r'(    iget-object v0, p0, Lq0o;->f:Lpyl;)')
    edit(q0o, pat, r'\1\n    goto/16 :cond_2e\n\n\2')


def main():
    if len(sys.argv) < 3:
        sys.exit(__doc__)
    tree = sys.argv[1]
    patches = sys.argv[2:]
    for p in patches:
        print(f'applying {p} to {tree}')
        if p == '02f':
            apply_02f(tree)
        elif p == '02h':
            apply_02h(tree)
        else:
            sys.exit(f'unknown patch {p}')


if __name__ == '__main__':
    main()
