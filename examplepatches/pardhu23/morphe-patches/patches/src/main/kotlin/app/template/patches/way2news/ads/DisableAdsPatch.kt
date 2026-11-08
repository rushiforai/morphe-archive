package app.template.patches.way2news.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_WAY2NEWS

@Suppress("unused")
val disableAdsPatch = patch(
    name = "Disable ads",
    description = "Blocks all Google Mobile Ads and Facebook Audience Network ad requests.",
    default = true
) {
    compatibleWith(COMPATIBILITY_WAY2NEWS)

    execute {
        // Every ad request goes through one of these SDK entry points. Making them no-ops
        // means no ad is ever requested, so no ad content, tracking or network call happens.
        listOf(
            GoogleAdLoaderLoadAdFingerprint,
            GoogleAdLoaderLoadAdsFingerprint,
            GoogleBaseAdViewLoadAdFingerprint,
            GoogleAdManagerAdViewLoadAdFingerprint,
            GoogleMobileAdsInitializeFingerprint,
            FacebookAdViewLoadAdFingerprint,
            FacebookNativeAdBaseLoadAdFingerprint,
        ).forEach { it.method.addInstructions(0, "return-void") }
    }
}
