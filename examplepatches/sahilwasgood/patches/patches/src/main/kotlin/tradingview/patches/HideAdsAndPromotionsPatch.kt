package tradingview.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideAdsAndPromotionsPatch = bytecodePatch(
    name = "Hide ads and upgrade promotions",
    description = "Hides AdMob ads, GoPro ads in feed, promotional banners in profile and watchlists, and paywall sheets.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TRADINGVIEW)

    execute {
        // Force areAdsAvailable to return false
        AreAdsAvailableFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )

        // Disable GoPro popup ad view
        ShowGoProAdFingerprint.method.addInstructions(
            0,
            "return-void"
        )

        // Disable watchlist promotional banners
        WatchlistBannerUpdateFingerprint.method.addInstructions(
            0,
            "return-void"
        )

        // Disable GoPro action dispatch
        GoProActionDispatchFingerprint.method.addInstructions(
            0,
            "return-void"
        )

        // Return Unit from Paywall event push
        PaywallEventPushFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object v0
            """
        )
    }
}
