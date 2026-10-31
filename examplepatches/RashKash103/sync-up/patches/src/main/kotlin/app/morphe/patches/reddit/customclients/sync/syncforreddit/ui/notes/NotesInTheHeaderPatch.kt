package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.notes

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch
import app.morphe.patcher.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val NOTES_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/ui/notes/Notes;"

private const val APPEND_NOTE_METHOD =
    "appendNote($HEADER_BUILDER_CLASS$POST_MODEL)V"

private const val APPEND_POST_NOTE_METHOD =
    "appendPostNote($HEADER_BUILDER_CLASS" + "Ljava/lang/Object;$POST_MODEL)V"

/**
 * Makes room on the line under an author for anything a patch has to say about a post or a
 * comment: that its text was put back, that it is being read in translation.
 *
 * <p>There is one place that line is built and more than one patch with something to add to it,
 * so the call goes in here once and what it says is decided at the time of drawing. Has no name,
 * and so is not offered on its own: it does nothing until a patch gives it something to say.
 */
val notesInTheHeaderPatch = bytecodePatch(
    description = "Adds a place on the line under an author for a patch to say something about " +
            "the post or the comment.",
) {
    dependsOn(sharedExtensionPatch)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        // The note goes in after the separator that follows Sync's own flair. That separator is
        // where both branches of the setting governing the flair meet again, so putting the note
        // before it would leave it out for anyone who has flair turned off. The registers are
        // read off the flair call rather than assumed, and no new ones are needed: it already
        // holds the builder and the comment side by side.
        commentHeaderFingerprint.method.apply {
            val flairIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_STATIC &&
                        getReference<MethodReference>()?.parameterTypes?.toList() ==
                        listOf(HEADER_BUILDER_CLASS, "Landroid/widget/TextView;", POST_MODEL)
            }
            val flairCall = getInstruction<FiveRegisterInstruction>(flairIndex)

            addInstructions(
                flairIndex + 2,
                "invoke-static { v${flairCall.registerC}, v${flairCall.registerE} }, " +
                        "$NOTES_CLASS_DESCRIPTOR->$APPEND_NOTE_METHOD"
            )
        }

        // The same for a post. Its header keeps the post in a register too high to name in an
        // ordinary call, so the note goes in the way the flair beside it does, over the range
        // the flair itself is given.
        postHeaderFingerprint.method.apply {
            val flairIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_STATIC_RANGE &&
                        getReference<MethodReference>()?.parameterTypes?.toList() ==
                        listOf(HEADER_BUILDER_CLASS, "Landroid/widget/TextView;", POST_MODEL)
            }
            val flairCall = getInstruction<RegisterRangeInstruction>(flairIndex)
            val first = flairCall.startRegister

            addInstructions(
                flairIndex + 2,
                "invoke-static/range { v$first .. v${first + 2} }, " +
                        "$NOTES_CLASS_DESCRIPTOR->$APPEND_POST_NOTE_METHOD"
            )
        }
    }
}
