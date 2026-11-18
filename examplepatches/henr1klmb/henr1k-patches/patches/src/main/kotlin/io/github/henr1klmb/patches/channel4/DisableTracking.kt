package io.github.henr1klmb.patches.channel4

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val RETURN_VOID = "return-void"

private const val RETURN_FALSE = """
    const/4 p0, 0x0
    return p0
"""

@Suppress("unused")
val disableTrackingPatch = patch(
    name = "Disable tracking",
    description = "Disables Tracking and Analytics.",
) {
    compatibleWith(CHANNEL4_COMPATIBILITY)

    execute {
        // Prevent Firebase ContentProvider auto-initialization
        FirebaseInitProviderOnCreateFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        // Disable Firebase Analytics events
        FirebaseAnalyticsLogEventFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        // Disable Firebase Crashlytics reporting
        FirebaseCrashlyticsRecordExceptionFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        FirebaseCrashlyticsLogFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        FirebaseCrashlyticsSetUserIdFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        FirebaseCrashlyticsSendUnsentReportsFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        // Disable mParticle initialization and event tracking
        MParticleStartFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        MParticleLogEventFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        MParticleLogScreenMpEventFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        MParticleLogScreenStringFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        MParticleLogScreenStringMapFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        // Disable Braze custom events and purchase tracking
        BrazeLogCustomEventFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        BrazeLogCustomEventWithPropsFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        BrazeLogPurchaseFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        // Disable Optimizely tracking
        OptimizelyTrackFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        OptimizelyTrackWithAttributesFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        OptimizelyTrackWithEventTagsFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )
    }
}
