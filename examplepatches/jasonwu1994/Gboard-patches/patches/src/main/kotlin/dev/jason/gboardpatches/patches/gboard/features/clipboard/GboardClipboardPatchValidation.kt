package dev.jason.gboardpatches.patches.gboard.features.clipboard

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jason.gboardpatches.patches.gboard.shared.gboardStructuralFingerprint

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

internal fun Instruction.methodDescriptor(): String? =
    ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()

internal fun Instruction.isExactRangeInvoke(
    descriptor: String,
    startRegister: Int,
    registerCount: Int,
): Boolean =
    normalizedOpcode() == "INVOKE_STATIC_RANGE" &&
        methodDescriptor() == descriptor &&
        this is RegisterRangeInstruction &&
        startRegister == this.startRegister &&
        registerCount == this.registerCount

internal fun Instruction.normalizedOpcode(): String =
    opcode.name.uppercase().replace('-', '_').replace('/', '_')

internal fun Iterable<Instruction>.clipboardRuntimeReferenceCount(): Int = count {
    it.methodDescriptor()?.startsWith("$CLIPBOARD_RUNTIME_CLASS->") == true
}

internal fun MutableMethod.clipboardStructuralFingerprint(): String =
    gboardStructuralFingerprint()
