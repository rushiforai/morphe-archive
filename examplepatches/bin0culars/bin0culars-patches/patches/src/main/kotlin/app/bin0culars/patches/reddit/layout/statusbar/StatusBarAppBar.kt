package app.bin0culars.patches.reddit.layout.statusbar

import app.bin0culars.patches.reddit.layout.glassnav.orThrow
import app.bin0culars.patches.reddit.layout.glassnav.toSmali
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal fun hookAppBarBody(
    method: MutableMethod,
    site2: PaddingSite,
) {
    val modifierType = site2.paddingMethodRef.returnType
    val glIndex = findGraphicsLayerIndex(method, site2.paddingMoveResultIndex + 1, modifierType)
    val (mrIndex, vG) = findGraphicsLayerMoveResult(method, glIndex)
    val smali = if (vG > 15) {
        """
            invoke-static/range { v$vG .. v$vG }, $EXTENSION_CLASS->appBarBody(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$vG
            check-cast v$vG, $modifierType
        """.trimIndent()
    } else {
        """
            invoke-static { v$vG }, $EXTENSION_CLASS->appBarBody(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$vG
            check-cast v$vG, $modifierType
        """.trimIndent()
    }
    method.addInstructions(mrIndex + 1, smali)
}

private fun isGraphicsLayerRef(ref: MethodReference, modifierType: String): Boolean {
    if (ref.parameterTypes.size < 6) return false
    val modOk = ref.parameterTypes[0] == modifierType && ref.returnType == modifierType
    val floats1to3 = ref.parameterTypes[1] == "F" && ref.parameterTypes[2] == "F" && ref.parameterTypes[3] == "F"
    val floats4to5 = ref.parameterTypes[4] == "F" && ref.parameterTypes[5] == "F"
    return modOk && floats1to3 && floats4to5
}

private fun isGraphicsLayerInstruction(inst: Instruction, modifierType: String): Boolean {
    val isStatic = inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE
    val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
    return isStatic && ref != null && isGraphicsLayerRef(ref, modifierType)
}

private fun findGraphicsLayerIndex(
    method: MutableMethod,
    startIndex: Int,
    modifierType: String,
): Int = (startIndex until method.instructions.size).firstOrNull { i ->
    isGraphicsLayerInstruction(method.instructions[i], modifierType)
}.orThrow("Could not find graphicsLayer invoke after site 2 padding move-result")

private fun findGraphicsLayerMoveResult(
    method: MutableMethod,
    invokeIndex: Int,
): Pair<Int, Int> {
    val mrIndex = invokeIndex + 1
    val mrInst = method.instructions.getOrNull(mrIndex)
        .orThrow("Missing instruction after graphicsLayer invoke")
    if (mrInst.opcode != Opcode.MOVE_RESULT_OBJECT) {
        throw PatchException("Expected MOVE_RESULT_OBJECT after graphicsLayer invoke, found ${mrInst.opcode}")
    }
    val reg = (mrInst as? OneRegisterInstruction)?.registerA
        .orThrow("graphicsLayer move-result is not OneRegisterInstruction")
    return mrIndex to reg
}

private fun isBackgroundRef(ref: MethodReference): Boolean {
    val sizeOk = ref.parameterTypes.size == 3
    val paramsOk = sizeOk && ref.parameterTypes[0].startsWith("L") && ref.parameterTypes[1] == "J" &&
        ref.parameterTypes[2].startsWith("L")
    val returnOk = paramsOk && ref.returnType.startsWith("L")
    return returnOk && ref.returnType == ref.parameterTypes[0]
}

private fun findBackgroundIndex(
    method: MutableMethod,
    beforeIndex: Int,
): Int = (0 until beforeIndex).reversed().firstOrNull { i ->
    val op = method.instructions[i].opcode
    op == Opcode.INVOKE_STATIC || op == Opcode.INVOKE_STATIC_RANGE
}.orThrow("Could not find background invoke before site 2 helper call")

internal fun hookAppBarColor(
    method: MutableMethod,
    site2: PaddingSite,
) {
    val bgIndex = findBackgroundIndex(method, site2.helperInvokeIndex)
    val bgInst = method.instructions[bgIndex]
    val bgRef = ((bgInst as? ReferenceInstruction)?.reference as? MethodReference)
        .orThrow("Background instruction lacks MethodReference")
    if (!isBackgroundRef(bgRef)) {
        throw PatchException("Background call reference does not match (L;JL;)L: $bgRef")
    }
    val bgFiveReg = bgInst as? FiveRegisterInstruction
    val bgRangeReg = bgInst as? RegisterRangeInstruction
    val vM: Int
    val vC: Int
    val vC1: Int
    val vS: Int
    if (bgFiveReg != null) {
        vM = bgFiveReg.registerC
        vC = bgFiveReg.registerD
        vC1 = bgFiveReg.registerE
        vS = bgFiveReg.registerF
    } else if (bgRangeReg != null) {
        vM = bgRangeReg.startRegister
        vC = vM + 1
        vC1 = vM + 2
        vS = vM + 3
    } else {
        throw PatchException("Background call is neither FiveRegister nor RegisterRange")
    }

    val origBgSmali = if (bgRangeReg != null) {
        "invoke-static/range { v$vM .. v$vS }, ${bgRef.toSmali()}"
    } else {
        "invoke-static { v$vM, v$vC, v$vC1, v$vS }, ${bgRef.toSmali()}"
    }
    val hookSmali = if (vC > 15 || vC1 > 15) {
        """
            invoke-static/range { v$vC .. v$vC1 }, $EXTENSION_CLASS->appBarColor(J)J
        """.trimIndent()
    } else {
        """
            invoke-static { v$vC, v$vC1 }, $EXTENSION_CLASS->appBarColor(J)J
        """.trimIndent()
    }
    method.replaceInstruction(bgIndex, hookSmali)
    method.addInstructions(
        bgIndex + 1,
        """
            move-result-wide v$vC
            $origBgSmali
        """.trimIndent(),
    )
}
