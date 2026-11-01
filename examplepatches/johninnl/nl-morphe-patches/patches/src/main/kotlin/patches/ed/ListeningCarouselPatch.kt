package patches.ed

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel

/** The SDK supplies ibd.h when Continue Listening has no real state. Its
 * c6d fixture creates clickable detailepisode_1 cards, which request a fake
 * audio item and return HTTP "Not found". Suppress only that loading render;
 * a populated history row enters the complete original renderer unchanged. */
@Suppress("unused")
val hideEmptyListeningCarousel = bytecodePatch(
    name = "Hide empty listening carousel",
    description = "Hides the blank Luister verder loading row and its invalid placeholder links. Real listening history, podcast carousels and playback remain available."
) {
    compatibleWith(ed)
    dependsOn(originalInput)
    execute {
        val renderer = exact("Ls99;", "g(Lix;IZLxe7;ZLyg3;I)V").method
        check(renderer.implementation!!.registerCount == 27) {
            "ED Continue Listening renderer register layout changed"
        }
        renderer.addInstructionsWithLabels(0, """
            if-eqz p4, :listening_content
            return-void
        """.trimIndent(), ExternalLabel("listening_content", renderer.getInstruction(0)))
    }
}
