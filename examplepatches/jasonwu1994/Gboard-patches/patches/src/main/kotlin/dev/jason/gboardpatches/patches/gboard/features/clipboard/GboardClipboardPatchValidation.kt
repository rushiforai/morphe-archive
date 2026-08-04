package dev.jason.gboardpatches.patches.gboard.features.clipboard

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import dev.jason.gboardpatches.patches.gboard.shared.gboardStructuralFingerprint
import dev.jason.gboardpatches.patches.gboard.shared.isInvoke
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReferenceInClass

internal fun MutableMethod.requireExactClipboardTarget(
    owner: String,
    methodName: String,
    methodReturnType: String,
    methodParameterTypes: List<String>,
) {
    check(
        definingClass == owner &&
            name == methodName &&
            returnType == methodReturnType &&
            parameterTypes == methodParameterTypes,
    ) {
        "Refusing non-target Clipboard method $definingClass->$name" +
            "(${parameterTypes.joinToString("")})$returnType"
    }
}

internal fun MutableMethod.p0Register(): Int {
    val implementation = implementation ?: error("No instructions in $definingClass->$name")
    return implementation.registerCount - parameterTypes.size - 1
}

internal fun Instruction.isExactRangeInvoke(
    descriptor: String,
    startRegister: Int,
    registerCount: Int,
): Boolean =
    isInvoke(
        "INVOKE_STATIC_RANGE",
        descriptor,
        *(startRegister until startRegister + registerCount).toList().toIntArray(),
    )

internal fun Iterable<Instruction>.clipboardRuntimeReferenceCount(): Int = count {
    it.isMethodReferenceInClass(CLIPBOARD_RUNTIME_CLASS)
}

internal fun MutableMethod.clipboardStructuralFingerprint(): String =
    gboardStructuralFingerprint()

internal fun List<Instruction>.hasExactBranchTarget(
    branchIndex: Int,
    targetIndex: Int,
): Boolean {
    val branch = getOrNull(branchIndex) as? OffsetInstruction ?: return false
    if (targetIndex !in indices) return false
    return codeAddressOf(branchIndex) + branch.codeOffset == codeAddressOf(targetIndex)
}

private fun List<Instruction>.codeAddressOf(index: Int): Int =
    take(index).sumOf { instruction -> instruction.codeUnits }
