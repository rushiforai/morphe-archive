package dev.jason.gboardpatches.patches.gboard.features.longpressquickactions

import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import dev.jason.gboardpatches.patches.gboard.shared.GboardPointerOwnerRegisterContract
import dev.jason.gboardpatches.patches.gboard.shared.GboardPointerOwnerFeature
import dev.jason.gboardpatches.patches.gboard.shared.GboardPointerOwnerFeatureSpec
import dev.jason.gboardpatches.patches.gboard.shared.GboardPointerOwnerTransformationContext
import dev.jason.gboardpatches.patches.gboard.shared.GboardPointerOwnerTransformationAdapter
import dev.jason.gboardpatches.patches.gboard.shared.isInvoke
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.gboard.shared.gboardPointerOwnerFeaturePatch
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId

private val POINTER_OWNER_RUNTIME_CALL =
    RuntimeCallId.LONG_PRESS_QUICK_ACTIONS_RUNTIME_MAYBE_ENSURE_LONG_PRESS_SCHEDULED
private val POINTER_OWNER_RUNTIME_DESCRIPTOR = RuntimeAbiCatalog.abi(POINTER_OWNER_RUNTIME_CALL).reference

internal val LONG_PRESS_QUICK_ACTIONS_POINTER_OWNER_DELEGATE = """
    ${RuntimeCallEmitter.invoke(POINTER_OWNER_RUNTIME_CALL, "p0 .. p1")}
""".trimIndent()

internal val gboardLongPressQuickActionsPointerOwnerTransformation =
    GboardPointerOwnerTransformationAdapter { context ->
        context.replacePointerOwnerMethod(
            context.pointerOwnerMethod.applyLongPressQuickActionsPointerOwnerDelegate(),
        )
}

private val gboardLongPressQuickActionsPointerOwnerSpec = GboardPointerOwnerFeatureSpec(
    feature = GboardPointerOwnerFeature.LONG_PRESS_QUICK_ACTIONS,
    transformation = gboardLongPressQuickActionsPointerOwnerTransformation,
)

internal val gboardLongPressQuickActionsPointerOwnerPatch = gboardPointerOwnerFeaturePatch(
    description = "在 18.0.3 pointer owner 完成後補用 Gboard stock long-press scheduler。",
    spec = gboardLongPressQuickActionsPointerOwnerSpec,
)

internal fun MutableMethod.applyLongPressQuickActionsPointerOwnerDelegate(): MutableMethod {
    val implementation = implementation ?: error("Long-press pointer owner has no implementation")
    if (implementation.registerCount == POINTER_OWNER_PATCHED_REGISTER_COUNT) {
        validateLongPressPointerOwnerDelegate()
        return this
    }
    check(implementation.registerCount == POINTER_OWNER_STOCK_REGISTER_COUNT) {
        "Unexpected register count in " +
            "${GboardVersionBindings.pointerOwner.reference}: " +
            implementation.registerCount
    }

    val expanded = expandLongPressPointerOwnerRegisters()
    expanded.addInstructions(0, POINTER_OWNER_ENTRY_PARAMETER_COPIES)
    expanded.returnInstructionIndices().asReversed().forEach { returnIndex ->
        expanded.addInstructions(
            returnIndex,
            LONG_PRESS_QUICK_ACTIONS_POINTER_OWNER_DELEGATE,
        )
    }
    expanded.validateLongPressPointerOwnerDelegate()
    return expanded
}

private fun MutableMethod.expandLongPressPointerOwnerRegisters(): MutableMethod {
    val stock = implementation ?: error("Long-press pointer owner has no implementation")
    return ImmutableMethod(
        definingClass,
        name,
        parameters,
        returnType,
        accessFlags,
        annotations,
        hiddenApiRestrictions,
        ImmutableMethodImplementation(
            POINTER_OWNER_PATCHED_REGISTER_COUNT,
            stock.instructions,
            stock.tryBlocks,
            stock.debugItems,
        ),
    ).toMutable()
}

private fun MutableMethod.validateLongPressPointerOwnerDelegate() {
    val implementation = implementation ?: error("Long-press pointer owner has no implementation")
    check(implementation.registerCount == POINTER_OWNER_PATCHED_REGISTER_COUNT)
    val instructions = implementation.instructions
    val copies = listOf(
        Triple(0, Opcode.MOVE_OBJECT_FROM16, POINTER_OWNER_LEGACY_P0_REGISTER to POINTER_OWNER_PATCHED_P0_REGISTER),
        Triple(1, Opcode.MOVE_OBJECT_FROM16, POINTER_OWNER_LEGACY_P1_REGISTER to POINTER_OWNER_PATCHED_P1_REGISTER),
        Triple(2, Opcode.MOVE_FROM16, POINTER_OWNER_LEGACY_P2_REGISTER to POINTER_OWNER_PATCHED_P2_REGISTER),
        Triple(3, Opcode.MOVE_FROM16, POINTER_OWNER_LEGACY_P3_REGISTER to POINTER_OWNER_PATCHED_P3_REGISTER),
        Triple(4, Opcode.MOVE_WIDE_FROM16, POINTER_OWNER_LEGACY_P4_REGISTER to POINTER_OWNER_PATCHED_P4_REGISTER),
        Triple(5, Opcode.MOVE_FROM16, POINTER_OWNER_LEGACY_P6_REGISTER to POINTER_OWNER_PATCHED_P6_REGISTER),
    )
    check(copies.all { (index, opcode, registers) ->
        instructions.getOrNull(index).isExactMove(opcode, registers.first, registers.second)
    }) {
        "Long-press pointer owner parameter copies are missing or malformed"
    }
    val returns = returnInstructionIndices().filter {
        instructions[it].opcode == Opcode.RETURN_VOID
    }
    check(returns.isNotEmpty()) { "Long-press pointer owner has no RETURN_VOID" }
    check(returns.all { returnIndex ->
        instructions.getOrNull(returnIndex - 1)?.isInvoke(
            "INVOKE_STATIC_RANGE",
            POINTER_OWNER_RUNTIME_DESCRIPTOR,
            POINTER_OWNER_PATCHED_P0_REGISTER,
            POINTER_OWNER_PATCHED_P1_REGISTER,
        ) == true
    }) {
        "Long-press pointer return delegates are missing or malformed"
    }
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction?.isExactMove(
    opcode: Opcode,
    destination: Int,
    source: Int,
): Boolean =
    this is TwoRegisterInstruction &&
        this.opcode == opcode &&
        registerA == destination &&
        registerB == source

private val POINTER_OWNER_ENTRY_PARAMETER_COPIES = """
    move-object/from16 v$POINTER_OWNER_LEGACY_P0_REGISTER, p0
    move-object/from16 v$POINTER_OWNER_LEGACY_P1_REGISTER, p1
    move/from16 v$POINTER_OWNER_LEGACY_P2_REGISTER, p2
    move/from16 v$POINTER_OWNER_LEGACY_P3_REGISTER, p3
    move-wide/from16 v$POINTER_OWNER_LEGACY_P4_REGISTER, p4
    move/from16 v$POINTER_OWNER_LEGACY_P6_REGISTER, p6
""".trimIndent()

private const val POINTER_OWNER_STOCK_REGISTER_COUNT =
    GboardPointerOwnerRegisterContract.stockRegisterCount
private const val POINTER_OWNER_PATCHED_REGISTER_COUNT =
    GboardPointerOwnerRegisterContract.expandedRegisterCount
private const val POINTER_OWNER_LEGACY_P0_REGISTER =
    GboardPointerOwnerRegisterContract.legacyP0Register
private const val POINTER_OWNER_LEGACY_P1_REGISTER =
    GboardPointerOwnerRegisterContract.legacyP1Register
private const val POINTER_OWNER_LEGACY_P2_REGISTER =
    GboardPointerOwnerRegisterContract.legacyP2Register
private const val POINTER_OWNER_LEGACY_P3_REGISTER =
    GboardPointerOwnerRegisterContract.legacyP3Register
private const val POINTER_OWNER_LEGACY_P4_REGISTER =
    GboardPointerOwnerRegisterContract.legacyP4Register
private const val POINTER_OWNER_LEGACY_P6_REGISTER =
    GboardPointerOwnerRegisterContract.legacyP6Register
private const val POINTER_OWNER_PATCHED_P0_REGISTER =
    GboardPointerOwnerRegisterContract.expandedP0Register
private const val POINTER_OWNER_PATCHED_P1_REGISTER =
    GboardPointerOwnerRegisterContract.expandedP1Register
private const val POINTER_OWNER_PATCHED_P2_REGISTER =
    GboardPointerOwnerRegisterContract.expandedP2Register
private const val POINTER_OWNER_PATCHED_P3_REGISTER =
    GboardPointerOwnerRegisterContract.expandedP3Register
private const val POINTER_OWNER_PATCHED_P4_REGISTER =
    GboardPointerOwnerRegisterContract.expandedP4Register
private const val POINTER_OWNER_PATCHED_P6_REGISTER =
    GboardPointerOwnerRegisterContract.expandedP6Register
