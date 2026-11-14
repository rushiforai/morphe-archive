package app.morphe.patches.all.screenrecording

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.findMutableMethodOf
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.all.screenshot.allowScreenshotsPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private fun Instruction.isSetSecureCall(): Boolean {
    val ref = getReference<MethodReference>() ?: return false
    return ref.definingClass == "Landroid/view/SurfaceView;" && ref.name == "setSecure"
}

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

/** Backward-scan to the constant defining [reg] and force it to false. */
private fun forceFalse(method: MutableMethod, invokeIndex: Int, reg: Int) {
    for (j in invokeIndex - 1 downTo 0) {
        val ins = method.getInstruction(j)
        val op = ins.opcode
        if (ins is NarrowLiteralInstruction && ins is OneRegisterInstruction && ins.registerA == reg) {
            if (ins.narrowLiteral != 0) method.replaceInstruction(j, "const/4 v$reg, 0x0")
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
        if (ins is OneRegisterInstruction && ins.registerA == reg) return
    }
}

@Suppress("unused")
val allowScreenRecordingPatch = bytecodePatch(
    name = "Allow screen recording",
    description = "Clears FLAG_SECURE and disables secure surfaces so the app can be screen-recorded.",
    default = false,
) {
    dependsOn(allowScreenshotsPatch)

    execute {
        classDefForEach { classDef ->
            val mutableClass by lazy { mutableClassDefBy(classDef) }
            classDef.methods.forEach { method ->
                val impl = method.implementation ?: return@forEach
                if (impl.instructions.none { it.isSetSecureCall() }) return@forEach
                val mm = mutableClass.findMutableMethodOf(method)
                val idxs = mm.instructions.withIndex()
                    .filter { it.value.isSetSecureCall() }.map { it.index }
                for (idx in idxs) {
                    val regs = argRegisters(mm.getInstruction(idx)) ?: continue
                    if (regs.size >= 2) forceFalse(mm, idx, regs[1])
                }
            }
        }
    }
}
