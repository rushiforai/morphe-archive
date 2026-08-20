package app.template.patches.livescore.misc.ads

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_LIVESCORE
import app.morphe.util.returnEarly

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Forces AdsRemovalSettings.areAdsDisabled() to return true, " +
            "disabling banner, interstitial, MPU, hero placement, coverage " +
            "sponsorship and announcement ads."
) {
    compatibleWith(COMPATIBILITY_LIVESCORE)

    execute {
        AdsRemovalSettingsAreAdsDisabledFingerprint.methodOrNull?.returnEarly(value = true)
    }
}