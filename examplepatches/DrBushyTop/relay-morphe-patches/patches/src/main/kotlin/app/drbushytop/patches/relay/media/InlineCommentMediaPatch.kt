package app.drbushytop.patches.relay.media

import app.drbushytop.patches.relay.Relay
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val INLINE_CLASS = "Lapp/drbushytop/extension/relay/inline/InlineCommentMedia;"

/** The registers an invoke passes, whichever form of invoke it is. */
private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.invokeRegisters(): List<Int> =
    when (this) {
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        else -> throw PatchException("Not an invoke: $opcode")
    }

@Suppress("unused")
val inlineCommentMediaPatch = bytecodePatch(
    name = "Show comment images inline",
    description = "Draws pictures and GIFs linked in a comment (Reddit uploads, Giphy, i.imgur) " +
        "inside the comment instead of as a link. Tapping one opens it full screen as before. " +
        "GIFs animate on Wi-Fi and show a still on mobile data. Follows Relay's NSFW Thumbnails " +
        "setting. Can be turned off, or limited to Wi-Fi, in Settings > Behaviour > Comments.",
    default = true,
) {
    compatibleWith(*Relay.compatibility)
    extendWith(Relay.EXTENSION)
    // Tapping a Reddit .jpeg/.webp picture must open the viewer, not the browser.
    dependsOn(openRedditImagesInViewerPatch, inlineCommentMediaSettingsPatch)

    execute {
        // region Know which posts are NSFW, to follow Relay's "NSFW Thumbnails" setting.

        listOf(DataStoryFromJsonFingerprint, DataStoryUpdateFromJsonFingerprint).forEach { fingerprint ->
            fingerprint.method.addInstructions(
                0,
                "invoke-static/range { p1 .. p1 }, $INLINE_CLASS->rememberStory(Lorg/json/JSONObject;)V",
            )
        }

        // endregion

        // region Keep the media_metadata Relay discards, and the comment's post.

        DataCommentFromJsonFingerprint.let { fingerprint ->
            val index = fingerprint.instructionMatches.last().index
            val method = fingerprint.method
            // optJSONObject's receiver is the comment's JSON.
            val json = method.getInstruction(index).invokeRegisters().first()
            method.addInstructions(
                index,
                "invoke-static { p0, v$json }, $INLINE_CLASS->rememberComment(Ljava/lang/Object;Lorg/json/JSONObject;)V",
            )
        }

        // endregion

        // region Turn picture links in the comment's text into pictures.

        val bodyField = DataCommentBuildTextFingerprint.let { fingerprint ->
            val index = fingerprint.instructionMatches.last().index
            val method = fingerprint.method
            val put = method.getInstruction<TwoRegisterInstruction>(index)
            val field = (put as ReferenceInstruction).reference as FieldReference
            // The value register already holds the text, so it is free to reuse.
            val value = put.registerA
            method.addInstructions(
                index + 1,
                """
                    invoke-static { p0, v$value }, $INLINE_CLASS->inlineMedia(Ljava/lang/Object;Landroid/text/Spanned;)Landroid/text/Spanned;
                    move-result-object v$value
                    iput-object v$value, p0, $field
                """,
            )
            field
        }

        // endregion

        // region Tell the pictures which view shows them.

        CommentsAdapterGetViewFingerprint.method.apply {
            val reads = instructions.withIndex().filter { (_, instruction) ->
                instruction.opcode == Opcode.IGET_OBJECT &&
                    ((instruction as ReferenceInstruction).reference as FieldReference).let {
                        it.definingClass == bodyField.definingClass && it.name == bodyField.name
                    }
            }
            if (reads.isEmpty()) throw PatchException("Comment text is never read in CommentsAdapter#getView")

            // Insert from the last so earlier indices stay valid.
            reads.map { it.index }.sortedDescending().forEach { readIndex ->
                val setText = instructions.withIndex().drop(readIndex + 1).firstOrNull { (_, instruction) ->
                    (instruction.opcode == Opcode.INVOKE_VIRTUAL || instruction.opcode == Opcode.INVOKE_VIRTUAL_RANGE) &&
                        ((instruction as ReferenceInstruction).reference as MethodReference).let {
                            it.name == "setText" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/CharSequence;")
                        }
                } ?: throw PatchException("No setText after the comment text is read")
                val (view, text) = setText.value.invokeRegisters()
                addInstructions(
                    setText.index,
                    "invoke-static { v$view, v$text }, $INLINE_CLASS->bindCommentBody(Landroid/widget/TextView;Ljava/lang/CharSequence;)V",
                )
            }
        }

        // endregion

        // region Leave room under a picture that collapses the comment when tapped.

        // Relay counts a touch anywhere on a picture's line, including below the picture, as
        // a touch on it. v0 is a local the method writes before reading.
        CommentTouchOnLinkFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0, p1 }, $INLINE_CLASS->touchBelowPicture(Landroid/widget/TextView;Landroid/view/MotionEvent;)Z
                    move-result v0
                    if-eqz v0, :link
                    const/4 v0, 0x0
                    return v0
                """,
                ExternalLabel("link", getInstruction(0)),
            )
        }

        // endregion
    }
}
