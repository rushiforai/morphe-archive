package dev.jason.gboardpatches.patches.gboard.features.writingtools

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
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

internal val gboardAiWritingToolsSettingsVisibilityPatch = bytecodePatch(
    description = "只在 17.7.7 Writing Tools controller scope 內保留兩顆官方 rows 與 category。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        findMutableMethodOrThrow(
            classType = SETTINGS_CONTROLLER_CLASS,
            name = "b",
            returnType = "V",
            parameterTypes = listOf("Landroid/content/Context;", PREFERENCE_WRAPPER_CLASS),
        ).applyWritingToolsSettingsControllerScope()
        findMutableMethodOrThrow(
            classType = PREFERENCE_WRAPPER_CLASS,
            name = "g",
            returnType = "V",
            parameterTypes = listOf("I"),
        ).applyWritingToolsSettingsRemovalBypass()
    }
}

internal fun MutableMethod.applyWritingToolsSettingsControllerScope() {
    val instructions = implementation?.instructions
        ?: error("No instructions available in $definingClass->$name")
    val returnIndices = returnInstructionIndices()
    check(returnIndices.isNotEmpty()) { "Missing RETURN_VOID in $definingClass->$name" }
    val enterCount = instructions.countMethodDescriptor(SCOPE_ENTER_DESCRIPTOR)
    val exitCount = instructions.countMethodDescriptor(SCOPE_EXIT_DESCRIPTOR)
    val handlerIndices = instructions.indices.filter { index ->
        instructions.isScopeExceptionHandlerAt(index)
    }
    val handlerIndex = handlerIndices.singleOrNull()
    val complete = enterCount == 1 &&
        instructions.firstOrNull()?.isExactStaticNoArgInvoke(SCOPE_ENTER_DESCRIPTOR) == true &&
        exitCount == returnIndices.size + 1 &&
        returnIndices.all { index ->
            index > 0 && instructions[index - 1].isExactStaticNoArgInvoke(SCOPE_EXIT_DESCRIPTOR)
        } &&
        handlerIndex != null &&
        implementation!!.hasScopeCatchAll(handlerIndex)
    if (enterCount > 0 || exitCount > 0 || handlerIndices.isNotEmpty() ||
        implementation!!.hasCatchAllHandler()) {
        check(complete) { "Malformed partial Writing Tools settings scope in $definingClass->$name" }
        return
    }

    returnIndices.asReversed().forEach { returnIndex ->
        addInstructions(returnIndex, SCOPE_EXIT_DELEGATE)
    }
    addInstructions(0, SCOPE_ENTER_DELEGATE)
    val handlerStartIndex = implementation!!.instructions.size
    addInstructions(handlerStartIndex, SCOPE_EXCEPTION_HANDLER)
    val tryStart = implementation!!.newLabelForIndex(1)
    val handler = implementation!!.newLabelForIndex(handlerStartIndex)
    implementation!!.addCatch(tryStart, handler, handler)
}

internal fun MutableMethod.applyWritingToolsSettingsRemovalBypass() {
    val instructions = implementation?.instructions
        ?: error("No instructions available in $definingClass->$name")
    check(returnInstructionIndices().isNotEmpty()) {
        "Missing RETURN_VOID in $definingClass->$name"
    }
    val delegateCount = instructions.countMethodDescriptor(SHOULD_BYPASS_DESCRIPTOR)
    if (delegateCount > 0) {
        val moveResult = instructions.getOrNull(1) as? OneRegisterInstruction
        val branch = instructions.getOrNull(2) as? OffsetInstruction
        val complete = delegateCount == 1 &&
            instructions.size > 4 &&
            instructions[0].isInvoke(
                "INVOKE_STATIC",
                SHOULD_BYPASS_DESCRIPTOR,
                implementation!!.registerCount - 1,
            ) &&
            instructions[1].isOpcode("MOVE_RESULT") &&
            moveResult?.registerA == 0 &&
            instructions[2].isOpcode("IF_EQZ") &&
            (instructions[2] as? OneRegisterInstruction)?.registerA == 0 &&
            branch != null &&
            instructions.codeAddressOf(2) + branch.codeOffset == instructions.codeAddressOf(4) &&
            instructions[3].isOpcode("RETURN_VOID")
        check(complete) {
            "Malformed partial Writing Tools settings bypass in $definingClass->$name"
        }
        return
    }
    addInstructions(0, SETTINGS_REMOVAL_BYPASS_DELEGATE)
}

private val SCOPE_ENTER_DELEGATE = """
    ${RuntimeCallEmitter.invoke(RuntimeCallId.AI_WRITING_TOOLS_RUNTIME_ENTER_SETTINGS_CONTROLLER_SCOPE, "")}
""".trimIndent()

private val SCOPE_EXIT_DELEGATE = """
    ${RuntimeCallEmitter.invoke(RuntimeCallId.AI_WRITING_TOOLS_RUNTIME_EXIT_SETTINGS_CONTROLLER_SCOPE, "")}
""".trimIndent()

private val SCOPE_EXCEPTION_HANDLER = """
    move-exception p0

    ${RuntimeCallEmitter.invoke(RuntimeCallId.AI_WRITING_TOOLS_RUNTIME_EXIT_SETTINGS_CONTROLLER_SCOPE, "")}

    throw p0
""".trimIndent()

private val SETTINGS_REMOVAL_BYPASS_DELEGATE = """
    ${RuntimeCallEmitter.invoke(RuntimeCallId.AI_WRITING_TOOLS_RUNTIME_SHOULD_BYPASS_SETTINGS_REMOVAL, "p1")}

    move-result v0

    if-eqz v0, :cond_jasondev_continue_original

    return-void

    :cond_jasondev_continue_original
""".trimIndent()

private val SCOPE_ENTER_DESCRIPTOR = RuntimeAbiCatalog.abi(
    RuntimeCallId.AI_WRITING_TOOLS_RUNTIME_ENTER_SETTINGS_CONTROLLER_SCOPE,
).reference
private val SCOPE_EXIT_DESCRIPTOR = RuntimeAbiCatalog.abi(
    RuntimeCallId.AI_WRITING_TOOLS_RUNTIME_EXIT_SETTINGS_CONTROLLER_SCOPE,
).reference
private val SHOULD_BYPASS_DESCRIPTOR = RuntimeAbiCatalog.abi(
    RuntimeCallId.AI_WRITING_TOOLS_RUNTIME_SHOULD_BYPASS_SETTINGS_REMOVAL,
).reference

private fun List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>
    .countMethodDescriptor(descriptor: String): Int = count {
        it.isMethodReference(descriptor)
    }

private fun List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>
    .isScopeExceptionHandlerAt(index: Int): Boolean {
    if (index + 2 >= size || !get(index).isOpcode("MOVE_EXCEPTION")) {
        return false
    }
    val moved = get(index) as? OneRegisterInstruction ?: return false
    val thrown = get(index + 2) as? OneRegisterInstruction ?: return false
    return get(index + 1).isExactStaticNoArgInvoke(SCOPE_EXIT_DESCRIPTOR) &&
        get(index + 2).isOpcode("THROW") &&
        moved.registerA == thrown.registerA
}

private fun com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
    .hasScopeCatchAll(handlerIndex: Int): Boolean {
    val instructions = instructions
    val tryStartAddress = instructions.first().codeUnits
    val handlerAddress = instructions.take(handlerIndex).sumOf { it.codeUnits }
    val catchAllRanges = mutableListOf<Pair<Int, Int>>()
    for (tryBlock in tryBlocks) {
        for (handler in tryBlock.exceptionHandlers) {
            if (handler.exceptionType == null) {
                if (handler.handlerCodeAddress != handlerAddress) {
                    return false
                }
                val rangeStart = tryBlock.startCodeAddress
                val rangeEnd = rangeStart + tryBlock.codeUnitCount
                if (rangeStart < tryStartAddress || rangeEnd > handlerAddress ||
                    rangeStart >= rangeEnd) {
                    return false
                }
                catchAllRanges += rangeStart to rangeEnd
            }
        }
    }
    if (catchAllRanges.isEmpty()) {
        return false
    }
    var coveredUntil = tryStartAddress
    while (coveredUntil < handlerAddress) {
        var nextCoveredUntil = coveredUntil
        for ((rangeStart, rangeEnd) in catchAllRanges) {
            if (rangeStart <= coveredUntil && rangeEnd > nextCoveredUntil) {
                nextCoveredUntil = rangeEnd
            }
        }
        if (nextCoveredUntil == coveredUntil) {
            return false
        }
        coveredUntil = nextCoveredUntil
    }
    return coveredUntil == handlerAddress
}

private fun com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
    .hasCatchAllHandler(): Boolean = tryBlocks.any { tryBlock ->
    tryBlock.exceptionHandlers.any { handler -> handler.exceptionType == null }
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction
    .isExactStaticNoArgInvoke(descriptor: String): Boolean =
    isInvoke("INVOKE_STATIC", descriptor)

private fun List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>
    .codeAddressOf(index: Int): Int = take(index).sumOf { instruction -> instruction.codeUnits }
