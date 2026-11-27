package app.syncit.patches.sync.links

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.getReference
import app.syncit.patches.sync.Constants.SYNC_FOR_REDDIT
import app.syncit.patches.sync.extension.sharedExtensionPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/syncit/extension/KeepPreviewLinksPatch;"

@Suppress("unused")
val keepPreviewLinksPatch = patch(
    name = "Keep links in post previews",
    description = "Keeps links in the text under a post tappable in feed previews, " +
            "where Sync otherwise drops them. Only the links are restored, so the text keeps " +
            "the size chosen in the app's settings.",
    default = true
) {
    compatibleWith(SYNC_FOR_REDDIT)

    dependsOn(sharedExtensionPatch)

    execute {
        val method = parseBodyFingerprint.method
        val instructions = method.implementation!!.instructions.toList()

        // The one option the parser reads off its settings, which is whether a preview is
        // being built. Everything the fix needs comes after it.
        val previewCheck = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.IGET_BOOLEAN &&
                    instruction.getReference<FieldReference>()?.definingClass == "Lnc/a;"
        }
        check(previewCheck >= 0) {
            "Could not find where the parser decides it is building a preview."
        }

        // The call that drops the spans. It is what releases the image loads, and only what
        // survives it is put back by the extension.
        val dropCall = instructions.withIndex().firstOrNull { (index, instruction) ->
            if (index <= previewCheck) return@firstOrNull false

            val reference = instruction.getReference<MethodReference>()
            reference?.definingClass == "Loc/c;" &&
                    reference.name == "p" &&
                    reference.returnType == "V" &&
                    reference.parameterTypes.isEmpty()
        }?.index ?: error("Could not find where the parser drops the spans.")

        val builderRegister =
            method.getInstruction<FiveRegisterInstruction>(dropCall).registerC

        method.replaceInstruction(
            dropCall,
            "invoke-static { v$builderRegister }, " +
                    "$EXTENSION_CLASS_DESCRIPTOR->keepDrawing(Loc/c;)V"
        )
    }
}
