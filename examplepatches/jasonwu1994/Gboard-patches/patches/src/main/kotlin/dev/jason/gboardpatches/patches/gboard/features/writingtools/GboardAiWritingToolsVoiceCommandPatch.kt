package dev.jason.gboardpatches.patches.gboard.features.writingtools

import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.isFieldReference
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.isReference
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val VOICE_COMMAND_RUNTIME_CLASS = RuntimeAbiCatalog.abi(
    RuntimeCallId.AI_WRITING_TOOLS_VOICE_COMMAND_RUNTIME_APPLY_GEN_AI_INIT_CLIENT_TYPE,
).owner

private val RuntimeCallId.reference: String
    get() = RuntimeAbiCatalog.abi(this).reference

private val GEN_AI_GATE =
    RuntimeCallId.AI_WRITING_TOOLS_VOICE_COMMAND_RUNTIME_APPLY_GEN_AI_INIT_CLIENT_TYPE
private val GEN_AI_INIT_REMEMBER =
    RuntimeCallId.AI_WRITING_TOOLS_VOICE_COMMAND_RUNTIME_REMEMBER_GEN_AI_INIT_CALL
private val GEN_AI_REFRESH_BEGIN =
    RuntimeCallId.AI_WRITING_TOOLS_VOICE_COMMAND_RUNTIME_BEGIN_GEN_AI_REFRESH
private val GEN_AI_REFRESH_OBSERVE =
    RuntimeCallId.AI_WRITING_TOOLS_VOICE_COMMAND_RUNTIME_OBSERVE_GEN_AI_REFRESH_CLIENT_TYPE
private val GEN_AI_REFRESH_FINISH =
    RuntimeCallId.AI_WRITING_TOOLS_VOICE_COMMAND_RUNTIME_FINISH_GEN_AI_REFRESH
private val SMART_EDIT_GATE =
    RuntimeCallId.AI_WRITING_TOOLS_VOICE_COMMAND_RUNTIME_APPLY_SMART_EDIT_INIT_CLIENT_TYPE
private val SMART_EDIT_MODULE =
    RuntimeCallId.AI_WRITING_TOOLS_VOICE_COMMAND_RUNTIME_SHOULD_ENABLE_SMART_EDIT_MODULE
private val COMMAND_AMBIGUITY =
    RuntimeCallId.AI_WRITING_TOOLS_VOICE_COMMAND_RUNTIME_AFTER_COMMAND_AMBIGUITY_CONSTRUCTED
private val CLASSIFIER_MODELESS =
    RuntimeCallId.AI_WRITING_TOOLS_VOICE_COMMAND_RUNTIME_APPLY_CLASSIFIER_MODELESS_FLAG_VALUE
private val CLASSIFICATION_REGEX =
    RuntimeCallId.AI_WRITING_TOOLS_VOICE_COMMAND_RUNTIME_APPLY_CLASSIFICATION_REGEX_VERSION
private val VOICE_COMMAND_LANGUAGES =
    RuntimeCallId.AI_WRITING_TOOLS_VOICE_COMMAND_RUNTIME_APPLY_VOICE_COMMAND_LANGUAGES
private val SMART_EDIT_GENERATOR_MODULE =
    RuntimeCallId.AI_WRITING_TOOLS_VOICE_COMMAND_RUNTIME_RESTORE_SMART_EDIT_GENERATOR_MODULE
private const val MODULE_MANAGER_GET_LOADED =
    "Lcom/google/android/libraries/inputmethod/module/ModuleManager;->a(Ljava/lang/Class;)Lozp;"

internal val gboardAiWritingToolsVoiceCommandPatch = bytecodePatch(
    description = "補齊 17.7.7 Fix it 與 detailed-edit voice command 初始化、模型與語言依賴。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        findMutableMethodOrThrow(GboardVersionBindings.aiWritingToolsGenAiInit)
            .applyWritingToolsGenAiInitClientTypeDelegate()
        findMutableMethodOrThrow(GboardVersionBindings.aiWritingToolsNgaInputRefresh)
            .applyWritingToolsGenAiRefreshDelegate()
        findMutableMethodOrThrow(GboardVersionBindings.aiWritingToolsSmartEditInit)
            .applyWritingToolsSmartEditInitClientTypeDelegate()
        findMutableMethodOrThrow(GboardVersionBindings.aiWritingToolsModulePredicate)
            .applyWritingToolsSmartEditModulePredicateDelegate()
        findMutableMethodOrThrow(GboardVersionBindings.aiWritingToolsAmbiguityConstructor)
            .applyWritingToolsCommandAmbiguityDelegate()
        findMutableMethodOrThrow(GboardVersionBindings.aiWritingToolsClassifierInit)
            .applyWritingToolsClassifierModelessFlagDelegate()
        findMutableMethodOrThrow(GboardVersionBindings.aiWritingToolsClassificationRun)
            .applyWritingToolsClassificationRegexDelegate()
        findMutableMethodOrThrow(GboardVersionBindings.aiWritingToolsProtoValue)
            .applyWritingToolsVoiceCommandLanguagesDelegate()
        findMutableMethodOrThrow(GboardVersionBindings.aiWritingToolsSmartEditRequest)
            .applyWritingToolsSmartEditGeneratorModuleDelegate()
    }
}

internal fun MutableMethod.applyWritingToolsGenAiInitClientTypeDelegate() {
    applyWritingToolsGenAiInitRememberDelegate()
    applyClientTypeCallSiteDelegate(
        expectedRegisterCount = 7,
        predicate = "Lttb;->cH(Ljus;)Z",
        clientRegister = 0,
        scratchRegister = 1,
        resultRegister = 0,
        runtime = GEN_AI_GATE,
    )
}

private fun MutableMethod.applyWritingToolsGenAiInitRememberDelegate() {
    val instructions = implementation?.instructions
        ?: error("GenAI init target has no implementation")
    val runtimeCalls = instructions.count { it.isMethodReference(GEN_AI_INIT_REMEMBER.reference) }
    if (runtimeCalls != 0) {
        check(runtimeCalls == 1) { "Duplicate GenAI init remember delegate in ${descriptor()}" }
        return
    }
    addInstructions(0, RuntimeCallEmitter.invoke(GEN_AI_INIT_REMEMBER, "p0, p1, p2"))
}

internal fun MutableMethod.applyWritingToolsGenAiRefreshDelegate() {
    val instructions = implementation?.instructions
        ?: error("GenAI refresh target has no implementation")
    val beginCalls = instructions.count { it.isMethodReference(GEN_AI_REFRESH_BEGIN.reference) }
    val observeCalls = instructions.count { it.isMethodReference(GEN_AI_REFRESH_OBSERVE.reference) }
    val finishCalls = instructions.count { it.isMethodReference(GEN_AI_REFRESH_FINISH.reference) }
    if (beginCalls + observeCalls + finishCalls != 0) {
        check(beginCalls == 1 && observeCalls == 1 && finishCalls == 1) {
            "Incomplete GenAI refresh delegates in ${descriptor()}"
        }
        return
    }
    check(implementation!!.registerCount == 12) {
        "Register drift in ${descriptor()}: ${implementation!!.registerCount}"
    }

    val predicateIndices = instructions.indices.filter {
        instructions[it].isMethodReference("Lttb;->cH(Ljus;)Z")
    }
    check(predicateIndices.size == 1) {
        "Expected one exact Smart Dictation predicate in ${descriptor()}"
    }
    val predicateIndex = predicateIndices.single()
    val predicate = instructions[predicateIndex] as? FiveRegisterInstruction
    check(predicate != null && predicate.registerCount == 1) {
        "Smart Dictation predicate shape drift in ${descriptor()}"
    }
    val clientRegister = predicate.registerC
    val clientProducerIndices = instructions.indices.filter { index ->
        index < predicateIndex &&
            instructions[index].isFieldReference("Lhmc;->j:Ljus;") &&
            (instructions[index] as? TwoRegisterInstruction)?.let { producer ->
                producer.opcode == Opcode.IGET_OBJECT && producer.registerA == clientRegister
            } == true
    }
    check(clientProducerIndices.size == 1) {
        "Expected one exact refresh client-type producer in ${descriptor()}"
    }
    val returns = returnInstructionIndices()
    check(returns.size == 1 && instructions[returns.single()].opcode == Opcode.RETURN_VOID) {
        "Expected one refresh RETURN_VOID in ${descriptor()}"
    }

    val returnIndex = returns.single()
    replaceInstruction(returnIndex, RuntimeCallEmitter.invoke(GEN_AI_REFRESH_FINISH, "p0"))
    addInstructions(returnIndex + 1, "return-void")
    addInstructions(
        clientProducerIndices.single() + 1,
        RuntimeCallEmitter.invoke(GEN_AI_REFRESH_OBSERVE, "p0, v$clientRegister"),
    )
    addInstructions(0, RuntimeCallEmitter.invoke(GEN_AI_REFRESH_BEGIN, "p0"))
}

internal fun MutableMethod.applyWritingToolsSmartEditInitClientTypeDelegate() {
    applyClientTypeCallSiteDelegate(
        expectedRegisterCount = 19,
        predicate = "Lttb;->cG(Ljus;)Z",
        clientRegister = 10,
        scratchRegister = 11,
        resultRegister = 10,
        runtime = SMART_EDIT_GATE,
    )
}

private fun MutableMethod.applyClientTypeCallSiteDelegate(
    expectedRegisterCount: Int,
    predicate: String,
    clientRegister: Int,
    scratchRegister: Int,
    resultRegister: Int,
    runtime: RuntimeCallId,
) {
    val instructions = implementation?.instructions
        ?: error("Voice-command target has no implementation")
    check(implementation!!.registerCount == expectedRegisterCount) {
        "Register drift in ${descriptor()}: ${implementation!!.registerCount}"
    }
    val runtimeCalls = instructions.count { it.isMethodReference(runtime.reference) }
    if (runtimeCalls != 0) {
        check(runtimeCalls == 1) { "Duplicate client-type delegate in ${descriptor()}" }
        return
    }

    val predicateIndices = instructions.indices.filter {
        instructions[it].isMethodReference(predicate)
    }
    check(predicateIndices.size == 1) {
        "Expected one exact $predicate call in ${descriptor()}"
    }
    val predicateIndex = predicateIndices.single()
    val invoke = instructions[predicateIndex] as? FiveRegisterInstruction
    check(invoke != null && invoke.registerCount == 1 && invoke.registerC == clientRegister) {
        "Client-type predicate register drift in ${descriptor()}"
    }
    val moveResult = instructions.getOrNull(predicateIndex + 1) as? OneRegisterInstruction
    check(moveResult != null && moveResult.opcode == Opcode.MOVE_RESULT &&
        moveResult.registerA == resultRegister) {
        "Client-type predicate result drift in ${descriptor()}"
    }
    val clientProducerIndices = instructions.indices.filter { index ->
        index < predicateIndex &&
            instructions[index].isFieldReference("Lhmc;->j:Ljus;") &&
            (instructions[index] as? TwoRegisterInstruction)?.let { producer ->
                producer.opcode == Opcode.IGET_OBJECT && producer.registerA == clientRegister
            } == true
    }
    check(clientProducerIndices.size == 1) {
        "Expected one exact client-type producer in ${descriptor()}"
    }
    val clientProducerIndex = clientProducerIndices.single()

    addInstructions(
        predicateIndex + 2,
        """
            ${RuntimeCallEmitter.invoke(runtime, "v$scratchRegister, v$resultRegister")}
            move-result v$resultRegister
        """.trimIndent(),
    )
    addInstructions(clientProducerIndex + 1, "move-object v$scratchRegister, v$clientRegister")
}

internal fun MutableMethod.applyWritingToolsSmartEditModulePredicateDelegate() {
    val instructions = implementation?.instructions
        ?: error("SmartEdit module target has no implementation")
    val runtimeCalls = instructions.count { it.isMethodReference(SMART_EDIT_MODULE.reference) }
    if (runtimeCalls != 0) {
        check(runtimeCalls == 1) { "Duplicate SmartEdit module delegate in ${descriptor()}" }
        return
    }
    check(implementation!!.registerCount == 5) {
        "Register drift in ${descriptor()}: ${implementation!!.registerCount}"
    }

    addInstructions(0, "nop")
    val continuation = implementation!!.instructions[0]
    addInstructionsWithLabels(
        0,
        """
            ${RuntimeCallEmitter.invoke(SMART_EDIT_MODULE, "p1")}
            move-result v0
            if-eqz v0, :jasondev_voice_command_stock_module_predicate
            const/4 v0, 0x1
            return v0
        """.trimIndent(),
        ExternalLabel("jasondev_voice_command_stock_module_predicate", continuation),
    )
}

internal fun MutableMethod.applyWritingToolsCommandAmbiguityDelegate() {
    injectBeforeSingleReturn(COMMAND_AMBIGUITY, "p0")
}

internal fun MutableMethod.applyWritingToolsClassifierModelessFlagDelegate() {
    applyExactObjectFlagReadDelegate("Lnmm;->a:Lnea;", CLASSIFIER_MODELESS, expectedReadCount = 1)
}

internal fun MutableMethod.applyWritingToolsClassificationRegexDelegate() {
    applyExactObjectFlagReadDelegate("Lnmm;->j:Lnea;", CLASSIFICATION_REGEX, expectedReadCount = 2)
}

private fun MutableMethod.applyExactObjectFlagReadDelegate(
    fieldDescriptor: String,
    runtime: RuntimeCallId,
    expectedReadCount: Int,
) {
    val instructions = implementation?.instructions
        ?: error("Voice-command flag-read target has no implementation")
    val runtimeCalls = instructions.count { it.isMethodReference(runtime.reference) }
    if (runtimeCalls != 0) {
        check(runtimeCalls == expectedReadCount) {
            "Expected $expectedReadCount flag-read delegates in ${descriptor()}, found $runtimeCalls"
        }
        return
    }
    val fieldIndices = instructions.indices.filter {
        instructions[it].isFieldReference(fieldDescriptor)
    }
    check(fieldIndices.size == expectedReadCount) {
        "Expected $expectedReadCount exact $fieldDescriptor reads in ${descriptor()}"
    }
    val delegates = fieldIndices.map { fieldIndex ->
        val fieldRead = instructions[fieldIndex] as? OneRegisterInstruction
        val invoke = instructions.getOrNull(fieldIndex + 1) as? FiveRegisterInstruction
        val moveResult = instructions.getOrNull(fieldIndex + 2) as? OneRegisterInstruction
        check(fieldRead != null && fieldRead.opcode == Opcode.SGET_OBJECT &&
            invoke != null && instructions[fieldIndex + 1].isMethodReference(
                "Lnea;->g()Ljava/lang/Object;",
            ) &&
            invoke.registerCount == 1 && invoke.registerC == fieldRead.registerA &&
            moveResult != null && moveResult.opcode == Opcode.MOVE_RESULT_OBJECT) {
            "Flag-read call shape drift in ${descriptor()}"
        }
        fieldIndex to moveResult.registerA
    }
    delegates.asReversed().forEach { (fieldIndex, resultRegister) ->
        addInstructions(
            fieldIndex + 3,
            """
                ${RuntimeCallEmitter.invoke(runtime, "v$resultRegister")}
                move-result-object v$resultRegister
            """.trimIndent(),
        )
    }
}

internal fun MutableMethod.applyWritingToolsVoiceCommandLanguagesDelegate() {
    val instructions = implementation?.instructions
        ?: error("Voice-command proto target has no implementation")
    val runtimeCalls = instructions.count { it.isMethodReference(VOICE_COMMAND_LANGUAGES.reference) }
    if (runtimeCalls != 0) {
        check(runtimeCalls == 1) { "Duplicate proto delegate in ${descriptor()}" }
        return
    }
    check(implementation!!.registerCount == 3) {
        "Register drift in ${descriptor()}: ${implementation!!.registerCount}"
    }
    val receiverOverwriteIndices = instructions.indices.filter {
        instructions[it].isFieldReference(
            "Lneu;->d:Ljava/util/concurrent/atomic/AtomicReference;",
        )
    }
    check(receiverOverwriteIndices.size == 1) {
        "Expected one neu.d receiver overwrite in ${descriptor()}"
    }
    val overwriteIndex = receiverOverwriteIndices.single()
    val overwrite = instructions[overwriteIndex] as? TwoRegisterInstruction
    check(overwrite != null && overwrite.opcode == Opcode.IGET_OBJECT &&
        overwrite.registerA == 2 && overwrite.registerB == 2) {
        "Proto receiver overwrite drift in ${descriptor()}"
    }
    val returns = returnInstructionIndices()
    check(returns.size == 1) { "Expected one proto return in ${descriptor()}" }
    val returnIndex = returns.single()
    val returned = instructions[returnIndex] as? OneRegisterInstruction
    check(returned != null && returned.opcode == Opcode.RETURN_OBJECT &&
        returned.registerA == 2) {
        "Proto return drift in ${descriptor()}"
    }

    addInstructions(
        returnIndex,
        """
            ${RuntimeCallEmitter.invoke(VOICE_COMMAND_LANGUAGES, "v1, p0")}
            move-result-object p0
        """.trimIndent(),
    )
    addInstructions(overwriteIndex, "move-object v1, p0")
}

internal fun MutableMethod.applyWritingToolsSmartEditGeneratorModuleDelegate() {
    val instructions = implementation?.instructions
        ?: error("SmartEdit request target has no implementation")
    val runtimeCalls = instructions.count {
        it.isMethodReference(SMART_EDIT_GENERATOR_MODULE.reference)
    }
    if (runtimeCalls != 0) {
        check(runtimeCalls == 1) {
            "Duplicate SmartEdit generator delegate in ${descriptor()}"
        }
        return
    }

    val candidates = instructions.indices.filter { invokeIndex ->
        if (!instructions[invokeIndex].isMethodReference(MODULE_MANAGER_GET_LOADED)) {
            return@filter false
        }
        val invoke = instructions[invokeIndex] as? FiveRegisterInstruction
            ?: return@filter false
        if (invoke.registerCount != 2 || invoke.registerC > 15 || invoke.registerD > 15) {
            return@filter false
        }
        val moduleClass = instructions.getOrNull(invokeIndex - 1) as? OneRegisterInstruction
            ?: return@filter false
        if (moduleClass.opcode != Opcode.CONST_CLASS ||
            moduleClass.registerA != invoke.registerD ||
            !instructions[invokeIndex - 1].isReference("Lhhf;")) {
            return@filter false
        }
        val stockResult = instructions.getOrNull(invokeIndex + 1) as? OneRegisterInstruction
            ?: return@filter false
        if (stockResult.opcode != Opcode.MOVE_RESULT_OBJECT || stockResult.registerA > 15) {
            return@filter false
        }
        val cast = instructions.getOrNull(invokeIndex + 2) as? OneRegisterInstruction
            ?: return@filter false
        if (cast.opcode != Opcode.CHECK_CAST ||
            cast.registerA != stockResult.registerA ||
            !instructions[invokeIndex + 2].isReference("Lhhf;")) {
            return@filter false
        }
        val store = instructions.getOrNull(invokeIndex + 3) as? TwoRegisterInstruction
            ?: return@filter false
        store.opcode == Opcode.IPUT_OBJECT &&
            store.registerA == stockResult.registerA &&
            instructions[invokeIndex + 3].isFieldReference("Lhhg;->a:Lhhf;")
    }
    check(candidates.size == 1) {
        "Expected one exact ModuleManager#a(hhf) result in ${descriptor()}"
    }

    val invokeIndex = candidates.single()
    val invoke = instructions[invokeIndex] as FiveRegisterInstruction
    val stockResult = instructions[invokeIndex + 1] as OneRegisterInstruction
    check(implementation!!.registerCount == 29 &&
        invoke.registerC == 5 && invoke.registerD == 10 &&
        stockResult.registerA == 5) {
        "SmartEdit generator register drift in ${descriptor()}"
    }
    addInstructions(
        invokeIndex + 2,
        """
            ${RuntimeCallEmitter.invoke(
                SMART_EDIT_GENERATOR_MODULE,
                "v${stockResult.registerA}, v0, v${invoke.registerD}",
            )}
            move-result-object v${stockResult.registerA}
            move-object/from16 v0, p0
        """.trimIndent(),
    )
    addInstructions(invokeIndex, "move-object v0, v${invoke.registerC}")
}

private fun MutableMethod.injectBeforeSingleReturn(runtime: RuntimeCallId, registers: String) {
    val instructions = implementation?.instructions
        ?: error("Voice-command return target has no implementation")
    val runtimeCalls = instructions.count { it.isMethodReference(runtime.reference) }
    if (runtimeCalls != 0) {
        check(runtimeCalls == 1) { "Duplicate return delegate in ${descriptor()}" }
        return
    }
    val returns = returnInstructionIndices()
    check(returns.size == 1 && instructions[returns.single()].opcode == Opcode.RETURN_VOID) {
        "Expected one RETURN_VOID in ${descriptor()}"
    }
    addInstructions(returns.single(), RuntimeCallEmitter.invoke(runtime, registers))
}

private fun MutableMethod.descriptor(): String =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
