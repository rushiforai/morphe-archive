#!/usr/bin/env python3
"""apply_v4_patches.py — v4 smali edits on the fresh apktool-3.0.3 decode of
stock classes3.dex (the device-proven hybrid pipeline; resources never touched).

Patches (v2 intent, byte-safe re-implementation):
  P1  OperaApplication.a()Z: early-return true — the onboarding master gate.
      Both callers (IntentDispatcherActivity/BrowserActivity onCreate) go
      straight to normal browser startup; WelcomeActivity never launches.
  P2  cfn :pswitch_11 (personalization.onboarding.completed observable):
      `xor-int/2addr v0, v5` -> `const/4 v0, 0x0` — the in-browser
      "Set up your browser" sheet is never due.
  P3  ssi :pswitch_17 (splash spinner reveal runnable): drop the
      findViewById(splash_spinner).setVisibility(VISIBLE) body, keep
      check-cast + return-void. Purely visual.
  02f m9k.<init> (startup-dependency waiter seed): insert
      `const/4 p5, 0x1` before the Boolean.valueOf seed — the waiter never
      arms; first run behaves like every later launch (X-rung freeze fix).

Every edit anchors on a unique multi-line pattern (whitespace-flexible),
asserts exactly one match, and fails loudly otherwise.
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


def apply_p1(tree):
    f = f'{tree}/com/opera/android/OperaApplication.smali'
    pat = (r'(\.method public final a\(\)Z\n'
           r'    \.locals 5\n)'
           r'\n'
           r'(    invoke-virtual \{p0\}, Lcom/opera/android/OperaApplication;->J\(\)Lcom/opera/android/settings/SettingsManager;)')
    edit(f, pat, r'\1\n    const/4 v0, 0x1\n\n    return v0\n\n\2')


def apply_p2(tree):
    f = f'{tree}/cfn.smali'
    pat = (r'(const-string v1, "personalization\.onboarding\.completed"\n'
           r'\s*'
           r'invoke-interface \{v0, v1, v4\}, Landroid/content/SharedPreferences;->getBoolean\(Ljava/lang/String;Z\)Z\n'
           r'\s*'
           r'move-result v0\n'
           r'\s*)'
           r'xor-int/2addr v0, v5\n')
    edit(f, pat, r'\1const/4 v0, 0x0\n')


def apply_p3(tree):
    f = f'{tree}/ssi.smali'
    pat = (r'(    :pswitch_17\n'
           r'    iget-object p0, p0, Lssi;->b:Ljava/lang/Object;\n'
           r'\s*'
           r'    check-cast p0, Lcom/opera/android/custom_views/SplashView;\n)'
           r'\s*'
           r'const v0, 0x7f0a0ab3\n'
           r'\s*'
           r'invoke-virtual \{p0, v0\}, Landroid/view/View;->findViewById\(I\)Landroid/view/View;\n'
           r'\s*'
           r'move-result-object p0\n'
           r'\s*'
           r'invoke-virtual \{p0, v8\}, Landroid/view/View;->setVisibility\(I\)V\n')
    edit(f, pat, r'\1\n    return-void\n')
    # the pswitch_17 body must now go check-cast -> return-void with no setVisibility
    src = open(f).read()
    seg = re.search(r':pswitch_17\n.*?(?=\n    :pswitch_1[68]\n|\n    :pswitch_16\n)', src, re.S)
    if not seg or 'setVisibility' in seg.group(0):
        sys.exit('P3 sanity failed: spinner reveal still present in :pswitch_17')
    if 'check-cast p0, Lcom/opera/android/custom_views/SplashView;' not in seg.group(0):
        sys.exit('P3 sanity failed: check-cast lost')


def apply_02f(tree):
    f = f'{tree}/m9k.smali'
    pat = (r'(    :cond_1\n)'
           r'(    invoke-static \{p5\}, Ljava/lang/Boolean;->valueOf\(Z\)Ljava/lang/Boolean;)')
    pos = edit(f, pat, r'\1    const/4 p5, 0x1\n\n\2')
    src = open(f).read()
    i_bac = src.find('Lbac;-><init>')
    if not (0 <= i_bac < pos):
        sys.exit('02f sanity failed: bac construction not before the patch site')
    if not re.search(r'const/4 p5, 0x1\n\s*invoke-static \{p5\}, Ljava/lang/Boolean;->valueOf', src):
        sys.exit('02f sanity failed: seed not forced true')


def main():
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    tree = sys.argv[1] + '/smali' if not sys.argv[1].endswith('/smali') else sys.argv[1]
    print(f'applying v4 patches to {tree}')
    apply_p1(tree)
    apply_p2(tree)
    apply_p3(tree)
    apply_02f(tree)
    print('all v4 patches applied')


if __name__ == '__main__':
    main()
