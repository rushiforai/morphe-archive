package app.charlesattend.patches.beeper.transcribe

import app.charlesattend.patches.shared.Constants.COMPATIBILITY_BEEPER
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideTranscribeButtonPatch = bytecodePatch(
    name = "Hide transcribe button",
    description = "Hides the transcribe button below voice messages in chats. " +
            "Existing transcriptions and auto-transcribe are not changed.",
    default = true
) {
    compatibleWith(COMPATIBILITY_BEEPER)

    execute {
        // Return before the composable starts its restart group, so it emits nothing.
        // Its padding and background are inside the composable, so no empty space is left.
        TranscribeButtonFingerprint.method.addInstruction(0, "return-void")
    }
}
