package app.riky.patches.meteo3b

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_METEO3B

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Removes banner, native, cover and interstitial ads and unlocks premium features.",
    default = true
) {
    compatibleWith(COMPATIBILITY_METEO3B)

    execute {
        // Force user to be premium. This disables:
        // - interstitials (isInterstitialAllowed returns false when premium)
        // - the consent popup in MainActivity
        // - premium gated flows in BannerManager (loadCoverAds, loadStickyBanner, news native)
        IsPremiumFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
        IsConsentlessPremiumFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )

        // Return "none" from the provider evaluation so every banner type
        // (native bottom, native top, sticky, cover, interstitial, fallback, ...)
        // resolves to an empty/invisible banner instead of a real ad provider.
        EvaluateProviderFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "none"
                return-object v0
            """
        )

        // The fallback handlers dereference the banner returned by
        // initBannerStickyView/initBannerBottomView. Returning "no_adv" there
        // makes both handlers hide the banner instead of crashing on "none".
        EvaluateFallbackFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "no_adv"
                return-object v0
            """
        )
    }
}