package app.template.patches.aare

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.COMPATIBILITY_AARE

/** CarRuntime.assistant(): the steering-wheel voice button and the rail's microphone. */
internal object CarRuntimeAssistantFingerprint : Fingerprint(
    definingClass = "Lnet/prototux/aare/host/CarRuntime;",
    name = "assistant",
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val aareAssistantPatch = patch(
    name = "AARE assistant",
    description = "The voice button opens AARE's own assistant on the car screen, in Italian, German or English: navigation, " +
        "music, messages and replies, calls, the time. For anything else it opens the phone's assistant (Google).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_AARE)

    extendWith("extensions/extension.mpe")

    // Its cards, voice and messages come from the voice patches.
    dependsOn(settingsPatch, voiceReplyPatch)

    execute {
        registerSetting("aare_assistant")

        CarRuntimeAssistantFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0 }, Lapp/template/extension/aare/AareAssistant;->onAssistant(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :aare_assistant
                    return-void
                """,
                ExternalLabel("aare_assistant", getInstruction(0)),
            )
        }
    }
}
