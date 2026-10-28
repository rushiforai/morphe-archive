package app.saurabh.patches.blablacar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.saurabh.patches.shared.Constants.COMPATIBILITY_BLABLACAR

@Suppress("unused")
val disableAdLoadingPatch = bytecodePatch(
    name = "Remove Ads",
    description = "Prevents Various Ads From Loading",
    default = true
) {
    compatibleWith(COMPATIBILITY_BLABLACAR)
    extendWith("extensions/extension.mpe")
    execute {
        InMobiMediaCpLoadAdFingerprint.method.addInstructions(
            0,
            """
            return-void
        """
        )

        InMobiInterstitialLoadAdUnitFingerprint.method.addInstructions(
            0,
            """
            return-void
        """
        )

        AdMobInterstitialLoadAdFingerprint.method.addInstructions(
            0,
            """
            return-void
        """
        )

        AdMobAppOpenLoadAdFingerprint.method.addInstructions(
            0,
            """
            return-void
        """
        )

        MetaRtbAppOpenAdLoadAdFingerprint.method.addInstructions(
            0,
            """
            return-void
        """
        )

        AdMobAnchorBannerViewLoadAdFingerprint.method.addInstructions(
            0,
            """
            return-void
        """
        )

        AdMobNativeViewLoadAdFingerprint.method.addInstructions(
            0,
            """
            return-void
        """
        )

        AdNativeSearchResultsPageViewLoadAdFingerprint.method.addInstructions(
            0,
            """
            return-void
        """
        )

        AdInterstitialLoadAdFingerprint.method.addInstructions(
            0,
            """
            return-void
        """
        )

        AdNativeHomePageViewLoadAdFingerprint.method.addInstructions(
            0,
            """
            return-void
        """
        )

        AdAnchorBannerViewLoadAdFingerprint.method.addInstructions(
            0,
            """
            return-void
        """
        )
    }
}
