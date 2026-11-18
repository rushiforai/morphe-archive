package io.github.henr1klmb.patches.comparify

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val RETURN_VOID = "return-void"

private const val RETURN_FALSE = """
    const/4 p0, 0x0
    return p0
"""

private const val RESOLVE_NULL_P1 = """
    const/4 v0, 0x0
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
    return-void
"""

private const val RESOLVE_NULL_P4 = """
    const/4 v0, 0x0
    invoke-interface {p4, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
    return-void
"""

@Suppress("unused")
val disableAdsPatch = patch(
    name = "Disable ads",
    description = "Disables ad banners and rewarded ads",
) {
    compatibleWith(COMPARIFY_COMPATIBILITY)

    execute {
        // Prevent Google MobileAds ContentProvider auto-initialization
        MobileAdsInitProviderOnCreateFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        // Immediately resolve React Native Google Mobile Ads module initialization
        ReactNativeGoogleMobileAdsModuleInitializeFingerprint.methodOrNull?.addInstructions(
            0,
            RESOLVE_NULL_P1.trimIndent(),
        )

        // Disable banner ad requests in React Native banner view manager
        ReactNativeGoogleMobileAdsBannerAdViewManagerRequestAdFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        // Disable loading of full-screen ads (interstitials, rewarded, app open)
        ReactNativeGoogleMobileAdsFullScreenAdModuleLoadFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        // Immediately resolve full-screen ad show requests without displaying an ad
        ReactNativeGoogleMobileAdsFullScreenAdModuleShowFingerprint.methodOrNull?.addInstructions(
            0,
            RESOLVE_NULL_P4.trimIndent(),
        )

        // Bypass Google UMP consent form requirement
        ReactNativeGoogleMobileAdsConsentModuleLoadAndShowConsentFormFingerprint.methodOrNull?.addInstructions(
            0,
            RESOLVE_NULL_P1.trimIndent(),
        )
    }
}
