package app.bin0culars.patches.reddit.layout.glassnav

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal data class ThemeRefs(
    val localFieldRef: String,
    val composerGetRef: String,
    val themeType: String,
    val colorsFieldRef: String,
    val bgColorRef: String,
    val composerType: String,
)

internal fun MethodReference.toSmali(): String =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

internal fun FieldReference.toSmali(): String =
    "$definingClass->$name:$type"

internal fun fillPlaceholders(scopeRefs: ScopeRefs, paddingRef: MethodReference) {
    fillBridge(
        "drawRoundRect",
        """
            check-cast p0, ${scopeRefs.drawScopeType}
            check-cast p9, ${scopeRefs.styleType}
            invoke-static/range { p0 .. p11 }, ${scopeRefs.drawRoundRectRef}
            return-void
        """,
    )
    fillBridge(
        "drawScopeSize",
        """
            check-cast p0, ${scopeRefs.drawScopeType}
            invoke-interface { p0 }, ${scopeRefs.sizeRef}
            move-result-wide v0
            return-wide v0
        """,
    )
    fillBridge(
        "drawContent",
        """
            check-cast p0, ${scopeRefs.contentDrawScopeType}
            invoke-virtual { p0 }, ${scopeRefs.drawContentRef}
            return-void
        """,
    )
    val modifierType = paddingRef.returnType
    fillBridge(
        "padding",
        """
            check-cast p0, $modifierType
            invoke-static/range { p0 .. p5 }, ${paddingRef.toSmali()}
            move-result-object p0
            return-object p0
        """,
    )
}

private fun checkOpcode(inst: Instruction, expected: Opcode, step: String) {
    if (inst.opcode != expected) {
        throw PatchException("Expected $expected for $step, found ${inst.opcode}")
    }
}

private fun findBgColorInvoke(
    method: MutableMethod,
    surfaceIndex: Int,
): Pair<Int, MethodReference> {
    val idx = (0 until surfaceIndex).reversed().firstOrNull { i ->
        val inst = method.instructions[i]
        val isInvokeVirtual = inst.opcode == Opcode.INVOKE_VIRTUAL
        val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
        val matchesParams = ref != null && ref.parameterTypes.isEmpty() && ref.returnType == "J"
        isInvokeVirtual && matchesParams
    }.orThrow("Could not find bgColorRef invoke-virtual before surfaceIndex")
    val ref = ((method.instructions[idx] as? ReferenceInstruction)?.reference as? MethodReference)
        .orThrow("Instruction at $idx lacks MethodReference")
    return idx to ref
}

private fun findLocalFieldRef(
    method: MutableMethod,
    composerGetIdx: Int,
    localReg: Int,
): FieldReference {
    val sgetIdx = (0 until composerGetIdx).reversed().firstOrNull { i ->
        val inst = method.instructions[i]
        val isSget = inst.opcode == Opcode.SGET_OBJECT
        val matchesReg = (inst as? OneRegisterInstruction)?.registerA == localReg
        isSget && matchesReg
    }.orThrow("Could not find sget-object writing local register v$localReg")
    return ((method.instructions[sgetIdx] as? ReferenceInstruction)?.reference as? FieldReference)
        .orThrow("sget-object at $sgetIdx lacks FieldReference")
}

internal fun findThemeRefs(
    method: MutableMethod,
    surfaceIndex: Int,
): ThemeRefs {
    val (bgInvokeIdx, bgColorRef) = findBgColorInvoke(method, surfaceIndex)

    val igetInst = method.instructions.getOrNull(bgInvokeIdx - 1)
        .orThrow("Missing iget-object instruction before bgColorRef")
    checkOpcode(igetInst, Opcode.IGET_OBJECT, "colorsFieldRef")
    val colorsFieldRef = ((igetInst as? ReferenceInstruction)?.reference as? FieldReference)
        .orThrow("iget-object instruction lacks FieldReference")

    val checkCastInst = method.instructions.getOrNull(bgInvokeIdx - 2)
        .orThrow("Missing check-cast instruction before iget-object")
    checkOpcode(checkCastInst, Opcode.CHECK_CAST, "themeType")
    val themeType = ((checkCastInst as? ReferenceInstruction)?.reference as? TypeReference)?.type
        .orThrow("check-cast instruction lacks TypeReference")

    val moveResultInst = method.instructions.getOrNull(bgInvokeIdx - 3)
        .orThrow("Missing move-result-object instruction before check-cast")
    checkOpcode(moveResultInst, Opcode.MOVE_RESULT_OBJECT, "theme move-result")

    val composerGetIdx = bgInvokeIdx - 4
    val composerGetInst = method.instructions.getOrNull(composerGetIdx)
        .orThrow("Missing composerGet instruction before move-result-object")
    checkOpcode(composerGetInst, Opcode.INVOKE_VIRTUAL, "composerGet")
    val composerGetRef = ((composerGetInst as? ReferenceInstruction)?.reference as? MethodReference)
        .orThrow("composerGet instruction lacks MethodReference")
    val localReg = (composerGetInst as? FiveRegisterInstruction)?.registerD
        ?: composerGetInst.registersUsed.getOrNull(1)
            .orThrow("Could not find local register in composerGetRef")

    val localFieldRef = findLocalFieldRef(method, composerGetIdx, localReg)

    return ThemeRefs(
        localFieldRef = localFieldRef.toSmali(),
        composerGetRef = composerGetRef.toSmali(),
        themeType = themeType,
        colorsFieldRef = colorsFieldRef.toSmali(),
        bgColorRef = bgColorRef.toSmali(),
        composerType = composerGetRef.definingClass,
    )
}

internal fun fillBridge(name: String, smali: String, extensionClass: String = EXTENSION_CLASS) {
    val method = Fingerprint(definingClass = extensionClass, name = name).method
    for (i in method.instructions.indices.reversed()) {
        method.removeInstruction(i)
    }
    method.addInstructions(0, smali.trimIndent())
}

internal fun isObjectReturningCall(ref: MethodReference, secondParam: String): Boolean {
    val correctParamCount = ref.parameterTypes.size == 2
    val correctParams = correctParamCount &&
        ref.parameterTypes[0].startsWith("L") &&
        ref.parameterTypes[1] == secondParam
    val correctReturnType = ref.returnType.startsWith("L") && ref.returnType != "V"
    return correctParams && correctReturnType
}
