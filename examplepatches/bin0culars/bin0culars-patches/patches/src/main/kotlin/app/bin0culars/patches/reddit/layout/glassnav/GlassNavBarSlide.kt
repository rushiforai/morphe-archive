package app.bin0culars.patches.reddit.layout.glassnav

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private fun isFloatClampCall(inst: Instruction): Boolean =
    inst.opcode == Opcode.INVOKE_STATIC &&
        ((inst as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
            ref.parameterTypes.size == 3 && ref.parameterTypes.all { it.toString() == "F" } && ref.returnType == "F"
        } == true

internal fun hookBarSlide() {
    val method = BottomBarSlideOffsetFingerprint.method
    val maxIndex = BottomBarSlideOffsetFingerprint.instructionMatches[1].index
    val moveResultInst = method.instructions.getOrNull(maxIndex + 1)
        .orThrow("Missing instruction after Math.max call")
    if (moveResultInst.opcode != Opcode.MOVE_RESULT) {
        throw PatchException("Expected MOVE_RESULT after Math.max call, found ${moveResultInst.opcode}")
    }
    val vR = (moveResultInst as? OneRegisterInstruction)?.registerA
        .orThrow("Could not get register from MOVE_RESULT")

    val preMax = method.instructions.subList(0, maxIndex)
    val vF = (preMax.lastOrNull { it.opcode == Opcode.INT_TO_FLOAT } as? TwoRegisterInstruction)?.registerA
        .orThrow("Could not find INT_TO_FLOAT before Math.max")
    val clampInst = preMax.lastOrNull(::isFloatClampCall)
        .orThrow("Could not find (FFF)F clamp call before Math.max")
    val vX = clampInst.registersUsed.firstOrNull()
        .orThrow("Could not get first register of clamp call")

    if (vR > 15 || vF > 15 || vX > 15) {
        throw PatchException("Registers out of range for non-range invoke: vR=$vR, vF=$vF, vX=$vX")
    }

    method.addInstructions(
        maxIndex + 2,
        """
            invoke-static { v$vR, v$vF, v$vX }, $BLUR_EXTENSION_CLASS->adjustBarLift(IFF)I
            move-result v$vR
        """.trimIndent(),
    )

    hookBarSlidePlace()
}

private fun hookBarSlidePlace() {
    val method = BottomBarSlidePlaceFingerprint.methodOrNull ?: return
    val matches = BottomBarSlidePlaceFingerprint.instructionMatches
    val igetIndex = matches[3].index
    val mulIndex = matches[5].index

    val igetInst = method.instructions.getOrNull(igetIndex)
        .orThrow("Missing IGET instruction in slide place lambda")
    val heightField = (igetInst as? ReferenceInstruction)?.reference
        .orThrow("Could not get height field reference from IGET")
    val vO = (igetInst as? TwoRegisterInstruction)?.registerB
        .orThrow("Could not get object register from IGET")

    val roundInst = method.instructions.getOrNull(mulIndex + 1)
        .orThrow("Missing round call after MUL_FLOAT_2ADDR")
    val vS = roundInst.registersUsed.firstOrNull()
        .orThrow("Could not get register from round call")

    val moveResultInst = method.instructions.getOrNull(mulIndex + 2)
        .orThrow("Missing instruction after round call")
    if (moveResultInst.opcode != Opcode.MOVE_RESULT) {
        throw PatchException("Expected MOVE_RESULT after round call, found ${moveResultInst.opcode}")
    }
    val vY = (moveResultInst as? OneRegisterInstruction)?.registerA
        .orThrow("Could not get register from MOVE_RESULT")

    if (vO > 15 || vS > 15 || vY > 15) {
        throw PatchException("Registers out of range for non-range invoke: vO=$vO, vS=$vS, vY=$vY")
    }

    method.addInstructions(
        mulIndex + 3,
        """
            iget v$vS, v$vO, $heightField
            invoke-static { v$vY, v$vS }, $BLUR_EXTENSION_CLASS->adjustBarY(II)I
            move-result v$vY
        """.trimIndent(),
    )
}
