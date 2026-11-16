/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.all.display

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.all.shared.isControlFlow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

private fun argRegisters(ins: Instruction): List<Int>? = when (ins) {
    is FiveRegisterInstruction -> listOf(
        ins.registerC,
        ins.registerD,
        ins.registerE,
        ins.registerF,
        ins.registerG,
    ).take(ins.registerCount)

    is RegisterRangeInstruction -> (
        ins.startRegister until ins.startRegister + ins.registerCount
        ).toList()

    else -> null
}

private fun floatLiteral(hz: Int): String {
    val bits = java.lang.Float.floatToIntBits(hz.toFloat())
    return "0x%08x".format(bits)
}

private fun forceFloatArg(
    method: MutableMethod,
    invokeIndex: Int,
    reg: Int,
    literal: String,
): Boolean {
    val impl = method.implementation ?: return false

    // Only rewrite v-registers, never p-registers.
    val paramRegs = method.parameterTypes.size + 1
    val maxVReg = impl.registerCount - paramRegs
    if (reg >= maxVReg) return false

    for (j in invokeIndex - 1 downTo 0) {
        val ins = method.getInstruction(j)

        if (isControlFlow(ins.opcode)) return false

        if (ins is OneRegisterInstruction && ins.registerA == reg) {
            when (ins.opcode) {
                Opcode.CONST_HIGH16,
                Opcode.CONST_4,
                Opcode.CONST_16,
                Opcode.CONST,
                Opcode.MOVE_RESULT,
                -> {
                    method.replaceInstruction(j, "const v$reg, $literal")
                    return true
                }

                else -> return false
            }
        }
    }

    return false
}

@Suppress("unused")
val forceRefreshRatePatch = patch(
    name = "Force refresh rate",
    description = "Rewrites the float argument at Surface.setFrameRate() call sites to the " +
        "selected refresh rate. This only affects apps that already request a frame rate; " +
        "it does not globally force a display mode. Missing call sites are skipped safely.",
    default = false,
) {
    val targetHz = stringOption(
        key = "targetHz",
        default = "120",
        values = mapOf(
            "120" to "120",
            "90" to "90",
            "60" to "60",
        ),
        title = "Target refresh rate",
        description = "Hz value to inject into Surface.setFrameRate() calls.",
        required = true,
    ) {
        it != null && it.toIntOrNull()?.let { h -> h in 24..360 } == true
    }

    val patchSurface by booleanOption(
        key = "patchSurface",
        default = true,
        title = "Patch Surface.setFrameRate()",
        description = "Rewrites float args at Surface.setFrameRate() call sites.",
    )

    execute {
        val hz = targetHz.value?.toIntOrNull() ?: 120
        val literal = floatLiteral(hz)

        if (patchSurface == true) {
            listOf(
                "Landroid/view/Surface;->setFrameRate(FI)V",
                "Landroid/view/Surface;->setFrameRate(FZ)V",
            ).forEach { target ->
                methodCall(target)
                    .matchAllMethodIndicesForEach(requireMatches = false) { index ->
                        val regs = argRegisters(getInstruction(index))
                            ?: return@matchAllMethodIndicesForEach

                        if (regs.size >= 3) {
                            forceFloatArg(this, index, regs[1], literal)
                        }
                    }
            }
        }
    }
}
