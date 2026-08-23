package dev.jason.gboardpatches.patches.gboard.features.writingtools

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.isInvoke
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.isOpcode
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardAiWritingToolsBackendFactoryPatch = bytecodePatch(
    description = "阻止 17.7.7 private Writing Tools direct factory 回退到 Gboard server。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        findMutableMethodOrThrow(
            classType = BACKEND_FACTORY_CLASS,
            name = "a",
            returnType = "Lnjz;",
            parameterTypes = listOf("Landroid/content/Context;", "Loxe;"),
        ).applyWritingToolsBackendFactoryGuard()
    }
}

internal fun MutableMethod.applyWritingToolsBackendFactoryGuard() {
    val instructions = implementation?.instructions
        ?: error("No instructions available in $definingClass->$name")
    check(implementation!!.registerCount == 7) {
        "Unexpected gyc#a register count in $definingClass->$name"
    }
    val returnIndices = returnInstructionIndices()
        .filter { instructions[it].isOpcode("RETURN_OBJECT") }
    check(returnIndices.size == 5) {
        "Expected five RETURN_OBJECT sites in $definingClass->$name"
    }
    val unsupportedReturnIndex = returnIndices.last()
    val unsupportedResultRegister =
        (instructions[unsupportedReturnIndex] as? OneRegisterInstruction)?.registerA
            ?: error("Unsupported fallback RETURN_OBJECT has no register")
    check(unsupportedResultRegister == CONTEXT_PARAMETER_REGISTER) {
        "Unsupported fallback result no longer returns p0"
    }
    val serverConstructorIndex = (unsupportedReturnIndex - 1 downTo 0).firstOrNull { index ->
        instructions[index].isMethodReference(SERVER_CONSTRUCTOR_DESCRIPTOR)
    } ?: error("Missing final njl constructor in $definingClass->$name")
    val contextOverwriteIndices = instructions.indices.filter { index ->
        val instruction = instructions[index]
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.isOpcode("SGET_OBJECT") &&
            instruction is OneRegisterInstruction &&
            instruction.registerA == CONTEXT_PARAMETER_REGISTER &&
            field?.toString() == CONTEXT_OVERWRITE_FIELD
    }
    check(contextOverwriteIndices.size == 1) {
        "Expected exact gyc.a context-overwrite anchor"
    }
    val contextOverwriteIndex = contextOverwriteIndices.single()
    val delegateIndices = instructions.indices.filter { index ->
        instructions[index].isMethodReference(BACKEND_FACTORY_DELEGATE_DESCRIPTOR)
    }
    val contextPreserveIndices = instructions.indices.filter { index ->
        val instruction = instructions[index]
        instruction.isOpcode("MOVE_OBJECT") &&
            instruction is TwoRegisterInstruction &&
            instruction.registerA == CONTEXT_SCRATCH_REGISTER &&
            instruction.registerB == CONTEXT_PARAMETER_REGISTER
    }
    val completed = delegateIndices.size == 1 &&
        unsupportedReturnIndex >= 4 &&
        serverConstructorIndex == unsupportedReturnIndex - 4 &&
        delegateIndices.single() == unsupportedReturnIndex - 3 &&
        instructions[unsupportedReturnIndex - 3].isInvoke(
            "INVOKE_STATIC",
            BACKEND_FACTORY_DELEGATE_DESCRIPTOR,
            unsupportedResultRegister,
            CONTEXT_SCRATCH_REGISTER,
            implementation!!.registerCount - 1,
        ) &&
        instructions[unsupportedReturnIndex - 2].isOpcode("MOVE_RESULT_OBJECT") &&
        (instructions[unsupportedReturnIndex - 2] as? OneRegisterInstruction)?.registerA ==
            unsupportedResultRegister &&
        instructions[unsupportedReturnIndex - 1].isOpcode("CHECK_CAST") &&
        (instructions[unsupportedReturnIndex - 1] as? OneRegisterInstruction)?.registerA ==
            unsupportedResultRegister &&
        (instructions[unsupportedReturnIndex - 1] as? ReferenceInstruction)
            ?.reference?.toString() == "Lnjz;" &&
        contextPreserveIndices.size == 1 &&
        contextPreserveIndices.single() == contextOverwriteIndex - 1
    if (delegateIndices.isNotEmpty() || contextPreserveIndices.isNotEmpty()) {
        check(completed) {
            "Malformed partial Writing Tools backend factory guard in $definingClass->$name"
        }
        return
    }
    check(serverConstructorIndex == unsupportedReturnIndex - 1) {
        "Final njl constructor is not adjacent to unsupported return"
    }

    addInstructions(
        unsupportedReturnIndex,
        buildBackendFactoryDelegate(unsupportedResultRegister),
    )
    replaceInstruction(
        contextOverwriteIndex,
        "move-object v$CONTEXT_SCRATCH_REGISTER, p0",
    )
    addInstructions(
        contextOverwriteIndex + 1,
        "sget-object p0, $CONTEXT_OVERWRITE_FIELD",
    )
}

private fun buildBackendFactoryDelegate(resultRegister: Int): String = """
    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.AI_WRITING_TOOLS_BACKEND_FACTORY_RUNTIME_REPLACE_UNSUPPORTED_SERVER_FALLBACK,
        "v$resultRegister, v$CONTEXT_SCRATCH_REGISTER, p1",
    )}

    move-result-object v$resultRegister

    check-cast v$resultRegister, Lnjz;
""".trimIndent()

private const val CONTEXT_SCRATCH_REGISTER = 4
private const val CONTEXT_PARAMETER_REGISTER = 5
private const val CONTEXT_OVERWRITE_FIELD = "Lgyc;->a:Lviq;"
private const val SERVER_CONSTRUCTOR_DESCRIPTOR = "Lnjl;-><init>(Loxe;)V"
private val BACKEND_FACTORY_DELEGATE_DESCRIPTOR = RuntimeAbiCatalog.abi(
    RuntimeCallId.AI_WRITING_TOOLS_BACKEND_FACTORY_RUNTIME_REPLACE_UNSUPPORTED_SERVER_FALLBACK,
).reference
