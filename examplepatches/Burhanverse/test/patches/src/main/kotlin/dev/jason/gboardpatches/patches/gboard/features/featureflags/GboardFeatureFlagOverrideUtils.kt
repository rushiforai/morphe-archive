package dev.jason.gboardpatches.patches.gboard.features.featureflags

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices

internal const val FEATURE_FLAG_RECEIVER_REGISTER = 1
internal const val RESULT_REGISTER_TOKEN = "__RESULT_REGISTER__"
internal const val FEATURE_FLAG_OVERRIDE_SHAPE_SHARED = 0
internal const val FEATURE_FLAG_OVERRIDE_SHAPE_WRITING_TOOLS = 1

internal fun MutableMethod.ensureFeatureFlagReceiverPreserved(insertIfMissing: Boolean = true) {
    check(parameterTypes.isEmpty()) { "Feature flag receiver preservation requires neg.g()" }

    val implementation = implementation ?: error("No instructions available in neg.g")
    val receiverRegister = implementation.registerCount - 1
    check(FEATURE_FLAG_RECEIVER_REGISTER < receiverRegister) {
        "neg.g does not expose v$FEATURE_FLAG_RECEIVER_REGISTER for receiver preservation"
    }

    val preserveMoveIndices = implementation.instructions.indices.filter { index ->
        val instruction = implementation.instructions[index]
        instruction.opcode.name.normalized() == "MOVE_OBJECT" &&
            instruction is TwoRegisterInstruction &&
            instruction.registerA == FEATURE_FLAG_RECEIVER_REGISTER &&
            instruction.registerB == receiverRegister
    }
    when {
        preserveMoveIndices == listOf(0) -> return
        preserveMoveIndices.isEmpty() && insertIfMissing -> {
            addInstructions(0, "move-object v$FEATURE_FLAG_RECEIVER_REGISTER, p0")
        }
        else -> error("Malformed feature flag receiver preservation in neg.g")
    }
}

internal fun MutableMethod.injectFeatureFlagReturnOverrides(
    runtimeClass: String,
    overrideShape: Int,
    unsafeResultRegisters: Set<Int>,
    delegateTemplate: String,
) {
    val initialInstructions = implementation?.instructions
        ?: error("No instructions available in neg.g")
    val hasExistingOverrideCalls = initialInstructions.any { instruction ->
        instruction.targetRuntimeMethodReference(runtimeClass) != null
    }
    ensureFeatureFlagReceiverPreserved(insertIfMissing = !hasExistingOverrideCalls)

    val instructions = implementation?.instructions
        ?: error("No instructions available in neg.g")
    val returnIndices = returnInstructionIndices()
        .filter { index ->
            instructions[index].opcode.name.uppercase().replace('-', '_') == "RETURN_OBJECT"
        }
    check(returnIndices.isNotEmpty()) { "Could not resolve RETURN_OBJECT in neg.g" }
    val resultRegistersByReturn = returnIndices.associateWith { returnIndex ->
        val resultRegister = (instructions[returnIndex] as? OneRegisterInstruction)?.registerA
            ?: error("RETURN_OBJECT at $returnIndex does not expose registerA")
        check(resultRegister !in unsafeResultRegisters) {
            "RETURN_OBJECT at $returnIndex aliases feature flag override scratch registers"
        }
        resultRegister
    }

    val existingOverrideIndices = instructions.indices.filter { index ->
        instructions[index].targetRuntimeMethodReference(runtimeClass) != null
    }
    if (existingOverrideIndices.isNotEmpty()) {
        val validOverrideByReturn = returnIndices.mapIndexed { ordinal, returnIndex ->
            val segmentStart = if (ordinal == 0) 0 else returnIndices[ordinal - 1] + 1
            val segmentOverrideIndices = existingOverrideIndices.filter { index ->
                index in segmentStart until returnIndex
            }
            segmentOverrideIndices.size == 1 &&
                instructions.hasExactOverrideChain(
                    invokeIndex = segmentOverrideIndices.single(),
                    returnIndex = returnIndex,
                    resultRegister = resultRegistersByReturn.getValue(returnIndex),
                    runtimeClass = runtimeClass,
                    overrideShape = overrideShape,
                )
        }
        val hasOverridesAfterLastReturn =
            existingOverrideIndices.any { index -> index > returnIndices.last() }
        if (
            !hasOverridesAfterLastReturn &&
            validOverrideByReturn.all { valid -> valid }
        ) {
            return
        }
        error("Partial feature flag override injection for $runtimeClass in neg.g")
    }

    returnIndices.asReversed().forEach { returnIndex ->
        val resultRegister = resultRegistersByReturn.getValue(returnIndex)
        addInstructions(
            returnIndex,
            delegateTemplate.replace(RESULT_REGISTER_TOKEN, resultRegister.toString()),
        )
    }
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction
    .targetRuntimeMethodReference(runtimeClass: String): MethodReference? {
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    return reference.takeIf {
        it.definingClass == runtimeClass && it.name == "applyOverriddenFlagValue"
    }
}

private fun List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>
    .hasExactOverrideChain(
        invokeIndex: Int,
        returnIndex: Int,
        resultRegister: Int,
        runtimeClass: String,
        overrideShape: Int,
    ): Boolean {
    return invokeIndex < returnIndex && hasExactDelegateInstructions(
        invokeIndex = invokeIndex,
        resultRegister = resultRegister,
        runtimeClass = runtimeClass,
        overrideShape = overrideShape,
    )
}

private fun List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>
    .hasExactDelegateInstructions(
        invokeIndex: Int,
        resultRegister: Int,
        runtimeClass: String,
        overrideShape: Int,
    ): Boolean {
    val invokeInstruction = getOrNull(invokeIndex) ?: return false
    if (invokeInstruction.opcode.name.normalized() != "INVOKE_STATIC") return false
    val invoke = invokeInstruction as? FiveRegisterInstruction ?: return false
    if (
        invoke.registerCount != 2 ||
        invoke.registerC != overrideShape.firstArgumentRegister ||
        invoke.registerD != resultRegister
    ) {
        return false
    }

    val reference = invokeInstruction.targetRuntimeMethodReference(runtimeClass) ?: return false
    if (
        reference.parameterTypes.toList() != overrideShape.parameterTypes ||
        reference.returnType != "Ljava/lang/Object;"
    ) {
        return false
    }

    val moveResult = getOrNull(invokeIndex + 1) as? OneRegisterInstruction ?: return false
    if (
        moveResult.opcode.name.normalized() != "MOVE_RESULT_OBJECT" ||
        moveResult.registerA != resultRegister
    ) {
        return false
    }

    if (overrideShape == FEATURE_FLAG_OVERRIDE_SHAPE_SHARED) {
        val flagNameLoad = getOrNull(invokeIndex - 1) as? TwoRegisterInstruction ?: return false
        val field = (flagNameLoad as? ReferenceInstruction)?.reference as? FieldReference
            ?: return false
        if (
            flagNameLoad.opcode.name.normalized() != "IGET_OBJECT" ||
            flagNameLoad.registerA != 0 ||
            flagNameLoad.registerB != FEATURE_FLAG_RECEIVER_REGISTER ||
            !GboardVersionBindings.flagNameField.matches(field)
        ) {
            return false
        }
    }

    return true
}

private val Int.firstArgumentRegister: Int
    get() = when (this) {
        FEATURE_FLAG_OVERRIDE_SHAPE_SHARED -> 0
        FEATURE_FLAG_OVERRIDE_SHAPE_WRITING_TOOLS -> FEATURE_FLAG_RECEIVER_REGISTER
        else -> error("Unknown feature flag override shape: $this")
    }

private val Int.parameterTypes: List<String>
    get() = when (this) {
        FEATURE_FLAG_OVERRIDE_SHAPE_SHARED ->
            listOf("Ljava/lang/String;", "Ljava/lang/Object;")
        FEATURE_FLAG_OVERRIDE_SHAPE_WRITING_TOOLS ->
            listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
        else -> error("Unknown feature flag override shape: $this")
    }

private fun String.normalized(): String = uppercase().replace('-', '_')
