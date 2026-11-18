package io.github.henr1klmb.patches.hellofitpro

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val RETURN_VOID = "return-void"

private const val RETURN_FALSE = """
    const/4 v0, 0x0
    return v0
"""

@Suppress("unused")
val disableAdsPatch = patch(
    name = "Disable ads",
    description = "Disables ads.",
) {
    compatibleWith(HELLOFITPRO_COMPATIBILITY)

    execute {
        // Suppress interstitials and reports ads
        AdInterstitialManagerShouldShowAdFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        AdInterstitialManagerShouldReportsShowFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        // Suppress hot-start splash ads
        LifecycleAdHotSplashCanShowADFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        // Prevent cold-start splash ad loading
        SplashAdActivityLoadAdFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        // Prevent dashboard banner ad view creation and loading
        HealthFragmentInitBannerViewFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        // Disable ThinkUp / TopOn mediation SDK initialization
        TUSdkInitFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        // Disable Ogury SDK direct initialization
        OguryStartFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        // Disable InMobi SDK direct initialization and mark uninitialized
        InMobiSdkInitFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        InMobiSdkIsInitializedFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        // Prevent auto-initialization of ad mediation ContentProviders
        YandexMobileAdsInitializeProviderOnCreateFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        VungleProviderOnCreateFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        ThinkUpInitializationProviderOnCreateFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        StartAppInitProviderOnCreateFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        AudienceNetworkContentProviderOnCreateFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        GoogleMobileAdsInitProviderOnCreateFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        BigoAdsProviderOnCreateFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        TraminiContentProviderOnCreateFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        SdmInitializationProviderOnCreateFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )
    }
}
