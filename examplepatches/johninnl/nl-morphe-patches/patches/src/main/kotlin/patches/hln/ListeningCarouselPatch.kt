package patches.hln

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel

/** Empty history becomes had.h's clickable detailepisode_ loading fixtures.
 * Skip only the loading render, before any Compose group is opened. Real
 * history enters the complete original renderer, as in the ED control. */
@Suppress("unused")
val hideEmptyListeningCarousel = bytecodePatch(
    name = "Hide empty listening carousel",
    description = "Hides the blank Luister verder loading row and its invalid placeholder links. Real listening history, podcast carousels and playback remain available."
) {
    compatibleWith(hln)
    dependsOn(originalInput)
    execute {
        val renderer = exact("Ls09;", "k(Lix;IZLxe7;ZLtg3;I)V").method
        check(renderer.implementation!!.registerCount == 27) {
            "HLN Continue Listening renderer register layout changed"
        }
        renderer.addInstructionsWithLabels(0, """
            if-eqz p4, :listening_content
            return-void
        """.trimIndent(), ExternalLabel("listening_content", renderer.getInstruction(0)))
    }
}
