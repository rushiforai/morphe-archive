package app.gwp.patches.shared

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.classDefByStrings
import app.morphe.patcher.patch.mutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

/**
 * Replaces every `const-string` (and `const-string/jumbo`) that loads exactly [from] with [to].
 * @return The number of replaced instructions.
 */
fun replaceStringConstants(from: String, to: String): Int {
    var replaced = 0
    for (classDef in classDefByStrings(from, StringComparisonType.EQUALS)) {
        for (method in mutableClassDefBy(classDef).methods) {
            if (method.implementation == null) continue
            method.instructions.forEachIndexed { index, instruction ->
                if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) return@forEachIndexed
                if (((instruction as ReferenceInstruction).reference as StringReference).string != from) return@forEachIndexed
                val register = (instruction as OneRegisterInstruction).registerA
                val reference = ImmutableStringReference(to)
                method.replaceInstruction(
                    index,
                    if (instruction.opcode == Opcode.CONST_STRING_JUMBO) {
                        BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, register, reference)
                    } else {
                        BuilderInstruction21c(Opcode.CONST_STRING, register, reference)
                    }
                )
                replaced++
            }
        }
    }
    return replaced
}
