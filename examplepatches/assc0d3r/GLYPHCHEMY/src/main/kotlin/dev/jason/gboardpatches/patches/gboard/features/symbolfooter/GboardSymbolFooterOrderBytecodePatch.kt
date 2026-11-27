package dev.jason.gboardpatches.patches.gboard.features.symbolfooter

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import dev.jason.gboardpatches.patches.gboard.shared.GboardExpressionCorpusPatchState
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationPlan
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationState
import dev.jason.gboardpatches.patches.gboard.shared.applyVerified
import dev.jason.gboardpatches.patches.gboard.shared.gboardCompatibility18_8
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.isInvoke
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.isOpcode
import dev.jason.gboardpatches.patches.gboard.shared.isRegisterOperation
import dev.jason.gboardpatches.patches.gboard.shared.mutableClass
import dev.jason.gboardpatches.patches.gboard.shared.requireGboardExpressionCorpusPatchState
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId

internal val gboardSymbolFooterOrderBytecodePatch = bytecodePatch(
    description = "依使用者設定重排 expression footer corpus list。"
) {
    compatibleWith(gboardCompatibility18_8())
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val targets = symbolFooterOrderTargets(this)
        val methods = mutableClass(targets.corpusList.ownerDescriptor).methods.filter {
            targets.corpusList.matches(it)
        }
        check(methods.size == 1) {
            "Expected exactly one ${targets.corpusList.reference} target"
        }
        val mutableMethod = methods.single()
        val patchedMethod = mutableMethod.applySymbolFooterOrderDelegate(targets)
        if (patchedMethod !== mutableMethod) {
            val ownerMethods = mutableClass(targets.corpusList.ownerDescriptor).methods
            check(ownerMethods.remove(mutableMethod) && ownerMethods.add(patchedMethod)) {
                "Could not replace expanded ${targets.corpusList.reference}"
            }
        }
    }
}

internal fun MutableMethod.applySymbolFooterOrderDelegate(
    targets: SymbolFooterOrderTargets,
): MutableMethod {
    requireExactTarget(targets)
    return applyVerified(
        VerifiedTransformationPlan(
            targetName = targets.corpusList.reference,
            classify = { stock -> stock.classifySymbolFooterOrder(targets) },
            mutate = { stock ->
                stock.expandRegisters(targets).also { expanded ->
                    expanded.addInstructions(0, ENTRY_PARAMETER_COPIES)
                    expanded.addInstructions(
                        expanded.singleReturnIndex(targets),
                        buildReorderDelegate(LEGACY_P0_REGISTER, targets.corpusList.returnType),
                    )
                }
            },
        ),
    )
}

private fun MutableMethod.classifySymbolFooterOrder(
    targets: SymbolFooterOrderTargets,
): VerifiedTransformationState =
    when (
        requireGboardExpressionCorpusPatchState(targets.corpusList, targets.fingerprints)
    ) {
        GboardExpressionCorpusPatchState.STOCK,
        GboardExpressionCorpusPatchState.CUSTOM_ONLY -> {
            val registerCount = implementation?.registerCount
                ?: error("No instructions in ${targets.corpusList.reference}")
            check(registerCount == STOCK_REGISTER_COUNT) {
                "Unexpected register count in ${targets.corpusList.reference}: $registerCount"
            }
            validateStockShape(targets)
            VerifiedTransformationState.STOCK
        }
        GboardExpressionCorpusPatchState.TAB_ONLY,
        GboardExpressionCorpusPatchState.COMPOSED -> {
            validateCompletedPatch(targets)
            VerifiedTransformationState.PATCHED
        }
    }

private fun MutableMethod.requireExactTarget(targets: SymbolFooterOrderTargets) {
    check(targets.corpusList.matches(this)) {
        "Refusing non-target Symbol Footer method " +
            "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
    }
}

private fun MutableMethod.validateStockShape(targets: SymbolFooterOrderTargets) {
    val implementation = implementation
        ?: error("No instructions in ${targets.corpusList.reference}")
    val instructions = implementation.instructions
    check(singleReturnIndex(targets) == instructions.lastIndex) {
        "${targets.corpusList.reference} must end at its single RETURN_OBJECT"
    }
    check((instructions.last() as OneRegisterInstruction).registerA == LEGACY_P0_REGISTER) {
        "${targets.corpusList.reference} must return legacy p0/v$LEGACY_P0_REGISTER"
    }
    check(instructions.count { it.isMethodReference(FINAL_COLLECT_DESCRIPTOR) } == 2) {
        "${targets.corpusList.reference} must contain exactly two Stream.collect calls"
    }
    check(instructions.count { it.isMethodReference(targets.receiverConstructor) } == 1) {
        "${targets.corpusList.reference} must contain the exact final original-receiver use"
    }
    check(instructions.count { it.isMethodReference(FOOTER_RUNTIME_DESCRIPTOR) } == 0) {
        "${targets.corpusList.reference} contains an orphan Symbol Footer delegate"
    }
}

private fun MutableMethod.validateCompletedPatch(targets: SymbolFooterOrderTargets) {
    requireExactTarget(targets)
    val implementation = implementation
        ?: error("No instructions in ${targets.corpusList.reference}")
    check(implementation.registerCount == PATCHED_REGISTER_COUNT) {
        "Malformed expanded register state in ${targets.corpusList.reference}"
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
        "${targets.corpusList.reference} entry parameter copies are missing or malformed"
    }
    val returnIndex = singleReturnIndex(targets)
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
        "${targets.corpusList.reference} final Symbol Footer delegate is missing or malformed"
    }
    check(instructions.count { it.isMethodReference(FOOTER_RUNTIME_DESCRIPTOR) } == 1) {
        "${targets.corpusList.reference} must contain exactly one Symbol Footer delegate"
    }
    check(instructions.count { it.isMethodReference(FINAL_COLLECT_DESCRIPTOR) } == 2)
    check(instructions.count { it.isMethodReference(targets.receiverConstructor) } == 1)
}

private fun MutableMethod.expandRegisters(targets: SymbolFooterOrderTargets): MutableMethod {
    val stock = implementation
        ?: error("No instructions in ${targets.corpusList.reference}")
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

private fun MutableMethod.singleReturnIndex(targets: SymbolFooterOrderTargets): Int {
    val instructions = implementation?.instructions
        ?: error("No instructions in ${targets.corpusList.reference}")
    val returns = returnInstructionIndices().filter {
        instructions[it].isOpcode("RETURN_OBJECT")
    }
    check(returns.size == 1) {
        "${targets.corpusList.reference} must contain exactly one RETURN_OBJECT"
    }
    return returns.single()
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction?.isExactMove(
    opcode: String,
    destination: Int,
    source: Int,
): Boolean =
    this?.isOpcode(opcode) == true &&
        this is TwoRegisterInstruction &&
        registerA == destination &&
        registerB == source

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction?.isExactOneRegister(
    opcode: String,
    register: Int,
): Boolean =
    this?.isRegisterOperation(opcode, register) == true

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction?.isExactFooterInvoke(): Boolean =
    this?.isInvoke(
        "INVOKE_STATIC",
        FOOTER_RUNTIME_DESCRIPTOR,
        PATCHED_P0_REGISTER,
        LEGACY_P0_REGISTER,
    ) == true

private fun buildReorderDelegate(register: Int, returnType: String): String = """
    ${RuntimeCallEmitter.invoke(FOOTER_RUNTIME_CALL, "p0, v$register")}

    move-result-object v$register

    check-cast v$register, $returnType
""".trimIndent()

private val ENTRY_PARAMETER_COPIES = """
    move-object/from16 v$LEGACY_P0_REGISTER, p0
    move-object/from16 v$LEGACY_P1_REGISTER, p1
    move/from16 v$LEGACY_P2_REGISTER, p2
""".trimIndent()

private val FOOTER_RUNTIME_CALL =
    RuntimeCallId.SYMBOL_FOOTER_ORDER_RUNTIME_REORDER_EXPRESSION_CORPUS_LIST
private val FOOTER_RUNTIME_DESCRIPTOR = RuntimeAbiCatalog.abi(FOOTER_RUNTIME_CALL).reference
private const val FINAL_COLLECT_DESCRIPTOR =
    "Lj$/util/stream/Stream;->collect" +
        "(Lj$/util/stream/Collector;)Ljava/lang/Object;"
private const val STOCK_REGISTER_COUNT = 14
private const val PATCHED_REGISTER_COUNT = 17
private const val LEGACY_P0_REGISTER = 11
private const val LEGACY_P1_REGISTER = 12
private const val LEGACY_P2_REGISTER = 13
private const val PATCHED_P0_REGISTER = 14
private const val PATCHED_P1_REGISTER = 15
private const val PATCHED_P2_REGISTER = 16
