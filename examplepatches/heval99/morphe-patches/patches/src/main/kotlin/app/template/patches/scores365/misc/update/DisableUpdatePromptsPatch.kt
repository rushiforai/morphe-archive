package app.template.patches.scores365.misc.update

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_365SCORES
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private val UPDATE_EXTRAS = setOf("ForceUpdateDialog", "NewVersionPopup")

// The readers look the extras up by key, so renaming the key on the reading side means the
// extras the startup flow sets are never found: no update screen, no popup. The sending side is
// left alone (it is R8-renamed and harder to anchor).
@Suppress("unused")
val disableUpdatePromptsPatch = bytecodePatch(
    name = "Disable update prompts",
    description = "Disables the update prompts."
) {
    compatibleWith(COMPATIBILITY_365SCORES)

    execute {
        for (fingerprint in listOf(BaseActivityOnCreateFingerprint, BaseActionBarActivityOnCreateFingerprint)) {
            val method = fingerprint.method
            val edits = method.implementation!!.instructions.withIndex().toList().filter { (_, instruction) ->
                instruction.opcode == Opcode.CONST_STRING &&
                    ((instruction as ReferenceInstruction).reference as StringReference).string in UPDATE_EXTRAS
            }
            // Compare the keys, not the count: two reads of one key must not pass for both.
            val found = edits.map { (_, instruction) ->
                ((instruction as ReferenceInstruction).reference as StringReference).string
            }.toSet()
            if (found != UPDATE_EXTRAS) {
                throw PatchException(
                    "${method.definingClass}.onCreate no longer reads both update extras " +
                        "(missing ${UPDATE_EXTRAS - found})",
                )
            }
            for ((index, instruction) in edits) {
                val register = (instruction as OneRegisterInstruction).registerA
                val key = ((instruction as ReferenceInstruction).reference as StringReference).string
                method.replaceInstruction(index, "const-string v$register, \"morphe_disabled_$key\"")
            }
        }
    }
}
