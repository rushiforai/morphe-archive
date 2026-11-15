package app.memorizepi.patches.pi.ads

import app.morphe.patcher.Fingerprint

/**
 * Banner ad entry points in "Memorize Pi Digits" 11.01.
 *
 * The Unity/IL2CPP side does not necessarily call the banner through
 * `DeviceManager`. The managed wrapper (`AndroidAdControl`) also references
 * `com.homelib.android.ad.AdManager` directly (the class name is present in
 * `global-metadata.dat`), so the banner can be requested through any of
 * these three levels:
 *
 * ```java
 * // 1) com.homelib.android.device.DeviceManager
 * public void ShowBannerAd(final int i2) { ... adManager.ShowBannerAd(i2); }
 *
 * // 2) com.homelib.android.ad.AdManager
 * public void ShowBannerAd(int i2) { if (hasBanner) this.admob.showBannerAd(); }
 *
 * // 3) com.homelib.android.ad.AdmobAdapter
 * public void showBannerAd() { ... create(...); ... }
 * ```
 *
 * All three are patched so no code path can create the banner `View`.
 * The class and method names of the plugin glue are not obfuscated, and
 * parameter/return types are verified in addition to the names.
 */
object HomeBannerAdFingerprint : Fingerprint(
    definingClass = "Lcom/homelib/android/device/DeviceManager;",
    name = "ShowBannerAd",
    returnType = "V",
    parameters = listOf("I"),
)

object AdManagerShowBannerAdFingerprint : Fingerprint(
    definingClass = "Lcom/homelib/android/ad/AdManager;",
    name = "ShowBannerAd",
    returnType = "V",
    parameters = listOf("I"),
)

object AdmobShowBannerAdFingerprint : Fingerprint(
    definingClass = "Lcom/homelib/android/ad/AdmobAdapter;",
    name = "showBannerAd",
    returnType = "V",
    parameters = emptyList(),
)

/**
 * Makes the (already created) banner view visible. `createAdView()` adds the
 * view with `setVisibility(GONE)` and only `show()` switches it to `VISIBLE`
 * after `onAdLoaded`. Blocking it guarantees the banner never becomes
 * visible even if a view was created through an unexpected path.
 */
object AdmobShowFingerprint : Fingerprint(
    definingClass = "Lcom/homelib/android/ad/AdmobAdapter;",
    name = "show",
    returnType = "V",
    parameters = emptyList(),
)
