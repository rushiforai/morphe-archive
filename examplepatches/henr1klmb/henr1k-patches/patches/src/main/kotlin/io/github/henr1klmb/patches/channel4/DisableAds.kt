package io.github.henr1klmb.patches.channel4

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val RETURN_VOID = "return-void"

private const val RETURN_FALSE = """
    const/4 v0, 0x0
    return v0
"""

private const val RETURN_EMPTY_LIST = """
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    move-result-object v0
    return-object v0
"""

@Suppress("unused")
val disableAdsPatch = patch(
    name = "Disable ads",
    description = "Disables pre-roll, mid-roll video and other ads.",
) {
    compatibleWith(CHANNEL4_COMPATIBILITY)

    execute {
        // Return empty advert breaks and empty ads list for FreeWheel metadata responses
        ApiAdvertMetadataResponseGetAdvertBreaksFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_EMPTY_LIST.trimIndent(),
        )

        ApiAdvertMetadataResponseGetAdsFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_EMPTY_LIST.trimIndent(),
        )

        // Return empty advert breaks when casting
        ApiProgrammeInfoGetAdvertBreaksFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_EMPTY_LIST.trimIndent(),
        )

        // Suppress advert countdown timer overlay and force ad experiment disabled
        AdvertBreakTimerViewModelShowTimerOverlayFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_VOID,
        )

        AdvertBreakTimerViewModelIsFeatureEnabledInExperimentFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )
    }
}
