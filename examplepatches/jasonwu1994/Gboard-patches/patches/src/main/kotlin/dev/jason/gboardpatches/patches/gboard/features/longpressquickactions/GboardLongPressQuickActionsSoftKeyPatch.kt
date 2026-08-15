package dev.jason.gboardpatches.patches.gboard.features.longpressquickactions

import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationPlan
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationState
import dev.jason.gboardpatches.patches.gboard.shared.applyVerified
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardStructuralFingerprint
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private val SOFT_KEY_RUNTIME_DESCRIPTOR = RuntimeAbiCatalog.abi(
    RuntimeCallId.LONG_PRESS_QUICK_ACTIONS_RUNTIME_MAYBE_PATCH_METADATA,
).reference
private const val SOFT_KEY_STOCK_ENTRY_STRING = "SoftKeyView.setSoftKeyDef"
private val KNOWN_SOFT_KEY_AFTER_BIND_DELEGATES = mapOf(
    RuntimeAbiCatalog.abi(RuntimeCallId.SPACEBAR_LOGO_RUNTIME_AFTER_SOFT_KEY_BOUND).reference to
        listOf(0, 1),
    RuntimeAbiCatalog.abi(RuntimeCallId.TOP_ROW_SWIPE_RUNTIME_AFTER_SOFT_KEY_BOUND).reference to
        listOf(0),
    RuntimeAbiCatalog.abi(RuntimeCallId.ZHUYIN_BOTTOM_ROW_WEIGHT_RUNTIME_AFTER_SOFT_KEY_BOUND).reference to
        listOf(0),
    RuntimeAbiCatalog.abi(
        RuntimeCallId.ZHUYIN_TRADITIONAL_SIMPLIFIED_TOGGLE_RUNTIME_AFTER_SOFT_KEY_BOUND,
    ).reference to listOf(0),
)

internal val LONG_PRESS_QUICK_ACTIONS_SOFT_KEY_DELEGATE = """
    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.LONG_PRESS_QUICK_ACTIONS_RUNTIME_MAYBE_PATCH_METADATA,
        "p1, p0",
    )}

    move-result-object p1

    check-cast p1, Lowd;
""".trimIndent()

internal val gboardLongPressQuickActionsSoftKeyPatch = bytecodePatch(
    description = "在 17.7.7 SoftKeyView bind 前套用或回復 long-press shortcut metadata。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val method = findMutableMethodOrThrow(
            GboardVersionBindings.softKeyBind,
        )
        method.applyLongPressQuickActionsSoftKeyDelegate()
    }
}

internal fun MutableMethod.applyLongPressQuickActionsSoftKeyDelegate() {
    applyVerified(
        VerifiedTransformationPlan(
            targetName = GboardVersionBindings.softKeyBind.reference,
            classify = MutableMethod::classifyLongPressSoftKey,
            mutate = { method ->
                method.addInstructions(0, LONG_PRESS_QUICK_ACTIONS_SOFT_KEY_DELEGATE)
                method
            },
        ),
    )
}

private fun MutableMethod.classifyLongPressSoftKey(): VerifiedTransformationState {
    val count = implementation!!.instructions.count {
        it.isMethodReference(SOFT_KEY_RUNTIME_DESCRIPTOR)
    }
    val stockEntryIndex = requireLongPressSoftKeyStockBodyFingerprint()
    return when (count) {
        0 -> VerifiedTransformationState.STOCK
        1 -> {
            requireValidLongPressSoftKeyDelegate(stockEntryIndex)
            VerifiedTransformationState.PATCHED
        }
        else -> VerifiedTransformationState.MALFORMED
    }
}

private fun MutableMethod.requireLongPressSoftKeyStockBodyFingerprint(): Int {
    val instructions = implementation!!.instructions
    val stockEntryIndex = instructions.indexOfFirst { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string ==
            SOFT_KEY_STOCK_ENTRY_STRING
    }
    check(stockEntryIndex >= 0) {
        "Missing stock entry anchor in ${GboardVersionBindings.softKeyBind.reference}"
    }
    val normalized = copyWithoutKnownSoftKeyAfterBindDelegates()
    val normalizedStockEntryIndex = normalized.implementation!!.instructions.indexOfFirst { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string ==
            SOFT_KEY_STOCK_ENTRY_STRING
    }
    check(normalizedStockEntryIndex >= 0) {
        "Missing normalized stock entry anchor in ${GboardVersionBindings.softKeyBind.reference}"
    }
    val actual = normalized.gboardStructuralFingerprint(normalizedStockEntryIndex)
    check(actual == GboardLongPressQuickActions1777Fingerprints.softKeyStock) {
        "Stock body drift in ${GboardVersionBindings.softKeyBind.reference}: $actual"
    }
    return stockEntryIndex
}

private fun MutableMethod.copyWithoutKnownSoftKeyAfterBindDelegates(): MutableMethod {
    val stock = implementation ?: error("SoftKey bind target has no implementation")
    val instructions = stock.instructions
    val parameterRegisterCount = parameterTypes.sumOf { type ->
        if (type == "J" || type == "D") 2 else 1
    }
    val p0 = stock.registerCount - parameterRegisterCount - 1
    val delegateIndices = instructions.mapIndexedNotNull { index, instruction ->
        val descriptor = (instruction as? ReferenceInstruction)?.reference?.toString()
            ?: return@mapIndexedNotNull null
        val expectedRegisters = KNOWN_SOFT_KEY_AFTER_BIND_DELEGATES[descriptor]
            ?: return@mapIndexedNotNull null
        val invoke = instruction as? FiveRegisterInstruction
        val actualRegisters = listOfNotNull(
            invoke?.registerC,
            invoke?.registerD?.takeIf { invoke.registerCount >= 2 },
        )
        check(
            instruction.opcode == Opcode.INVOKE_STATIC &&
                invoke?.registerCount == expectedRegisters.size &&
                actualRegisters == expectedRegisters.map(p0::plus),
        ) {
            "Malformed known SoftKey after-bind delegate $descriptor"
        }
        check(
            instructions.drop(index + 1).firstOrNull { following ->
                val followingDescriptor =
                    (following as? ReferenceInstruction)?.reference?.toString()
                followingDescriptor !in KNOWN_SOFT_KEY_AFTER_BIND_DELEGATES
            }?.opcode in setOf(
                Opcode.RETURN,
                Opcode.RETURN_OBJECT,
                Opcode.RETURN_VOID,
                Opcode.RETURN_WIDE,
            ),
        ) {
            "Known SoftKey after-bind delegate is not immediately before a return: $descriptor"
        }
        index
    }
    if (delegateIndices.isEmpty()) return this

    val normalized = ImmutableMethod(
        definingClass,
        name,
        parameters,
        returnType,
        accessFlags,
        annotations,
        hiddenApiRestrictions,
        ImmutableMethodImplementation(
            stock.registerCount,
            stock.instructions,
            stock.tryBlocks,
            stock.debugItems,
        ),
    ).toMutable()
    delegateIndices.asReversed().forEach { index ->
        normalized.implementation!!.removeInstruction(index)
    }
    return normalized
}

private fun MutableMethod.requireValidLongPressSoftKeyDelegate(stockEntryIndex: Int) {
    val instructions = implementation!!.instructions
    val delegateIndex = instructions.indexOfFirst {
        it.isMethodReference(SOFT_KEY_RUNTIME_DESCRIPTOR)
    }
    check(delegateIndex >= 0 && delegateIndex + 2 < stockEntryIndex) {
        "Malformed Long-press SoftKey delegate position"
    }
    val parameterRegisterCount = parameterTypes.sumOf { type ->
        if (type == "J" || type == "D") 2 else 1
    }
    val p0 = implementation!!.registerCount - parameterRegisterCount - 1
    val p1 = p0 + 1
    val invoke = instructions[delegateIndex] as? FiveRegisterInstruction
    val moveResult = instructions[delegateIndex + 1] as? OneRegisterInstruction
    val checkCast = instructions[delegateIndex + 2]
    val checkCastRegister = checkCast as? OneRegisterInstruction
    check(
        invoke?.opcode == Opcode.INVOKE_STATIC &&
            invoke.isMethodReference(SOFT_KEY_RUNTIME_DESCRIPTOR) &&
            invoke.registerCount == 2 &&
            invoke.registerC == p1 &&
            invoke.registerD == p0 &&
            moveResult?.opcode == Opcode.MOVE_RESULT_OBJECT &&
            moveResult.registerA == p1 &&
            checkCast.opcode == Opcode.CHECK_CAST &&
            checkCastRegister?.registerA == p1 &&
            (checkCast as? ReferenceInstruction)?.reference?.toString() == "Lowd;",
    ) {
        "Malformed Long-press SoftKey delegate sequence"
    }
}

internal fun MutableMethod.requireLongPressStockFingerprint(
    expected: String,
    descriptor: String,
) {
    val actual = gboardStructuralFingerprint()
    check(actual == expected) { "Stock body drift in $descriptor: $actual" }
}
