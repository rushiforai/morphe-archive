package app.bin0culars.patches.reddit.layout.glassnav

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private fun isPaddingCall(inst: Instruction): MethodReference? {
    val ref = ((inst as? ReferenceInstruction)?.reference as? MethodReference)
        ?.takeIf { inst.opcode == Opcode.INVOKE_STATIC_RANGE }
    val p = ref?.parameterTypes?.map { it.toString() }
    val matches = p != null && p.size == 6 && p[0].startsWith("L") &&
        p.subList(1, 5).all { it == "F" } && p[5] == "I" && ref.returnType == p[0]
    return if (matches) ref else null
}

internal fun findPaddingRef(): MethodReference {
    val method = SideNavRailContentFingerprint.method
    val literalIndex = SideNavRailContentFingerprint.instructionMatches.first().index
    return ((literalIndex + 1) until method.instructions.size).firstNotNullOfOrNull { i ->
        isPaddingCall(method.instructions[i])
    }.orThrow("Could not find padding helper method reference")
}

internal fun hookBarModifier(
    method: MutableMethod,
    bottomNavIndex: Int,
) {
    val (surfaceIndex, surfaceInst) = findSurfaceCall(method, bottomNavIndex)
    val vM = surfaceInst.startRegister
    val ref = ((surfaceInst as? ReferenceInstruction)?.reference as? MethodReference)
        .orThrow("Surface call is not a MethodReference")
    val modifierType = ref.parameterTypes.firstOrNull()
        .orThrow("Surface call has no parameters")

    val smali = """
        invoke-static/range { v$vM .. v$vM }, $EXTENSION_CLASS->barModifier(Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object v$vM
        check-cast v$vM, $modifierType
    """.trimIndent()
    method.addInstructions(surfaceIndex, smali)
}
