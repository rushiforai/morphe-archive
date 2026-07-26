package dev.jason.gboardpatches.patches.gboard.features.symbolfooter

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import dev.jason.gboardpatches.patches.gboard.shared.GboardExpressionCorpusPatchState
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.mutableClass
import dev.jason.gboardpatches.patches.gboard.shared.requireGboardExpressionCorpusPatchState
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices

private const val EXPRESSION_CORPUS_MANAGER_CLASS = "Lgan;"

internal val gboardSymbolFooterOrderBytecodePatch = bytecodePatch(
    description = "依使用者設定重排 expression footer corpus list。"
) {
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val methods = mutableClass(EXPRESSION_CORPUS_MANAGER_CLASS).methods.filter {
            it.name == TARGET_METHOD_NAME &&
                it.returnType == TARGET_RETURN_TYPE &&
                it.parameterTypes == TARGET_PARAMETERS
        }
        check(methods.size == 1) {
            "Expected exactly one $TARGET_DESCRIPTOR target"
        }
        val mutableMethod = methods.single()
        val patchedMethod = mutableMethod.applySymbolFooterOrderDelegate()
        if (patchedMethod !== mutableMethod) {
            val ownerMethods = mutableClass(EXPRESSION_CORPUS_MANAGER_CLASS).methods
            check(ownerMethods.remove(mutableMethod) && ownerMethods.add(patchedMethod)) {
                "Could not replace expanded $TARGET_DESCRIPTOR"
            }
        }
    }
}

internal fun MutableMethod.applySymbolFooterOrderDelegate(): MutableMethod {
    requireExactTarget()
    val implementation = implementation ?: error("No instructions in $TARGET_DESCRIPTOR")
    val state = requireGboardExpressionCorpusPatchState()
    if (state == GboardExpressionCorpusPatchState.TAB_ONLY ||
        state == GboardExpressionCorpusPatchState.COMPOSED
    ) {
        validateCompletedPatch()
        return this
    }

    check(implementation.registerCount == STOCK_REGISTER_COUNT) {
        "Unexpected register count in $TARGET_DESCRIPTOR: ${implementation.registerCount}"
    }
    validateStockShape()

    val expanded = expandRegisters()
    expanded.addInstructions(0, ENTRY_PARAMETER_COPIES)
    val returnIndex = expanded.singleReturnIndex()
    expanded.addInstructions(returnIndex, buildReorderDelegate(LEGACY_P0_REGISTER))
    expanded.validateCompletedPatch()
    return expanded
}

private fun MutableMethod.requireExactTarget() {
    check(
        definingClass == EXPRESSION_CORPUS_MANAGER_CLASS &&
            name == TARGET_METHOD_NAME &&
            returnType == TARGET_RETURN_TYPE &&
            parameterTypes == TARGET_PARAMETERS,
    ) {
        "Refusing non-target Symbol Footer method " +
            "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
    }
}

private fun MutableMethod.validateStockShape() {
    val implementation = implementation ?: error("No instructions in $TARGET_DESCRIPTOR")
    val instructions = implementation.instructions
    check(singleReturnIndex() == instructions.lastIndex) {
        "$TARGET_DESCRIPTOR must end at its single RETURN_OBJECT"
    }
    check((instructions.last() as OneRegisterInstruction).registerA == LEGACY_P0_REGISTER) {
        "$TARGET_DESCRIPTOR must return legacy p0/v$LEGACY_P0_REGISTER"
    }
    check(instructions.countMethodReference(FINAL_COLLECT_DESCRIPTOR) == 2) {
        "$TARGET_DESCRIPTOR must contain exactly two Stream.collect calls"
    }
    check(instructions.countMethodReference(RECEIVER_LAST_USE_DESCRIPTOR) == 1) {
        "$TARGET_DESCRIPTOR must contain the exact final original-receiver use"
    }
    check(instructions.countMethodReference(FOOTER_RUNTIME_DESCRIPTOR) == 0) {
        "$TARGET_DESCRIPTOR contains an orphan Symbol Footer delegate"
    }
}

private fun MutableMethod.validateCompletedPatch() {
    requireExactTarget()
    val implementation = implementation ?: error("No instructions in $TARGET_DESCRIPTOR")
    check(implementation.registerCount == PATCHED_REGISTER_COUNT) {
        "Malformed expanded register state in $TARGET_DESCRIPTOR"
    }
    val instructions = implementation.instructions
    check(
        instructions.getOrNull(0).isExactMove(
            "MOVE_OBJECT_FROM16", LEGACY_P0_REGISTER, PATCHED_P0_REGISTER,
        ) &&
            instructions.getOrNull(1).isExactMove(
                "MOVE_OBJECT_FROM16", LEGACY_P1_REGISTER, PATCHED_P1_REGISTER,
            ) &&
            instructions.getOrNull(2).isExactMove(
                "MOVE_FROM16", LEGACY_P2_REGISTER, PATCHED_P2_REGISTER,
            ),
    ) {
        "$TARGET_DESCRIPTOR entry parameter copies are missing or malformed"
    }
    val returnIndex = singleReturnIndex()
    check((instructions[returnIndex] as OneRegisterInstruction).registerA == LEGACY_P0_REGISTER)
    check(
        instructions.size > 3 &&
            instructions[returnIndex - 3].isExactFooterInvoke() &&
            instructions[returnIndex - 2].isExactOneRegister(
                "MOVE_RESULT_OBJECT", LEGACY_P0_REGISTER,
            ) &&
            instructions[returnIndex - 1].isExactOneRegister(
                "CHECK_CAST", LEGACY_P0_REGISTER,
            ),
    ) {
        "$TARGET_DESCRIPTOR final Symbol Footer delegate is missing or malformed"
    }
    check(instructions.countMethodReference(FOOTER_RUNTIME_DESCRIPTOR) == 1) {
        "$TARGET_DESCRIPTOR must contain exactly one Symbol Footer delegate"
    }
    check(instructions.countMethodReference(FINAL_COLLECT_DESCRIPTOR) == 2)
    check(instructions.countMethodReference(RECEIVER_LAST_USE_DESCRIPTOR) == 1)
}

private fun MutableMethod.expandRegisters(): MutableMethod {
    val stock = implementation ?: error("No instructions in $TARGET_DESCRIPTOR")
    return ImmutableMethod(
        definingClass,
        name,
        parameters,
        returnType,
        accessFlags,
        annotations,
        hiddenApiRestrictions,
        ImmutableMethodImplementation(
            PATCHED_REGISTER_COUNT,
            stock.instructions,
            stock.tryBlocks,
            stock.debugItems,
        ),
    ).toMutable()
}

private fun MutableMethod.singleReturnIndex(): Int {
    val instructions = implementation?.instructions ?: error("No instructions in $TARGET_DESCRIPTOR")
    val returns = returnInstructionIndices().filter {
        instructions[it].normalizedOpcode() == "RETURN_OBJECT"
    }
    check(returns.size == 1) {
        "$TARGET_DESCRIPTOR must contain exactly one RETURN_OBJECT"
    }
    return returns.single()
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction?.isExactMove(
    opcode: String,
    destination: Int,
    source: Int,
): Boolean =
    this?.normalizedOpcode() == opcode &&
        this is TwoRegisterInstruction &&
        registerA == destination &&
        registerB == source

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction?.isExactOneRegister(
    opcode: String,
    register: Int,
): Boolean =
    this?.normalizedOpcode() == opcode &&
        this is OneRegisterInstruction &&
        registerA == register

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction?.isExactFooterInvoke(): Boolean =
    this?.normalizedOpcode() == "INVOKE_STATIC" &&
        methodDescriptor() == FOOTER_RUNTIME_DESCRIPTOR &&
        this is FiveRegisterInstruction &&
        registerCount == 2 &&
        registerC == PATCHED_P0_REGISTER &&
        registerD == LEGACY_P0_REGISTER

private fun List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>
    .countMethodReference(descriptor: String): Int = count { it.methodDescriptor() == descriptor }

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.methodDescriptor(): String? =
    ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.normalizedOpcode(): String =
    opcode.name.uppercase().replace('-', '_').replace('/', '_')

private fun buildReorderDelegate(register: Int): String = """
    invoke-static {p0, v$register}, $FOOTER_RUNTIME_DESCRIPTOR

    move-result-object v$register

    check-cast v$register, $TARGET_RETURN_TYPE
""".trimIndent()

private val ENTRY_PARAMETER_COPIES = """
    move-object/from16 v$LEGACY_P0_REGISTER, p0
    move-object/from16 v$LEGACY_P1_REGISTER, p1
    move/from16 v$LEGACY_P2_REGISTER, p2
""".trimIndent()

private const val TARGET_METHOD_NAME = "a"
private const val TARGET_RETURN_TYPE = "Lvai;"
private val TARGET_PARAMETERS = listOf("Landroid/view/inputmethod/EditorInfo;", "Z")
private const val TARGET_DESCRIPTOR =
    "Lgan;->a(Landroid/view/inputmethod/EditorInfo;Z)Lvai;"
private const val RUNTIME_CLASS =
    "Ldev/jason/gboardpatches/extension/symbolfooter/GboardSymbolFooterOrderRuntime;"
private const val FOOTER_RUNTIME_DESCRIPTOR =
    "$RUNTIME_CLASS->reorderExpressionCorpusList" +
        "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"
private const val FINAL_COLLECT_DESCRIPTOR =
    "Lj$/util/stream/Stream;->collect" +
        "(Lj$/util/stream/Collector;)Ljava/lang/Object;"
private const val RECEIVER_LAST_USE_DESCRIPTOR =
    "Lgak;-><init>(Lgan;Landroid/view/inputmethod/EditorInfo;Z)V"
private const val STOCK_REGISTER_COUNT = 15
private const val PATCHED_REGISTER_COUNT = 18
private const val LEGACY_P0_REGISTER = 12
private const val LEGACY_P1_REGISTER = 13
private const val LEGACY_P2_REGISTER = 14
private const val PATCHED_P0_REGISTER = 15
private const val PATCHED_P1_REGISTER = 16
private const val PATCHED_P2_REGISTER = 17
