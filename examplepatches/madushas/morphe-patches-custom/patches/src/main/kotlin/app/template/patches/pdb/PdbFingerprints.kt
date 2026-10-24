package app.template.patches.pdb

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

// ════════════════════════════════════════════════════════════════════════════════
// Pdb (pdb.app) 2.134.6 — fingerprint anchors
//
// Pdb's own code is R8-obfuscated on every release (class names such as `zdf`,
// `l5b` change between versions). Every fingerprint below therefore anchors on
// either:
//   • a stable *string literal* that survives obfuscation, or
//   • a *kept* (non-obfuscated) class name in the `pdb.app.*` package.
//
// Verified against pdb.app 2.134.6 (versionCode 2694), 6 dex.
// ════════════════════════════════════════════════════════════════════════════════

/**
 * `isProUser()` — the single client-side premium gate.
 *
 * Implemented as an obfuscated method (`zdf.V()Z`) that returns `Z` and is
 * uniquely identified by the app's built-in developer backdoor preference name
 * `mockIsProUser` (read via `SharedPreferences.getBoolean`).
 *
 * All 17 premium call sites (ads, chat, stories, coins, IRL, profile, …) funnel
 * through this method.
 */
val IsProUserFingerprint = Fingerprint(
    returnType = "Z",
    filters = listOf(string("mockIsProUser")),
)

/**
 * `ProStatus` model (obfuscated `l5b`, serialized `@dzc("isPro" / "isProInTrial")`).
 *
 * Anchored on its generated `toString()` literal `ProStatus(isPro=`. Used to force
 * the server-derived entitlement model to "pro" for code paths that read it
 * directly instead of going through [IsProUserFingerprint].
 */
val ProStatusFingerprint = Fingerprint(
    filters = listOf(string("ProStatus(isPro=")),
)

/**
 * The real Application class (`pdb.app.App`) — a *kept* class name.
 *
 * `attachBaseContext(Context)` is the earliest hookable point. It has two
 * parameter registers (`p0` = this, `p1` = context) and `.locals 0`, so the
 * inline-smali compiler's `.registers 2` frame makes `p1` valid (unlike
 * `onCreate()V`, whose `.locals 16` frame pushes `p0` to the invalid `v16`).
 */
val AppAttachBaseContextFingerprint = Fingerprint(
    definingClass = "Lpdb/app/App;",
    name = "attachBaseContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * The built-in Tweaks screen's preference fragment (`pdb.app.tweak.TweaksActivity$a`)
 * — a *kept* class. `onSharedPreferenceChanged` is a handy execution hook fired by
 * the app's own preference UI.
 */
val TweaksPrefChangedFingerprint = Fingerprint(
    definingClass = "Lpdb/app/tweak/TweaksActivity\$a;",
    name = "onSharedPreferenceChanged",
    returnType = "V",
    parameters = listOf("Landroid/content/SharedPreferences;", "Ljava/lang/String;"),
)

/**
 * The Settings screen fragment (obfuscated class, e.g. `e60`) that hosts
 * `pdb.app.user.appsetting.AppSettingActivity`'s content.
 *
 * Anchored on the ViewBinding debug literal
 * `getBinding()Lpdb/app/user/databinding/FragmentAppSettingBinding;`, which is stable
 * across obfuscation and releases. The fragment's `onViewCreated(View, Bundle)` is
 * then matched by signature — the entry-row hook ([SettingsEntryHook]) is injected
 * there, so the obfuscated method name is irrelevant.
 */
val SettingsFragmentFingerprint = Fingerprint(
    filters = listOf(string("getBinding()Lpdb/app/user/databinding/FragmentAppSettingBinding;")),
)
