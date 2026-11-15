package app.memorizepi.patches.pi.ads

import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly
import app.memorizepi.patches.pi.shared.Constants

/**
 * Removes the banner ads shown on the home screen pages of
 * "Memorize Pi Digits".
 *
 * The banner is an AdMob ad rendered by the plugin glue
 * (`com.homelib.android.ad.AdManager` / `AdmobAdapter`) as an Android
 * `View` on top of the Unity canvas. The patch returns early from every
 * Java entry point that can create or show that view:
 *
 * - `DeviceManager.ShowBannerAd(int)`  (classic plugin entry point)
 * - `AdManager.ShowBannerAd(int)`      (singleton, callable directly via JNI)
 * - `AdmobAdapter.showBannerAd()`      (actual implementation)
 * - `AdmobAdapter.show()`              (makes the view VISIBLE)
 *
 * As a result:
 *
 * - no banner `View` is created or added to the activity,
 * - no banner ad request is sent to AdMob (also removes the ad network
 *   traffic that otherwise happens every time a home screen page shows
 *   the banner),
 * - the freed area simply shows the Unity background (black).
 *
 * Full screen (interstitial) and rewarded ads are intentionally left
 * untouched: they use separate code paths
 * (`ShowFullScreenAd` / `PlayRewardAd`) and are not part of the requested
 * change.
 */
val removeHomeScreenAdsPatch = patch(
    name = "Remove home screen ads",
    description = "Removes the AdMob banner ads shown on the home screen pages. " +
            "All Java entry points (DeviceManager, AdManager, AdmobAdapter) are blocked, " +
            "so no banner view is created or shown. The area simply shows the black " +
            "Unity background afterwards.",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_PI)

    execute {
        // 1) Classic Unity plugin entry point.
        HomeBannerAdFingerprint.method.returnEarly()

        // 2) Singleton used by the managed wrapper via JNI.
        AdManagerShowBannerAdFingerprint.method.returnEarly()

        // 3) Actual banner implementation.
        AdmobShowBannerAdFingerprint.method.returnEarly()

        // 4) Visibility switch (defense in depth).
        AdmobShowFingerprint.method.returnEarly()
    }
}
