package app.bin0culars.patches.reddit.layout.glassnav

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private fun isShowLabelGet(inst: Instruction, itemType: String): Boolean =
    inst.opcode == Opcode.IGET_BOOLEAN &&
        ((inst as? ReferenceInstruction)?.reference as? FieldReference)
            ?.let { it.definingClass == itemType && it.type == "Z" } == true

private fun hookButtonMethod(method: MutableMethod) {
    val itemType = method.parameterTypes.first().toString()
    val indices = method.instructions.indices.filter { isShowLabelGet(method.instructions[it], itemType) }
    if (indices.isEmpty()) {
        throw PatchException("No IGET_BOOLEAN on $itemType found in ${method.name}")
    }
    for (index in indices.reversed()) {
        val vA = (method.instructions[index] as? OneRegisterInstruction)?.registerA
            .orThrow("Could not read register from IGET_BOOLEAN at $index")
        if (vA > 15) {
            throw PatchException("Register out of range for non-range invoke: v$vA")
        }
        method.addInstructions(
            index + 1,
            """
                invoke-static { v$vA }, $EXTENSION_CLASS->showLabel(Z)Z
                move-result v$vA
            """.trimIndent(),
        )
    }
}

internal fun hookNavLabels() {
    val buttonClass = BottomNavButtonFingerprint.classDef
    val targets = buttonClass.methods.filter { it.implementation != null && isBottomNavButtonMethod(it) }
    if (targets.isEmpty()) {
        throw PatchException("No bottom nav button methods found in ${buttonClass.type}")
    }
    targets.forEach(::hookButtonMethod)
}
