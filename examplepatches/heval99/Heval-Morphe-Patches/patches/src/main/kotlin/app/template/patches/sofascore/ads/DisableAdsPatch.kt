package app.template.patches.sofascore.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables banner, interstitial, feed, native, preroll and rewarded ads.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    execute {
        // Flip the local account flags the app's ad logic consults, so every
        // "should show ads" decision evaluates to false on its own:
        //   if (getForceAds()) showAds();                       // -> false
        //   if (!getHasServerAds() || getPurchasedAds()
        //       || getForceHideAds() || ...) hideAds();         // -> true
        GetForceAdsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        GetForceHideAdsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        GetHasServerAdsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
    }
}
