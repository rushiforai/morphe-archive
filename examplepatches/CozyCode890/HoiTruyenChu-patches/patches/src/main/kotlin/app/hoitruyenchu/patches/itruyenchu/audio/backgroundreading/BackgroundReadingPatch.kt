package app.hoitruyenchu.patches.itruyenchu.audio.backgroundreading

import app.hoitruyenchu.patches.itruyenchu.audio.tts.ttsReliabilityPatch
import app.hoitruyenchu.patches.itruyenchu.shared.Constants.COMPATIBILITY_ITRUYENCHU
import app.hoitruyenchu.patches.itruyenchu.shared.Constants.EXTENSION_TTS_CONTROLLER
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel

@Suppress("unused")
val backgroundReadingPatch = patch(
    name = "Background reading",
    description = "Keeps reading with the screen off: React Native pauses JS timers when the app goes to " +
            "the background, which stops the app from starting the next chapter. " +
            "JS timers keep running while a reading session is active.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ITRUYENCHU)

    // The reading session state lives in TtsController.
    dependsOn(ttsReliabilityPatch)

    execute {
        TimerManagerOnHostPauseFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0 }, $EXTENSION_TTS_CONTROLLER->shouldDeferHostPause(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :pause
                    return-void
                """,
                ExternalLabel("pause", getInstruction(0)),
            )
        }

        TimerManagerOnHostResumeFingerprint.method.addInstructions(
            0,
            "invoke-static { }, $EXTENSION_TTS_CONTROLLER->onHostResume()V",
        )
    }
}
