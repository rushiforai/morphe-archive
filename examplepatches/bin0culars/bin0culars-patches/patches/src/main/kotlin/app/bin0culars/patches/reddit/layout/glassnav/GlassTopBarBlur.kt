package app.bin0culars.patches.reddit.layout.glassnav

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val HEADER_BLUR_EXTENSION_CLASS = "Lapp/bin0culars/extension/reddit/GlassHeaderBlur;"

private fun isTopBarCallShape(inst: Instruction, modifierType: String): Boolean {
    val isStatic = inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE
    val ref = ((inst as? ReferenceInstruction)?.reference as? MethodReference)
        ?.takeIf { isStatic }
        ?: return false
    val p = ref.parameterTypes.map { it.toString() }
    val headOk = p.size >= 4 && p[0] == modifierType && p[1] == "Lkotlin/jvm/functions/Function0;"
    return headOk && p[2] == "Landroidx/compose/runtime/internal/a;" && p[3] == "Landroidx/compose/runtime/internal/a;"
}

internal fun hookHeaderBlur(sites: HomeScreenTopBarSites) {
    val method = sites.method
    val instructions = method.instructions
    val modifierType = sites.graphicsLayerRef.parameterTypes[0].toString()
    val topBarCallIndex = ((sites.bgIndex + 1) until instructions.size)
        .firstOrNull { isTopBarCallShape(instructions[it], modifierType) }
        .orThrow("Could not find top-bar call after bgIndex")
    val targetSmali = sites.graphicsLayerRef.toSmali()
    val index = ((sites.bgIndex + 1) until topBarCallIndex)
        .firstOrNull { i ->
            val inst = instructions[i]
            val isStatic = inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE
            val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
            isStatic && ref?.toSmali() == targetSmali
        }
        .orThrow("Could not find graphicsLayer call between bgIndex and top-bar call")

    val inst = instructions[index]
    val ref = (inst as ReferenceInstruction).reference as MethodReference
    val vM = when (inst) {
        is RegisterRangeInstruction -> inst.startRegister
        is FiveRegisterInstruction -> inst.registerC
        else -> throw PatchException("graphicsLayer call at $index is neither RegisterRange nor FiveRegister")
    }
    val origSmali = invokeToSmali(inst, ref)
    val hookInvoke = if (vM > 15) {
        "invoke-static/range { v$vM .. v$vM }, $HEADER_BLUR_EXTENSION_CLASS->headerModifier(Ljava/lang/Object;)Ljava/lang/Object;"
    } else {
        "invoke-static { v$vM }, $HEADER_BLUR_EXTENSION_CLASS->headerModifier(Ljava/lang/Object;)Ljava/lang/Object;"
    }
    // Use replaceInstruction so any branch label targeting graphicsLayer stays on our hook.
    method.replaceInstruction(index, hookInvoke)
    method.addInstructions(
        index + 1,
        """
            move-result-object v$vM
            check-cast v$vM, $modifierType
            $origSmali
        """.trimIndent(),
    )
}
