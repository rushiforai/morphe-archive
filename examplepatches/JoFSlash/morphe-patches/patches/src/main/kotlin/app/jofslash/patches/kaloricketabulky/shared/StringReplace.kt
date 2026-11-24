package app.jofslash.patches.kaloricketabulky.shared

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

private fun Instruction.constString(): String? {
    if (opcode != Opcode.CONST_STRING && opcode != Opcode.CONST_STRING_JUMBO) return null
    return ((this as ReferenceInstruction).reference as StringReference).string
}

/**
 * Replaces every const-string in the app whose value [transform] maps to a new value.
 * [transform] returns null to keep a string.
 *
 * @return how many instructions were changed.
 */
internal fun BytecodePatchContext.replaceStrings(transform: (String) -> String?): Int {
    val targets = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        val hit = classDef.methods.any { method ->
            method.implementation?.instructions?.any { insn ->
                insn.constString()?.let(transform) != null
            } == true
        }
        if (hit) targets += classDef
    }

    var changed = 0
    targets.forEach { classDef ->
        mutableClassDefBy(classDef).methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            instructions.forEachIndexed { index, insn ->
                val value = insn.constString() ?: return@forEachIndexed
                val replacement = transform(value) ?: return@forEachIndexed
                val register = (insn as OneRegisterInstruction).registerA
                val reference = ImmutableStringReference(replacement)
                method.replaceInstruction(
                    index,
                    if (insn.opcode == Opcode.CONST_STRING) {
                        BuilderInstruction21c(Opcode.CONST_STRING, register, reference)
                    } else {
                        BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, register, reference)
                    }
                )
                changed++
            }
        }
    }
    return changed
}

/** Replaces const-strings that exactly match a key of [replacements]. */
internal fun BytecodePatchContext.replaceStrings(replacements: Map<String, String>): Int =
    replaceStrings { replacements[it] }
