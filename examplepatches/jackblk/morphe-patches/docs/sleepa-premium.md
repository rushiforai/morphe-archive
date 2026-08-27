# Sleepa — premium unlock investigation

## Target

* **App:** Sleepa (Relaxing sounds), by relaxio / Maple Media
* **Package:** `net.relaxio.sleepo`
* **Version investigated:** versionName `4.3.0(135)` (the build number is part of the
  name), versionCode 135. `Constants` must declare `version = "4.3.0(135)"` exactly —
  declaring `"4.3.0"` makes Morphe skip the patch as incompatible.
* **Distribution:** `.xapk` (split APKs). Premium logic is in the **base** APK
  (`net.relaxio.sleepo.apk`) only, not the `config.*` splits.
* **Billing:** Google Play Billing (`com.android.vending.BILLING`). Premium is a
  one-time / subscription "pro" purchase, not a multi-tier system.
* Decompiled to `tmp/net.relaxio.sleepo-4.3.0/` with `jadx --no-res`.

## The premium gate (single source of truth)

`si.h0.n()` — `public static boolean n()`:

```java
public static boolean n() {
    return ((Boolean) r(f80022f)).booleanValue() || h();
}
```

* `f80022f` is the preference key `"IS_PRO_VERSION_PURCHASED"` (Boolean, default false),
  set to TRUE when a purchase is confirmed in
  `SinglePurchaseBillingActivity.J(Set, boolean)`.
* `h()` is a secondary path: `KEY_HAS_PLAY_PASS` OR `m()` (Play Pass / grace).
* `SinglePurchaseBillingActivity.S()` simply returns `h0.n()`.

`h0.n()` is checked at **17 sites** across the app, all gating premium behaviour:

* `App.java` — skip interstitial ads when premium.
* `v2/MainActivity.java`, `MainActivity.java` — nav gating, skip "subscribe" deep links.
* `v2/settings/SettingsFragment.java` — show "Manage subscription" vs "Upgrade".
* `v2/alarm/AlarmFragment.java` — premium alarm features.
* `ui/HeaderView.java`, `v2/ui/HeaderToolbar.java` — hide the "go premium" icon.

Forcing `n()` to return `true` therefore unlocks premium content AND removes ads
globally. No other gate needs patching for a first working version.

`qi.l` (methods `j/k/l/m/n/o/p`) was ruled out — it is the Maple Media "Trumpet"
cross-promo carousel, not the premium gate.

## Patch plan

Fingerprint `si.h0.n()` and force `return true`:

* **Fingerprint:** `definingClass = "Lsi/h0;"`, `name = "n"`, `returnType = "Z"`,
  `parameters = emptyList()`, static.
* **Patch body:**

  ```kotlin
  Hn0Fingerprint.method.apply {
      removeInstructions(0, instructions.count())
      addInstructions(0, "const/4 v0, 0x1\nreturn v0")
  }
  ```

### Known fragility (ponytail: named ceiling)

`si.h0` / `n` are obfuscated names that will change in future app versions. This
fingerprint is pinned to 4.3.0 (135) via `Constants`. If a future version breaks the
match, re-anchor using the stable string `"IS_PRO_VERSION_PURCHASED"` to relocate the
class, then find its no-arg static `Z` getter.

## Status

* [x] Target identified, decompiled, gate located.
* [x] Compatibility declared: `Constants.SLEEPA_COMPATIBILITY` (`net.relaxio.sleepo`, 4.3.0, `ApkFileType.XAPK`).
* [x] Package `app.template.patches.example` removed; new `app.jackblk.patches.sleepa`
      with `IsPremiumFingerprint` + `sleepaPremiumPatch` ("Unlock Premium"), and
      `app.jackblk.patches.shared.Constants`.
* [x] Built (`./gradlew buildAndroid` → `patches/build/libs/patches-1.0.0.mpp`).
* [x] Applied and installed with Morphe Desktop `patch -i`. Log confirms
      "Applied: Unlock Premium" (fingerprint `si.h0.n()` matched), no skip warning.
* [x] Verified on device (fresh install): premium unlocked, ads gone, works well.

One-time first-launch crash was seen only when the patched build was installed over the
original app's leftover data/cache; a clean install (uninstall first) starts fine.

## Install notes (learned)

* Match the device ABI. The device is `arm64-v8a` only; the first XAPK shipped only
  `armeabi-v7a` libs → `INSTALL_FAILED_NO_MATCHING_ABIS`. Use the `arm64-v8a` (or
  universal) build. The base `classes.dex` is arch-independent, so the fingerprint
  matches regardless of which arch variant is patched.
* The patched APK is signed with Morphe's key, so a Play-store copy already installed
  must be uninstalled first (`INSTALL_FAILED_UPDATE_INCOMPATIBLE`), which clears app data.
* `patch` CLI: the target APK is a positional argument and must come before a bare `-i`
  (which takes an optional device serial), otherwise `-i` swallows the APK path.
