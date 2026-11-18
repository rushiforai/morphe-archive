package io.github.henr1klmb.patches.mydealz

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val RETURN_VOID = "return-void"

@Suppress("unused")
val disableTrackingPatch = patch(
    name = "Disable tracking",
    description = "Disables Tracking and Analytics.",
) {
    compatibleWith(MYDEALZ_COMPATIBILITY)

    execute {
        // Neutralize Adjust SDK initialization
        AdjustInitSdkFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        // Neutralize Adjust lifecycle auto-registration ContentProvider
        AdjustLifecycleProviderFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 p0, 0x0
                return p0
            """.trimIndent(),
        )

        // Neutralize Google MobileAds (AdMob) initialization
        MobileAdsInitializeFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        MobileAdsInitializeWithListenerFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        // Neutralize Google MobileAds ContentProvider auto-initialization
        MobileAdsInitProviderFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        // Neutralize Firebase Analytics screen logging and consent dispatch
        FirebaseAnalyticsSetCurrentScreenFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        FirebaseAnalyticsSetConsentFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )
    }
}
