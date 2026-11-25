package dev.jason.gboardpatches.patches.gboard.features.addsymbols

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId


internal val gboardZhuyinCustomSymbolsHistoryPatch = bytecodePatch(
    description = "調整 add-symbols 的 recent/history namespace 隔離。",
) {
    dependsOn(gboardZhuyinCustomSymbolsExtensionPatch)

    execute {
        val clickMethod = findMutableMethodOrThrow(GboardVersionBindings.customSymbolsHistoryConsumer)
        clickMethod.applyZhuyinCustomSymbolsHistoryDelegate()
    }
}

internal fun MutableMethod.applyZhuyinCustomSymbolsHistoryDelegate(): MutableMethod {
    val implementation = checkNotNull(implementation) {
        "iyd.accept() has no implementation"
    }
    val instructions = implementation.instructions
    val historyWriteIndices = instructions.indices.filter { index ->
        val methodReference = (instructions[index] as? ReferenceInstruction)
            ?.reference as? MethodReference
        val fieldReference = if (index > 0) {
            (instructions[index - 1] as? ReferenceInstruction)?.reference as? FieldReference
        } else {
            null
        }
        methodReference?.definingClass ==
            GboardVersionBindings.customSymbolsHistorySink.ownerDescriptor &&
            methodReference.name == GboardVersionBindings.customSymbolsHistorySink.name &&
            methodReference.parameterTypes.map(CharSequence::toString) ==
            GboardVersionBindings.customSymbolsHistorySink.parameterTypes &&
            methodReference.returnType == GboardVersionBindings.customSymbolsHistorySink.returnType &&
            fieldReference?.definingClass ==
            GboardVersionBindings.customSymbolsM2HistoryField.ownerDescriptor &&
            fieldReference.name == GboardVersionBindings.customSymbolsM2HistoryField.name &&
            fieldReference.type == GboardVersionBindings.customSymbolsHistorySink.ownerDescriptor
    }
    check(historyWriteIndices.size == 1) {
        "Expected one EmoticonKeyboardM2 history write, found ${historyWriteIndices.size}"
    }
    val historyWriteIndex = historyWriteIndices.single()
    val historyWrite = instructions[historyWriteIndex] as? FiveRegisterInstruction
        ?: error("EmoticonKeyboardM2 history write is not a five-register invoke")
    val historyManagerRegister = smaliRegisterName(
        historyWrite.registerC,
        implementation.registerCount,
        parameterRegisterCount = 2,
    )
    val symbolRegister = smaliRegisterName(
        historyWrite.registerD,
        implementation.registerCount,
        parameterRegisterCount = 2,
    )
    check(historyWrite.registerC != 6 && historyWrite.registerD != 6) {
        "History redirect scratch v6 aliases an input"
    }
    addInstructionsWithLabels(
        historyWriteIndex,
        HISTORY_WRITE_DELEGATE.format(historyManagerRegister, symbolRegister),
        ExternalLabel("jasondev_history_handled", instructions[historyWriteIndex + 1]),
    )
    return this
}

/*
 * The result goes into v6, which held only the `this` just handed to the interceptor and is dead
 * afterwards. It used to go into p1, which clobbered accept()'s Object argument that the code after
 * the history write still dereferences; the verifier then rejected the class with "register has
 * type Boolean but expected Reference Object" (VerifyError in EmoticonKeyboardM2's lambda).
 */
private val HISTORY_WRITE_DELEGATE = """
    move-object/from16 v6, p0

    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.ADD_SYMBOLS_RUNTIME_INTERCEPT_HISTORY_WRITE,
        "v6, %s, %s",
    )}

    move-result v6

    if-nez v6, :jasondev_history_handled
""".trimIndent()

private fun smaliRegisterName(
    register: Int,
    registerCount: Int,
    parameterRegisterCount: Int,
): String {
    val firstParameterRegister = registerCount - parameterRegisterCount
    return if (register < firstParameterRegister) {
        "v$register"
    } else {
        "p${register - firstParameterRegister}"
    }
}
