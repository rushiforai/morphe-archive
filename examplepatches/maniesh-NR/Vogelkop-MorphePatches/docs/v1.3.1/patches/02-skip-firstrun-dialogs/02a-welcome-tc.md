# Patch 02a — WelcomeActivity T&C bypass

## File

`smali_classes3/com/opera/android/startup/WelcomeActivity.smali`

## Goal

The purple Terms & Conditions "Next" screen is shown when
`SettingsManager.i("eula_accepted.gdpr")` returns `false`. There are **two**
call sites in `WelcomeActivity` that branch on this:

| Site | Inside method | Original behavior |
| --- | --- | --- |
| 1 | `onCreate(Landroid/os/Bundle;)V` (around file line 1792) | `if-eqz v4, :cond_7` — if NOT accepted, jump away |
| 2 | `onStart()V` (around file line 2363) | `if-nez v0, :cond_1` — if accepted, jump away |

Both must be forced to "accepted".

## Patch — Site 1 (`onCreate`, around line 1799)

### Original

```smali
    invoke-virtual {v4, v6}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7
```

### Patched

```smali
    invoke-virtual {v4, v6}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v4

    const/4 v4, 0x1

    if-eqz v4, :cond_7
```

Insert `const/4 v4, 0x1` between `move-result` and `if-eqz`. With `v4 = 1`,
`if-eqz v4` is always false → falls through to the "already accepted" branch.

## Patch — Site 2 (`onStart`, around line 2370)

### Original

```smali
    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1
```

### Patched

```smali
    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    const/4 v0, 0x1

    if-nez v0, :cond_1
```

Same shape: insert `const/4 v0, 0x1`. With `v0 = 1`, `if-nez v0` is always true
→ jumps to `:cond_1` (the "already accepted" branch).

## Anchoring notes

* Both call sites use `Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z`
  immediately followed by `move-result` and a conditional branch.
* The constants `v4` / `v0` are the local registers chosen by the original
  compiler; do not rename.
* Both patches are pure 1-instruction insertions; no branch offsets need
  manual fix-up (smali assembler recomputes offsets).

## Risk

* The pref `eula_accepted.gdpr` is never written, so any *other* code path
  that reads it directly (bypassing `SettingsManager.i()`) would still see
  `false`. A grep across all dex shows 9 classes reference the string
  `eula_accepted.gdpr`; the only first-run gate is the two sites above.
  Other references are writes (post-acceptance) or read-via-SettingsManager
  helpers that are not on the welcome-flow critical path. Safe.

## Binary-implementation addendum (2026-11-11, E-rung — supersedes the site list above)

Androguard ground truth on the shipped dex shows the smali recon above
**under-counted**: `WelcomeActivity` has **FOUR**
`SettingsManager.i("eula_accepted.gdpr")` sites, not two:

| # | Method | Reg / branch | Role |
| --- | --- | --- | --- |
| 1 | `onCreate` #1 | `v4` / `if-eqz` | gates `m9k.S()` pre-onboarding hook (Site 1 above ✓) |
| 2 | `onCreate` #2 | `v1` / `if-eqz` | **the actual fresh-launch gate**: chooses `q0o.f()` (proceed) vs adding the onboarding/T&C fragment. Missed by the smali recon; NOT patched in D1 — D1 would still have shown the T&C onboarding on a fresh install |
| 3 | `onStop` | `v0` / `if-nez` | re-lock guard (mislabeled "onStart" as Site 2 above; the `apply_v131_patches.py` text-replace did land in this method) |
| 4 | `startActivityForResult` | `v0` / `if-nez` | lock-in wrapper (`rm5.z` + `nqi` callback). Now patched too: since the patch never writes `eula_accepted.gdpr`, the wrapper would otherwise stay **permanently** engaged |

The binary patcher (`scripts/v131_binary_patch.py`) replaces
`invoke (3 units) + move-result (1 unit)` — 8 bytes — with
`const/4 vN, 0x1 + 3 × nop` at all four sites: length-preserving, no branch
offset fixups, the getter call is skipped (it is a pure SharedPreferences
read). Post-patch disassembly is asserted by `scripts/validate_build.py`.
