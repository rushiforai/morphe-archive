package dev.jason.gboardpatches.patches.gboard.features.addsymbols

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jason.gboardpatches.patches.gboard.shared.GboardExpressionCorpusPatchState
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.indexOfFirstMoveResultAfter
import dev.jason.gboardpatches.patches.gboard.shared.methodCallIndices
import dev.jason.gboardpatches.patches.gboard.shared.requireGboardExpressionCorpusPatchState

private const val EXPRESSION_CORPUS_MANAGER_CLASS = "Lgan;"

internal val gboardZhuyinCustomSymbolsCorpusPatch = bytecodePatch(
    description = "在 expression corpus list 追加自訂 symbol tab。"
) {
    dependsOn(gboardZhuyinCustomSymbolsExtensionPatch)

    execute {
        val mutableMethod = findMutableMethodOrThrow(
            classType = EXPRESSION_CORPUS_MANAGER_CLASS,
            name = "a",
            returnType = "Lvai;",
            parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Z")
        )
        mutableMethod.applyZhuyinCustomSymbolsCorpusDelegate()
    }
}

internal fun MutableMethod.applyZhuyinCustomSymbolsCorpusDelegate(): MutableMethod {
    check(
        definingClass == EXPRESSION_CORPUS_MANAGER_CLASS &&
            name == "a" &&
            returnType == "Lvai;" &&
            parameterTypes == listOf("Landroid/view/inputmethod/EditorInfo;", "Z"),
    ) {
        "Refusing non-target Custom Symbols corpus method " +
            "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
    }
    val state = requireGboardExpressionCorpusPatchState()
    val instructions = implementation?.instructions
        ?: error("No instructions available in gan.a")
    val collectCallIndices = methodCallIndices(
        definingClass = "Lj$/util/stream/Stream;",
        name = "collect",
        returnType = "Ljava/lang/Object;",
        parameterTypes = listOf("Lj$/util/stream/Collector;")
    )
    check(collectCallIndices.size == 2) {
        "Expected exactly two Stream.collect calls in gan.a"
    }
    val customReferences = instructions.count {
        it.methodDescriptor() == CUSTOM_SYMBOLS_RUNTIME_DESCRIPTOR
    }
    if (state == GboardExpressionCorpusPatchState.CUSTOM_ONLY ||
        state == GboardExpressionCorpusPatchState.COMPOSED
    ) {
        check(customReferences == 1) {
            "Completed Custom Symbols state is missing its exact runtime delegate"
        }
        validateCustomSymbolsCorpusDelegate()
        return this
    }
    check(customReferences == 0) {
        "Stock/Tab-only expression corpus state contains an orphan Custom Symbols delegate"
    }

    val collectCallIndex = collectCallIndices.last()
    val moveResultIndex = indexOfFirstMoveResultAfter(collectCallIndex)
    check(moveResultIndex >= 0) { "Could not resolve final collect() move-result in gan.a" }
    val resultRegister = returnRegisterAt(moveResultIndex)
    check(instructions.getOrNull(moveResultIndex + 1)?.normalizedOpcode() == "CHECK_CAST") {
        "Final collect() result in gan.a is not cast to vai"
    }
    addInstructions(moveResultIndex + 2, buildCorpusAppendDelegate(resultRegister))
    validateCustomSymbolsCorpusDelegate()
    return this
}

private fun MutableMethod.validateCustomSymbolsCorpusDelegate() {
    val instructions = implementation?.instructions ?: error("No instructions available in gan.a")
    val collectCallIndices = methodCallIndices(
        definingClass = "Lj$/util/stream/Stream;",
        name = "collect",
        returnType = "Ljava/lang/Object;",
        parameterTypes = listOf("Lj$/util/stream/Collector;")
    )
    check(collectCallIndices.size == 2) {
        "Expected exactly two Stream.collect calls in gan.a"
    }
    val moveResultIndex = indexOfFirstMoveResultAfter(collectCallIndices.last())
    check(moveResultIndex >= 0) { "Could not resolve final collect() move-result in gan.a" }
    val expectedResultRegister = returnRegisterAt(moveResultIndex)
    val customIndex = instructions.indexOfFirst {
        it.methodDescriptor() == CUSTOM_SYMBOLS_RUNTIME_DESCRIPTOR
    }
    check(customIndex >= 0 && instructions.count {
        it.methodDescriptor() == CUSTOM_SYMBOLS_RUNTIME_DESCRIPTOR
    } == 1) {
        "Custom Symbols corpus delegate is duplicated or orphaned"
    }
    val invoke = instructions[customIndex] as? FiveRegisterInstruction
        ?: error("Custom Symbols corpus delegate has an unexpected invoke format")
    val resultRegister = invoke.registerC
    check(
        customIndex == moveResultIndex + 2 &&
            instructions.getOrNull(moveResultIndex + 1).isExactOneRegister(
                "CHECK_CAST", expectedResultRegister,
            ) &&
            invoke.registerCount == 1 &&
            resultRegister == expectedResultRegister &&
            instructions.getOrNull(customIndex + 1).isExactOneRegister(
                "MOVE_RESULT_OBJECT", resultRegister,
            ) &&
            instructions.getOrNull(customIndex + 2).isExactOneRegister(
                "CHECK_CAST", resultRegister,
            ),
    ) {
        "Custom Symbols corpus delegate is incomplete or malformed"
    }
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction?.isExactOneRegister(
    opcode: String,
    register: Int,
): Boolean =
    this?.normalizedOpcode() == opcode &&
        this is OneRegisterInstruction &&
        registerA == register

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.methodDescriptor(): String? =
    ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.normalizedOpcode(): String =
    opcode.name.uppercase().replace('-', '_').replace('/', '_')

private fun buildCorpusAppendDelegate(register: Int): String = """
    invoke-static {v$register}, $CUSTOM_SYMBOLS_RUNTIME_DESCRIPTOR

    move-result-object v$register

    check-cast v$register, Lvai;
""".trimIndent()

private const val CUSTOM_SYMBOLS_RUNTIME_DESCRIPTOR =
    "Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->" +
        "appendCustomCorpusItem(Ljava/lang/Object;)Ljava/lang/Object;"
