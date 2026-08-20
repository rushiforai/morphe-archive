package app.template.patches.scores365.misc.ads

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_365SCORES
import app.morphe.util.returnEarly

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables Google Mobile Ads (AdMob) initialization, blocking " +
            "banner, interstitial, rewarded, native and mediated ads."
) {
    compatibleWith(COMPATIBILITY_365SCORES)

    execute {
        // Both overloads are entry points used by the Blaze GAM SDK wrapper.
        MobileAdsInitializeFingerprint.methodOrNull?.returnEarly()
        MobileAdsInitializeWithListenerFingerprint.methodOrNull?.returnEarly()
    }
}