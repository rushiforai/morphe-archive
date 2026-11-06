package app.orangetree.ytmaitag.patches.music.aitag

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.orangetree.ytmaitag.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val EXTENSION_CLASS = "Lapp/orangetree/ytmaitag/extension/AiTagPatch;"

@Suppress("unused")
val aiTagPatch = bytecodePatch(
    name = "YouTube Music AI Tagger",
    description = "Adds a blue \"AI\" tag to songs by artists on the community AI-artist list " +
            "(github.com/CennoxX/spotify-ai-blocker), in song rows, cards, the mini player and Now Playing.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    extendWith("extensions/extension.mpe")

    execute {
        // Litho text: wrap every returned CharSequence.
        LithoTextCreationFingerprint.method.apply {
            instructions
                .withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }
                .reversed()
                .forEach { index ->
                    val register = getInstruction<OneRegisterInstruction>(index).registerA
                    addInstructionsAtControlFlowLabel(
                        index,
                        """
                            invoke-static/range { v$register .. v$register }, $EXTENSION_CLASS->onLithoText(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
                            move-result-object v$register
                        """
                    )
                }
        }

        // Native text views: rewrite the text before it is set.
        YouTubeTextViewSetTextFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p1 }, $EXTENSION_CLASS->onViewText(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
                move-result-object p1
            """
        )
    }
}
