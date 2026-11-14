package semicoloncolonel.mobilestream.patches.mlb.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import semicoloncolonel.mobilestream.patches.mlb.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// MLB 26.21.0.49 — Hide betting odds.
//
// The scores sheet shows a "betting odds" section, gated by a boolean field
// named "bettingOddsEnabled" on a scores data model. Every read of that field
// is made to return false, so the betting-odds section, its toggle, and its
// legal disclaimer never appear. The field name is semantic and stable; its
// holder class is renamed per build, so it is found by the field name.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val hideBettingOddsPatch = bytecodePatch(
    name = "Hide betting odds",
    description = "Removes the betting-odds section from the scores sheet.",
    default = false,
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        // Find the class that declares bettingOddsEnabled:Z.
        var owner: String? = null
        classDefForEach { classDef ->
            if (owner == null && classDef.fields.any { it.name == "bettingOddsEnabled" && it.type == "Z" }) {
                owner = classDef.type
            }
        }
        val field = owner ?: throw PatchException("bettingOddsEnabled field not found")

        // After every read of that field, force the destination register to 0.
        var patched = 0
        val targets = mutableListOf<String>()
        classDefForEach { classDef -> targets += classDef.type }
        targets.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                instructions.indices.reversed().forEach { index ->
                    val instruction = instructions[index]
                    if (instruction.opcode != Opcode.IGET_BOOLEAN) return@forEach
                    val reference = (instruction as ReferenceInstruction).reference as FieldReference
                    if (reference.definingClass != field || reference.name != "bettingOddsEnabled") return@forEach
                    val register = (instruction as OneRegisterInstruction).registerA
                    method.addInstructions(index + 1, "const/16 v$register, 0x0")
                    patched++
                }
            }
        }
        if (patched == 0) throw PatchException("No bettingOddsEnabled reads found")
    }
}
