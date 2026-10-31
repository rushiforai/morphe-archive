package com.sj010.gboardclipboard.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

val gboardClipboardSyncPatch = bytecodePatch(
    name = "Clipboard Foreground Sync",
    description = "Synchronize clipboard history upon input view start for Samsung, Vivo, and other OEM devices.",
) {
    compatibleWith(
        Constants.COMPATIBILITY_GBOARD,
        Constants.COMPATIBILITY_PIXELBOARD,
    )
    dependsOn(gboardClipboardCarrierPatch)

    execute {
        val mutableClass = mutableClassDefBy("Lfml;") ?: return@execute
        val method = mutableClass.methods.firstOrNull { m ->
            m.name == "ft" && m.parameterTypes.size == 5 && m.returnType == "Z"
        } ?: return@execute

        val implementation = method.implementation ?: return@execute
        val instructions = implementation.instructions

        val alreadyPatched = instructions.any { instr ->
            val ref = (instr as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lcom/sj010/gboardclipboard/extension/GboardClipboardSyncRuntime;" &&
                ref.name == "syncOnStartInputView"
        }
        if (alreadyPatched) return@execute

        val igetFIndex = instructions.indexOfFirst { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            (ref?.definingClass == "Lfml;" && ref.name == "f") ||
                (instruction.opcode == Opcode.IGET_OBJECT && ref?.name == "f")
        }
        if (igetFIndex == -1) return@execute

        val igetInstruction = instructions[igetFIndex]
        val handlerReg = if (igetInstruction is TwoRegisterInstruction) {
            "v${igetInstruction.registerA}"
        } else {
            "p4"
        }

        method.addInstructions(
            igetFIndex + 1,
            "invoke-static {$handlerReg}, Lcom/sj010/gboardclipboard/extension/GboardClipboardSyncRuntime;->syncOnStartInputView(Ljava/lang/Object;)V"
        )
    }
}
