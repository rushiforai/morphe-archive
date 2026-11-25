package app.deviceinfo.patches.ads

import app.morphe.patcher.Fingerprint

/**
 * DeviceInfo 3.4.4.0 dropped the lifecycle-aware native ad holder that 3.4.3.4's patch stubbed
 * (`Lgq1;`, recognised by its `Lads_mobile_sdk/bu1;` field - no app class holds that type any
 * more). Each placement now builds its request inline and loads it directly: the six native
 * slots (dashboard, Wi-Fi/app analyzer, sensors, battery, memory, tools) call the SDK's static
 * `NativeAd.load` (`Li01;->l(Lvr1;Lrr1;)V`), and `AutomaticTestActivity.w()`/`x()` build and
 * load two interstitials entirely inline - so there is no single loader left to stub.
 *
 * What every one of those sites *does* still share is the app's own ad-free entitlement check,
 * performed before anything else:
 *
 *   `Ly92;->e:Lqj0;` -> `Lqj0;->i(Context)Ly92;` -> `Ly92;->x()Z`
 *
 * `x()` is `prefs.getBoolean("is_ad_free", false)`, the flag a donation purchase sets
 * (its setter `C(Z)V` is the only other method referencing the key, and returns void). The same
 * flag also gates the overflow-menu "Remove Ads" entry, the in-list "Remove ads" promo cards and
 * the About screen's ad-free badge, so forcing it is how the app itself turns ads off.
 *
 * `Ly92` is an R8-merged class (one instance per synthetic `a:B` role) - but `x()` casts its
 * field to `SharedPreferences`, so it is only ever called on the prefs role and returning true
 * unconditionally cannot leak into another role.
 */
object AdFreeFlagFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("is_ad_free"),
)
