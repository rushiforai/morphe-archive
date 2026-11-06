package dev.jason.gboardpatches.patches.gboard.features.addsymbols

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.jason.gboardpatches.patches.gboard.shared.indexOfFirstMethodCall

internal fun MutableMethod.returnRegisterAt(index: Int): Int {
    val instructions = implementation?.instructions ?: error("No instructions available")
    return (instructions[index] as? OneRegisterInstruction)?.registerA
        ?: error("Instruction at $index does not expose registerA")
}

internal fun MutableMethod.indexOfMethodCallOrThrow(
    definingClass: String,
    name: String,
    returnType: String? = null,
    parameterTypes: List<String>? = null
): Int {
    val index = indexOfFirstMethodCall(definingClass, name, returnType, parameterTypes)
    check(index >= 0) {
        "Unable to find $definingClass->$name(${parameterTypes?.joinToString("") ?: ""})${returnType ?: ""}"
    }
    return index
}
