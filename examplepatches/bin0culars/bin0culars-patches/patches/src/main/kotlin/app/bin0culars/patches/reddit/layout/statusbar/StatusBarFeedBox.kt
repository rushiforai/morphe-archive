package app.bin0culars.patches.reddit.layout.statusbar

import app.bin0culars.patches.reddit.layout.glassnav.orThrow
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal data class PaddingSite(
    val helperInvokeIndex: Int,
    val helperMoveResultIndex: Int,
    val paddingInvokeIndex: Int,
    val paddingMoveResultIndex: Int,
    val helperMethodRef: MethodReference,
    val paddingMethodRef: MethodReference,
    val paddingInstruction: FiveRegisterInstruction,
    val paddingMoveResultRegister: Int,
)

internal fun findPaddingSites(method: MutableMethod): List<PaddingSite> {
    val composerType = method.parameterTypes.getOrNull(18)?.toString()
        .orThrow("Method does not have at least 19 parameters")
    val sites = mutableListOf<PaddingSite>()
    val instructions = method.instructions

    for (i in 0 until (instructions.size - 3)) {
        if (isPaddingSiteAt(instructions, i, composerType)) {
            sites.add(createPaddingSite(instructions, i))
        }
    }

    if (sites.size < 2) {
        throw PatchException("Expected at least 2 padding helper sites, found ${sites.size}")
    }
    return sites
}

private fun isPaddingSiteAt(
    instructions: List<Instruction>,
    i: Int,
    composerType: String,
): Boolean {
    val helperOk = isHelperCall(instructions[i], composerType)
    val moveHelperOk = helperOk && instructions[i + 1].opcode == Opcode.MOVE_RESULT_OBJECT
    val paddingOk = moveHelperOk && isPaddingCall(instructions[i + 2])
    return paddingOk && instructions[i + 3].opcode == Opcode.MOVE_RESULT_OBJECT
}

private fun isHelperCall(inst: Instruction, composerType: String): Boolean {
    val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
    val isStatic = inst.opcode == Opcode.INVOKE_STATIC && ref != null
    val paramsMatch = isStatic && ref.parameterTypes.size == 1 && ref.parameterTypes[0] == composerType
    val returnMatches = ref != null && ref.returnType.startsWith("L") && ref.returnType != "V"
    return paramsMatch && returnMatches
}

private fun isPaddingRef(ref: MethodReference): Boolean {
    val sizeOk = ref.parameterTypes.size == 2
    val paramsOk = sizeOk && ref.parameterTypes[0].startsWith("L") && ref.parameterTypes[1].startsWith("L")
    val returnOk = paramsOk && ref.returnType.startsWith("L")
    return returnOk && ref.returnType == ref.parameterTypes[0]
}

private fun isPaddingCall(inst: Instruction): Boolean {
    val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
    return inst.opcode == Opcode.INVOKE_STATIC && ref != null && isPaddingRef(ref)
}

private fun createPaddingSite(
    instructions: List<Instruction>,
    i: Int,
): PaddingSite {
    val helperRef = ((instructions[i] as? ReferenceInstruction)?.reference as? MethodReference)
        .orThrow("Helper instruction lacks MethodReference")
    val paddingInst = (instructions[i + 2] as? FiveRegisterInstruction)
        .orThrow("Padding instruction is not FiveRegisterInstruction")
    val paddingRef = ((instructions[i + 2] as? ReferenceInstruction)?.reference as? MethodReference)
        .orThrow("Padding instruction lacks MethodReference")
    val moveResult = (instructions[i + 3] as? OneRegisterInstruction)
        .orThrow("Padding move-result is not OneRegisterInstruction")

    return PaddingSite(
        helperInvokeIndex = i,
        helperMoveResultIndex = i + 1,
        paddingInvokeIndex = i + 2,
        paddingMoveResultIndex = i + 3,
        helperMethodRef = helperRef,
        paddingMethodRef = paddingRef,
        paddingInstruction = paddingInst,
        paddingMoveResultRegister = moveResult.registerA,
    )
}

private fun writesRegister(inst: Instruction, reg: Int): Boolean {
    val target = when (inst) {
        is OneRegisterInstruction -> inst.registerA
        is TwoRegisterInstruction -> inst.registerA
        is ThreeRegisterInstruction -> inst.registerA
        else -> null
    } ?: return false
    return if (inst.opcode.setsWideRegister()) {
        target == reg || target + 1 == reg
    } else {
        inst.opcode.setsRegister() && target == reg
    }
}

private fun findUnpaddedMoveResult(
    method: MutableMethod,
    beforeIndex: Int,
    reg: Int,
): Int = (0 until beforeIndex).reversed().firstOrNull { i ->
    val inst = method.instructions[i]
    val isMoveResult = inst.opcode == Opcode.MOVE_RESULT_OBJECT || inst.opcode == Opcode.MOVE_RESULT
    isMoveResult && (inst as? OneRegisterInstruction)?.registerA == reg
}.orThrow("Could not find move-result for v$reg before padding call")

private fun checkRegisterNotWritten(
    method: MutableMethod,
    range: IntRange,
    reg: Int,
    hookName: String,
) {
    val writtenIdx = range.firstOrNull { i -> writesRegister(method.instructions[i], reg) }
    if (writtenIdx != null) {
        throw PatchException("v$reg is written at instruction $writtenIdx before $hookName")
    }
}

internal fun hookFeedBox(
    method: MutableMethod,
    site: PaddingSite,
) {
    val vP = site.paddingMoveResultRegister
    val vU = site.paddingInstruction.registerC
    val unpaddedIndex = findUnpaddedMoveResult(method, site.paddingInvokeIndex, vU)
    checkRegisterNotWritten(method, (unpaddedIndex + 1)..site.paddingMoveResultIndex, vU, "hook A")
    val returnType = site.paddingMethodRef.returnType
    val smali = if (vP > 15 || vU > 15) {
        if (vU != vP + 1) {
            throw PatchException("Registers v$vP and v$vU cannot be encoded")
        }
        """
            invoke-static/range { v$vP .. v$vU }, $EXTENSION_CLASS->feedBoxModifier(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$vP
            check-cast v$vP, $returnType
        """.trimIndent()
    } else {
        """
            invoke-static { v$vP, v$vU }, $EXTENSION_CLASS->feedBoxModifier(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$vP
            check-cast v$vP, $returnType
        """.trimIndent()
    }
    method.addInstructions(site.paddingMoveResultIndex + 1, smali)
}
