package app.bin0culars.patches.reddit.layout.glassnav

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private fun isGraphicsLayerCall(inst: Instruction): Boolean {
    val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
    val isTarget = ref != null &&
        ref.definingClass == "Landroidx/compose/ui/graphics/d;" &&
        ref.name == "a"
    val params = ref?.parameterTypes
    val matchesParams = params != null &&
        params.size == 2 &&
        params[1].toString() == "Lkotlin/jvm/functions/Function1;"
    return inst.opcode == Opcode.INVOKE_STATIC && isTarget && matchesParams
}

private fun isBackgroundCall(inst: Instruction): Boolean {
    val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference
    val params = ref?.parameterTypes
    val hasThreeParams = params != null && params.size == 3
    val matchesParamTypes = hasThreeParams &&
        params[0].toString().startsWith("L") &&
        params[1].toString() == "J" &&
        params[2].toString().startsWith("L")
    val matchesReturn = matchesParamTypes && ref?.returnType == params[0].toString()
    return inst.opcode == Opcode.INVOKE_STATIC && matchesReturn
}

internal fun collectBackdropHits(
    mutableClass: MutableClass,
    hits: MutableList<Pair<MutableMethod, Int>>,
) {
    mutableClass.methods.filter { it.implementation != null }.forEach { method ->
        val instructions = method.instructions
        instructions.indices.filter { isGraphicsLayerCall(instructions[it]) }.forEach { i ->
            (i - 1 downTo maxOf(0, i - 20)).firstOrNull { isBackgroundCall(instructions[it]) }
                ?.let { hits.add(method to it) }
        }
    }
}
