/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */

package app.morphe.patches.youtube.utils.feature

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.literal
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.indexOfFirstLiteralInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Finds an older no-argument flag getter for identifying its consumers, not for hooking the getter. */
internal fun booleanFeatureGetter(flag: Long) = Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(literal(flag)),
    custom = { method, _ ->
        val result = method.booleanFeatureResult(flag)
        val instructions = method.implementation?.instructions
        result != null && instructions != null && result + 2 == instructions.count() &&
                instructions.last().opcode == Opcode.RETURN
    },
)

/** Finds the result of the native flag call within a previously identified consumer. */
internal fun Method.booleanFeatureResult(flag: Long): Int? {
    val instructions = implementation?.instructions ?: return null
    val literalIndex = indexOfFirstLiteralInstruction(flag)
    if (literalIndex < 0) return null

    val literal = getInstruction(literalIndex)
    if (literal.opcode != Opcode.CONST_WIDE_32) return null

    val flagRegister = (literal as OneRegisterInstruction).registerA
    val callIndex = (literalIndex + 1..literalIndex + 3).firstOrNull { index ->
        instructions.elementAtOrNull(index)?.getReference<MethodReference>() != null
    } ?: return null

    val call = getInstruction(callIndex)
    val reference = call.getReference<MethodReference>() ?: return null
    if (reference.returnType != "Z") return null

    val parameters = reference.parameterTypes
    if (parameters.lastOrNull()?.toString() != "Z") return null

    val wideParameter = when {
        parameters.size == 2 && parameters[0].toString() == "J" -> 0
        parameters.size == 3 && parameters[0].toString() == "I" && parameters[1].toString() == "J" -> 1
        else -> return null
    }
    val wideArgument = when (call.opcode) {
        Opcode.INVOKE_VIRTUAL -> (call as FiveRegisterInstruction).let {
            if (wideParameter == 0) it.registerD else it.registerE
        }
        Opcode.INVOKE_VIRTUAL_RANGE -> (call as RegisterRangeInstruction).startRegister + 1 + wideParameter
        else -> return null
    }

    return (callIndex + 1).takeIf {
        wideArgument == flagRegister && instructions.elementAtOrNull(it)?.opcode == Opcode.MOVE_RESULT
    }
}

/** Finds the single result of a delegated flag getter in a specific consumer. */
internal fun Method.booleanFeatureGetterResult(getter: MethodReference): Int? {
    val instructions = implementation?.instructions ?: return null
    var resultIndex = -1
    instructions.forEachIndexed { index, instruction ->
        if (instruction.getReference<MethodReference>() == getter) {
            if (resultIndex >= 0) return null

            resultIndex = index + 1
        }
    }

    return resultIndex.takeIf { it >= 0 && instructions.elementAtOrNull(it)?.opcode == Opcode.MOVE_RESULT }
}

internal fun MutableMethod.overrideBooleanDecision(resultIndex: Int, extensionMethod: String) {
    val register = getInstruction<OneRegisterInstruction>(resultIndex).registerA

    addInstructions(
        resultIndex + 1,
        """
            invoke-static/range {v$register .. v$register}, $extensionMethod
            move-result v$register
        """,
    )
}
