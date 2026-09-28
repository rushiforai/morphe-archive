package app.adish.patches.jainpanchang

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.adish.patches.shared.Constants.COMPATIBILITY_JAINPANCHANG

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Disables banner, interstitial, rewarded, app open, and native ads.",
    default = true
) {
    compatibleWith(COMPATIBILITY_JAINPANCHANG)

    execute {
        FullScreenLoadFingerprint.method.addInstructions(0, "return-void")

        FullScreenShowFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0

                invoke-interface {p4, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

                return-void
            """
        )

        NativeAdLoadFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0

                invoke-interface {p3, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

                return-void
            """
        )

        BaseAdViewLoadAdFingerprint.method.addInstructions(0, "return-void")

        BannerRequestAdFingerprint.method.addInstructions(0, "return-void")

        val adapterMethodNames = setOf(
            "requestBannerAd",
            "requestInterstitialAd",
            "requestNativeAd",
            "showInterstitial"
        )
        mutableClassDefBy("Lcom/google/ads/mediation/AbstractAdViewAdapter;")
            .methods
            .filter { it.name in adapterMethodNames }
            .forEach { it.addInstructions(0, "return-void") }
    }
}
