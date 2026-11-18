package io.github.henr1klmb.patches.mobilede

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val RETURN_VOID = "return-void"

@Suppress("unused")
val disableTrackingPatch = patch(
    name = "Disable tracking",
    description = "Disables Trackers and Analytics.",
) {
    compatibleWith(MOBILE_DE_COMPATIBILITY)

    execute {
        // Neutralize Adjust SDK initialization and consent handling
        AdjustInitSdkFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        AdjustTrackingSdkManagerInitializeFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        AdjustTrackingSdkManagerOnConsentChangedFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        // Neutralize CompositeTrackingBackend event, screen, and user parameter tracking
        CompositeTrackingBackendTrackEventFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        CompositeTrackingBackendTrackScreenFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        CompositeTrackingBackendTrackUserParameterFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        CompositeTrackingBackendTrackDefaultPushPermissionStateFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )
    }
}
