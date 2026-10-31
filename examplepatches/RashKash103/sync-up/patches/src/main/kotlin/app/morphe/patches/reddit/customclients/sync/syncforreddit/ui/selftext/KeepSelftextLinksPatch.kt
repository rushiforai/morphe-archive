package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.selftext

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch
import app.morphe.patcher.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/ui/KeepSelftextLinksPatch;"

private const val KEEP_DRAWING_METHOD = "keepDrawing(Loc/c;)V"

@Suppress("unused")
val keepSelftextLinksPatch = bytecodePatch(
    name = "Keep the links in the text of a post",
    description = "Keeps the formatting and links in the body shown under a post, which Sync " +
            "otherwise discards.",
    default = true
) {
    dependsOn(sharedExtensionPatch)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        parseBodyFingerprint.method.apply {
            // The method tidies the text with another call of the same shape earlier on, so the
            // dropping is found by what guards it: the one option the parse reads off its
            // settings, which is whether a preview is being drawn.
            val asked = indexOfFirstInstructionOrThrow {
                opcode == Opcode.IGET_BOOLEAN &&
                        getReference<FieldReference>()?.definingClass == "Lnc/a;"
            }

            // The dropping still happens, inside the replacement: it is what releases the
            // images, and only what survives it is put back.
            val dropped = indexOfFirstInstructionOrThrow(asked) {
                val reference = getReference<MethodReference>()
                reference?.definingClass == "Loc/c;" && reference.returnType == "V" &&
                        reference.parameterTypes.isEmpty()
            }

            val builder = getInstruction<FiveRegisterInstruction>(dropped).registerC

            replaceInstruction(
                dropped,
                "invoke-static { v$builder }, $EXTENSION_CLASS_DESCRIPTOR->$KEEP_DRAWING_METHOD"
            )
        }
    }
}
