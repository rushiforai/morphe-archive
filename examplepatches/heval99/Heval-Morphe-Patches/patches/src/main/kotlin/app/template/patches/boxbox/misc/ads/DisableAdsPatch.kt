package app.template.patches.boxbox.misc.ads

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_BOXBOX
import app.morphe.util.returnEarly

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Prevents AppLovin interstitial ads from loading and showing."
) {
    compatibleWith(COMPATIBILITY_BOXBOX)

    execute {
        MaxInterstitialAdLoadFingerprint.methodOrNull?.returnEarly()
        MaxInterstitialAdShowFingerprint.methodOrNull?.returnEarly()
    }
}
