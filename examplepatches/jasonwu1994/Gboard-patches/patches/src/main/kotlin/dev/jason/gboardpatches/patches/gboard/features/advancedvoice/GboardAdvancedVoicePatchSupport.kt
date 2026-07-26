package dev.jason.gboardpatches.patches.gboard.features.advancedvoice

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jason.gboardpatches.patches.gboard.shared.gboardStructuralFingerprint
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices

internal const val ADVANCED_VOICE_RUNTIME_CLASS =
    "Ldev/jason/gboardpatches/extension/advancedvoice/GboardAdvancedVoice1777Runtime;"
internal const val ADVANCED_VOICE_RESULT_TOKEN = "__RESULT__"

internal inline fun MutableMethod.applyAdvancedVoiceFingerprintGuard(
    descriptor: String,
    runtimeDescriptor: String,
    stockFingerprint: String,
    patchedFingerprint: String,
    inject: () -> Unit,
) {
    val delegateCount = implementation!!.instructions.count {
        it.methodDescriptor() == runtimeDescriptor
    }
    if (delegateCount != 0) {
        val actual = gboardStructuralFingerprint()
        check(actual == patchedFingerprint) {
            "Malformed Advanced Voice delegate state in $descriptor: $actual"
        }
        return
    }
    val actual = gboardStructuralFingerprint()
    check(actual == stockFingerprint) { "Stock body drift in $descriptor: $actual" }
    inject()
    val patched = gboardStructuralFingerprint()
    check(patched == patchedFingerprint) {
        "Unexpected Advanced Voice patched shape in $descriptor: $patched"
    }
}

internal fun MutableMethod.injectAdvancedVoiceResultDelegate(
    descriptor: String,
    template: String,
) {
    val instructions = implementation?.instructions
        ?: error("Advanced Voice target has no implementation")
    val returns = returnInstructionIndices()
    check(returns.isNotEmpty()) { "Advanced Voice target has no return instructions" }
    val existing = instructions.count { it.methodDescriptor() == descriptor }
    check(existing == 0 || existing == returns.size) {
        "Partial or duplicate Advanced Voice result delegates for $descriptor"
    }
    if (existing != 0) {
        return
    }
    returns.asReversed().forEach { returnIndex ->
        val register = (implementation!!.instructions[returnIndex] as? OneRegisterInstruction)
            ?.registerA
            ?: error("Advanced Voice result return has no register")
        addInstructions(
            returnIndex,
            template.replace(ADVANCED_VOICE_RESULT_TOKEN, register.toString()),
        )
    }
}

internal fun MutableMethod.injectAdvancedVoiceBeforeReturns(
    descriptor: String,
    delegate: String,
) {
    val instructions = implementation?.instructions
        ?: error("Advanced Voice target has no implementation")
    val returns = returnInstructionIndices()
    check(returns.isNotEmpty()) { "Advanced Voice target has no return instructions" }
    val existing = instructions.count { it.methodDescriptor() == descriptor }
    check(existing == 0 || existing == returns.size) {
        "Partial or duplicate Advanced Voice return delegates for $descriptor"
    }
    if (existing != 0) {
        return
    }
    returns.asReversed().forEach { returnIndex ->
        addInstructions(returnIndex, delegate)
    }
}

internal fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.methodDescriptor(): String? =
    ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()
