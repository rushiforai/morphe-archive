# Patch 02c — "Set as default browser" prompt bypass

## File

`smali_classes3/mm6.smali`

## Goal

The default-browser prompt is gated inside `mm6.e(ZLeej;Lqim;)V` on the pref
`show_enable_default_browser_dialog_on_startpage`. The method reads the pref
into register `v13` and then does `if-eqz v13, :cond_5` — if the pref is
false, skip the dialog branch. We force `v13 = 0` so the dialog branch is
never entered.

## Patch — Site (inside `mm6.e`, around file line 451)

### Original

```smali
    const-string v12, "show_enable_default_browser_dialog_on_startpage"

    invoke-interface {v9, v12, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    if-eqz v13, :cond_5
```

### Patched

```smali
    const-string v12, "show_enable_default_browser_dialog_on_startpage"

    invoke-interface {v9, v12, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    const/4 v13, 0x0

    if-eqz v13, :cond_5
```

Insert `const/4 v13, 0x0` between `move-result v13` and `if-eqz v13`. With
`v13 = 0`, `if-eqz v13` is always true → always jumps to `:cond_5` → the
default-browser dialog branch is skipped.

## Anchoring notes

* The constant string `"show_enable_default_browser_dialog_on_startpage"`
  is unique in this dex; only one call site.
* Register `v13` is the local chosen by the original compiler for the
  boolean result. The `const/4 v13, 0x0` is a 1-byte instruction that
  overwrites the result of `getBoolean`. No register renumbering needed.
* The pref read still happens (harmless); we just discard its result.

## Risk

* This is defense-in-depth. The T&C-welcome-flow bypass (patch 02a) already
  prevents the user from reaching the leaf page that writes
  `show_enable_default_browser_dialog_on_startpage = true`, so on a clean
  install the pref would normally stay at its default (false) anyway.
  Patch 02c covers the case where a user exits the welcome flow early or
  the pref is migrated from a previous install.
* No other code path is affected — only the dialog-branch entry is gated.
