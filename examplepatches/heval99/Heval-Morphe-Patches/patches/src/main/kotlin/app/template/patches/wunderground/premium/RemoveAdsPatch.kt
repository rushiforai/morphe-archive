package app.template.patches.wunderground.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_WUNDERGROUND
import app.morphe.util.returnEarly

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Unlocks the ad-free purchase."
) {
    compatibleWith(COMPATIBILITY_WUNDERGROUND)

    execute {
        AdFreePurchasedFingerprint.method.returnEarly(true)
        IsAdsFreePurchasedFingerprint.method.returnEarly(true)
        IsAdsFreeV2UserFingerprint.method.returnEarly(true)
    }
}
