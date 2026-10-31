package dev.jibon.notes.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

const val FEATURES_CLASS = "Lsamsungcompat/Features;"

/** Fingerprint of a no-argument method of the extension's `Features` class. */
fun featureFingerprint(name: String) = Fingerprint(definingClass = FEATURES_CLASS, name = name, parameters = listOf())

/**
 * In every method of [classType], passes the String result of each call to [definingClass]->[methodName]
 * through the static [filter] (`Lcls;->name(Ljava/lang/String;)Ljava/lang/String;`). Returns how many.
 */
context(context: BytecodePatchContext)
fun filterCallResults(classType: String, definingClass: String, methodName: String, filter: String): Int {
    var count = 0
    context.mutableClassDefBy(classType).methods.forEach { method ->
        val instructions = method.implementation?.instructions ?: return@forEach
        // Backwards, so inserted instructions don't shift the ones still to visit.
        for (index in instructions.size - 2 downTo 0) {
            val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference ?: continue
            if (reference.definingClass != definingClass || reference.name != methodName) continue
            val next = method.getInstruction(index + 1)
            if (next.opcode != Opcode.MOVE_RESULT_OBJECT) continue
            val register = (next as OneRegisterInstruction).registerA
            method.addInstructions(
                index + 2,
                """
                    invoke-static { v$register }, $filter
                    move-result-object v$register
                """,
            )
            count++
        }
    }
    return count
}
