package app.morphe.patches.all.screenshot

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.findMutableMethodOf
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val FLAG_SECURE = 0x2000

/** True for any invoke of Window.addFlags / Window.setFlags. */
private fun Instruction.isWindowFlagCall(): Boolean {
    val ref = getReference<MethodReference>() ?: return false
    return ref.definingClass == "Landroid/view/Window;" &&
        (ref.name == "addFlags" || ref.name == "setFlags")
}

/** Argument registers of an invoke, in order (receiver first). */
private fun argRegisters(ins: Instruction): List<Int>? = when (ins) {
    is FiveRegisterInstruction -> listOf(
        ins.registerC,
        ins.registerD,
        ins.registerE,
        ins.registerF,
        ins.registerG,
    ).take(ins.registerCount)
    is RegisterRangeInstruction ->
        (ins.startRegister until ins.startRegister + ins.registerCount).toList()
    else -> null
}

/**
 * Walks backwards from the invoke to the constant that defines [reg] and clears
 * FLAG_SECURE from it. Stops at control-flow or any other write to [reg] so we
 * only ever touch the value actually passed as the flag.
 */
private fun clearSecureBit(method: MutableMethod, invokeIndex: Int, reg: Int) {
    for (j in invokeIndex - 1 downTo 0) {
        val ins = method.getInstruction(j)
        val op = ins.opcode

        if (ins is NarrowLiteralInstruction && ins is OneRegisterInstruction && ins.registerA == reg) {
            val value = ins.narrowLiteral
            if (value and FLAG_SECURE != 0) {
                method.replaceInstruction(j, "const v$reg, ${value and FLAG_SECURE.inv()}")
            }
            return
        }

        if (op == Opcode.GOTO ||
            op == Opcode.GOTO_16 ||
            op == Opcode.GOTO_32 ||
            op == Opcode.PACKED_SWITCH ||
            op == Opcode.SPARSE_SWITCH ||
            op.name.startsWith("if-") ||
            op.name.startsWith("return")
        ) {
            return
        }

        // Some other instruction redefined this register; give up safely.
        if (ins is OneRegisterInstruction && ins.registerA == reg) return
    }
}

private fun processMethod(method: MutableMethod) {
    val callIndices = method.instructions.withIndex()
        .filter { (_, ins) -> ins.isWindowFlagCall() }
        .map { (i, _) -> i }

    for (idx in callIndices) {
        val ins = method.getInstruction(idx)
        val ref = ins.getReference<MethodReference>() ?: continue
        val regs = argRegisters(ins) ?: continue
        if (regs.size < 2) continue

        clearSecureBit(method, idx, regs[1]) // flags
        if (ref.name == "setFlags" && regs.size >= 3) {
            clearSecureBit(method, idx, regs[2]) // mask
        }
    }
}

@Suppress("unused")
val allowScreenshotsPatch = bytecodePatch(
    name = "Allow screenshots",
    description = "Clears FLAG_SECURE from window flags so the app can be captured in screenshots.",
    default = false,
) {
    execute {
        classDefForEach { classDef ->
            val mutableClass by lazy { mutableClassDefBy(classDef) }
            classDef.methods.forEach { method ->
                val impl = method.implementation ?: return@forEach
                if (impl.instructions.none { it.isWindowFlagCall() }) return@forEach
                processMethod(mutableClass.findMutableMethodOf(method))
            }
        }
    }
}
