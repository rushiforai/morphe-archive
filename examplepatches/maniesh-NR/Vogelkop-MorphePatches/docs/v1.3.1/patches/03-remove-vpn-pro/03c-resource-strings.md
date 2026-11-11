# Patch 03c — Strings: blank user-visible VPN Pro text

## File

`res/values/strings.xml` (default-language string resources)

## Goal

Defense-in-depth. Layers 03a + 03b already suppress every code path that
would display a "VPN Pro" string. This layer blanks the 5 most
user-visible VPN Pro strings in the default-language `strings.xml` so that
even a straggler code path that does not consult `wdn.a()` cannot render
the words "VPN Pro" on screen.

The 5 strings are blanked to a single ASCII space (`" "`) rather than the
empty string, to avoid potential layout issues with TextViews whose
`minHeight`/`minWidth` derive from text measurement.

## Patches

Each patch is a single-line edit in `res/values/strings.xml`.

### 1. `vpn_pro_title` (line 5163)

Was the system tile/widget label. Now unused (post-03a); blanked anyway.

**Before:**
```xml
    <string name="vpn_pro_title">VPN Pro</string>
```

**After:**
```xml
    <string name="vpn_pro_title"> </string>
```

### 2. `omnibox_suggested_vpn_pro_title` (line 3067)

The omnibox suggestion chip text. Already suppressed upstream by 03b (the
suggestion is only offered when `wdn.a()` is true); blanked anyway.

**Before:**
```xml
    <string name="omnibox_suggested_vpn_pro_title">Opera VPN Pro</string>
```

**After:**
```xml
    <string name="omnibox_suggested_vpn_pro_title"> </string>
```

### 3. `switch_to_vpn_pro_button` (line 4620)

**Before:**
```xml
    <string name="switch_to_vpn_pro_button">Switch to VPN Pro</string>
```

**After:**
```xml
    <string name="switch_to_vpn_pro_button"> </string>
```

### 4. `switch_to_vpn_pro_banner_body` (line 4619)

**Before:**
```xml
    <string name="switch_to_vpn_pro_banner_body">Your VPN Pro subscription is still active. Switch to get full protection and all locations.</string>
```

**After:**
```xml
    <string name="switch_to_vpn_pro_banner_body"> </string>
```

### 5. `switch_to_vpn_pro_reminder_dialog_title` (line 4622)

**Before:**
```xml
    <string name="switch_to_vpn_pro_reminder_dialog_title">Switch to VPN Pro?</string>
```

**After:**
```xml
    <string name="switch_to_vpn_pro_reminder_dialog_title"> </string>
```

## Anchoring notes

* Each `<string name="…">` is uniquely named; the 5 names above are stable
  across Opera Beta builds.
* The remaining 104 `vpn_pro*` / `free_vpn_pro_*` string resources are
  NOT blanked here. They describe dialogs that are already gated upstream
  by `wdn.a() == false` (layer 03b), so they are unreachable. If a future
  build exposes a new surface, expand this patch list.

## Risk

* Blanking `vpn_pro_title` to `" "` is safe — its only consumers were the
  2 manifest `android:label` attributes removed by 03a. After 03a, no
  manifest attribute references `@string/vpn_pro_title`.
* The other 4 strings are referenced only from dialogs/sheets suppressed
  by 03b. Verified by grep: each string name has ≤4 callers, all inside
  VPN-Pro-gated code paths.
* Localized `values-<lang>/strings.xml` files are NOT patched in v1.3.1.
  The default (`values/`) values are the fallback for any locale Opera
  Beta ships without a translation; for fully-translated locales, the
  localized "VPN Pro" text would still appear IF a straggler code path
  bypassed `wdn.a()`. v1.3.2 can extend this patch to all `values-*`
  directories if needed.
