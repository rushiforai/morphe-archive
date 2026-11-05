package app.template.patches.gpsmapcamera.ads

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_GPSMAPCAMERA
import app.template.patches.shared.misc.ads.GMA_LOAD_HOOKS
import app.template.patches.shared.misc.ads.neuterAdHooks

/**
 * GPS Map Camera Editor shows Google Mobile Ads only (the other networks are mediation adapters
 * that GMA drives), and every app call goes through its AdManager and AppOpenAdManager.
 *
 * 1. Both managers' canShowAds() answers false. That is the app's own no-ads path (subscribers and
 *    users who refused consent take it): MobileAds.initialize is never called, nothing loads, the
 *    banner helpers return null so every banner container stays empty or GONE, and the rewarded
 *    "Advanced search" button runs the app's "Ad failed" callback instead of waiting. No GMA static
 *    is called without initialize (rule 9): AdManager is the app's only MobileAds caller. The
 *    splash is a fixed delay and waits on no ad.
 * 2. Backstop: every GMA load returns at once (shared GMA_LOAD_HOOKS), in case a later build
 *    loads an ad around the managers.
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads.",
) {
    compatibleWith(COMPATIBILITY_GPSMAPCAMERA)

    execute {
        // 1. The managers' gates answer false.
        AdManagerCanShowAdsFingerprint.method.returnEarly(false)
        AppOpenAdManagerCanShowAdsFingerprint.method.returnEarly(false)

        // 2. Every GMA load is a no-op.
        neuterAdHooks(GMA_LOAD_HOOKS)
    }
}
