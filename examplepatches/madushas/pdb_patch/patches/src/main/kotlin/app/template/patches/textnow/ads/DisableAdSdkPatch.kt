package app.template.patches.textnow.ads

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TEXTNOW_COMPATIBILITY
import app.template.patches.shared.returnEarly
import app.template.patches.textnow.TextNowMobileAdsInitAdUnit
import app.template.patches.textnow.TextNowMobileAdsInitContext

/**
 * No-ops the Google Mobile Ads `MobileAds.initialize(...)` overloads so the ad SDK never
 * starts. Combined with [textnowRemoveAdsPatch] (which disables every ad-network
 * component), this closes both the code and manifest ad surface.
 */
@Suppress("unused")
val textnowDisableAdSdkPatch = bytecodePatch(
    name = "Disable ad SDK",
    description = "No-ops the Google Mobile Ads initialisation so the ad SDK never starts.",
    default = true,
) {
    compatibleWith(TEXTNOW_COMPATIBILITY)

    execute {
        TextNowMobileAdsInitContext.method.returnEarly()
        TextNowMobileAdsInitAdUnit.method.returnEarly()
    }
}
