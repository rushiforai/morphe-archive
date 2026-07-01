package app.kareem.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

fun BytecodePatchContext.replaceStringLiterals(replacements: Map<String, String>): Int {
    var replacementCount = 0

    classDefForEach { classDef ->
        val mutableClass = mutableClassDefBy(classDef)

        mutableClass.methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach

            instructions.forEachIndexed { index, instruction ->
                if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) {
                    return@forEachIndexed
                }

                val literal =
                    ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                        ?.string
                        ?: return@forEachIndexed
                val replacement = replacements[literal] ?: return@forEachIndexed
                val register = (instruction as? OneRegisterInstruction)?.registerA ?: return@forEachIndexed
                val opcode =
                    when (instruction.opcode) {
                        Opcode.CONST_STRING_JUMBO -> "const-string/jumbo"
                        else -> "const-string"
                    }

                method.replaceInstruction(
                    index,
                    "$opcode v$register, \"${replacement.toSmaliStringLiteral()}\"",
                )
                replacementCount++
            }
        }
    }

    return replacementCount
}

private fun String.toSmaliStringLiteral(): String =
    buildString {
        for (character in this@toSmaliStringLiteral) {
            when (character) {
                '\\' -> append("\\\\")
                '"' -> append("\\\"")
                '\n' -> append("\\n")
                '\r' -> append("\\r")
                '\t' -> append("\\t")
                else -> append(character)
            }
        }
    }
