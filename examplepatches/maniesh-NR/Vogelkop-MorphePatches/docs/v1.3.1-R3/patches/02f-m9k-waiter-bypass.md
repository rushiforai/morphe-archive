# 02f — m9k fresh-install waiter bypass

Goal: `m9k.e` (the `jze` "startup dependencies done" state) must initialize
TRUE so the onboarding flow driver (`cek` case 10 via `tzn` case 2) takes the
END path (`k0o.d` → `L()` → browser) instead of parking on the `g49`
"Almost there!" screen waiting for remote config + Leanplum/Braze.

Target: `m9k.<init>(Landroid/app/Activity;Lumi;Lcom/opera/android/Lazy;
Lcom/opera/android/settings/SettingsManager;Lm9c;)V`

Original tail (label names differ after apktool renumbering; the anchor is
the `has_waited_for_startup_dependencies` read feeding `Boolean.valueOf`):

```smali
    new-instance p2, Ljze;

    const-string p3, "has_waited_for_startup_dependencies"

    invoke-virtual {p4, p3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p3

    if-nez p3, :cond_34

    invoke-virtual {p4}, Lcom/opera/android/settings/SettingsManager;->J()Z

    move-result p3

    if-nez p3, :cond_35

    :cond_34
    move p5, v0

    :cond_35
    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
```

Patched — insert `const/4 p5, 0x1` immediately before the `valueOf` call
(the branch code above becomes dead code; all labels stay resolvable):

```smali
    :cond_35
    const/4 p5, 0x1

    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
```

Semantics: the initial value is `true` unconditionally — exactly the value
every steady-state launch computes (`version_code != 0` → `J()` false →
`!J()` true). The waiter never arms; `m9k.S()` still (no-op-)starts the
`j9k`/`bac` dependencies; `m9k.R()` early-returns because `e.g()` is
already true.

Safety notes:

- `tzn` case 2 is the only `Boolean`-returning tzn case (verified: case 0
  returns `Lr7n;`, cases 1/3 return `Unit`, the default returns `Lpde;`),
  so `q0o.d` (the cek end-check) is confirmed to read `m9k.e.g()`.
- `g49` reads the same state; with 02f it is never posted.
- `t77` case 11 writes `has_waited_for_startup_dependencies` when `e` fires
  true — benign either way.
