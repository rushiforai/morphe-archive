package dev.jason.gboardpatches.patches.gboard.features.longpressquickactions

import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget
import dev.jason.gboardpatches.patches.gboard.shared.gboardCompatibility18_8
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.selectReleaseTargets

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationPlan
import dev.jason.gboardpatches.patches.gboard.shared.VerifiedTransformationState
import dev.jason.gboardpatches.patches.gboard.shared.applyVerified
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.isInvoke
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.isOpcode
import dev.jason.gboardpatches.patches.gboard.shared.isRegisterOperation
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId

private val INPUT_EVENT_RUNTIME_CALL =
    RuntimeCallId.LONG_PRESS_QUICK_ACTIONS_RUNTIME_MAYBE_HANDLE_INPUT_EVENT
private val INPUT_EVENT_RUNTIME_DESCRIPTOR = RuntimeAbiCatalog.abi(INPUT_EVENT_RUNTIME_CALL).reference

/**
 * 18.8.0 renamed the dispatcher class (`Lpbk;` -> `Lafae;`, proved by fourteen members the proposer
 * matched in that class) and the event parameter (`Loak;` -> `Ladan;`). The stock entry the
 * classifier checks is unchanged: `move-object/from16 v1, v27` copies the event, `if-nez` guards it,
 * `const/4 v2, 0` materialises the default and `return v2` leaves. 28 registers puts the receiver at
 * v26 and the event at v27, which is the register the stock move reads.
 */
private val GBOARD_LONG_PRESS_INPUT_EVENT_18_8 = GboardMethodTarget(
    classType = "Lafae;",
    name = "ay",
    parameterTypes = listOf("Ladan;"),
    returnType = "Z",
)

/** Chooses by what the APK declares so a build the projection cannot describe still resolves. */
private fun longPressInputEventTarget(context: BytecodePatchContext): GboardMethodTarget =
    selectReleaseTargets(
        context = context,
        projection = { GboardVersionBindings.longPressQuickActionsInputEvent },
        probe = { target -> target },
        audited = GBOARD_LONG_PRESS_INPUT_EVENT_18_8,
    )

internal val LONG_PRESS_QUICK_ACTIONS_INPUT_EVENT_DELEGATE = """
    ${RuntimeCallEmitter.invoke(INPUT_EVENT_RUNTIME_CALL, "p0 .. p1")}

    move-result v0

    if-eqz v0, :jasondev_continue_long_press_quick_action_event

    return v0
""".trimIndent()

private val LONG_PRESS_QUICK_ACTIONS_INPUT_EVENT_CALL = """
    ${RuntimeCallEmitter.invoke(INPUT_EVENT_RUNTIME_CALL, "p0 .. p1")}

    move-result v0
""".trimIndent()

private val LONG_PRESS_QUICK_ACTIONS_INPUT_EVENT_BRANCH = """
    if-eqz v0, :jasondev_continue_long_press_quick_action_event

    return v0
""".trimIndent()

internal val gboardLongPressQuickActionsInputEventPatch = bytecodePatch(
    description = "在 18.0.3 Gboard input event dispatcher 前處理 exact editing shortcuts。",
) {
    compatibleWith(gboardCompatibility18_8())
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val target = longPressInputEventTarget(this)
        findMutableMethodOrThrow(target)
            .applyLongPressQuickActionsInputEventDelegate(target)
    }
}

internal fun MutableMethod.applyLongPressQuickActionsInputEventDelegate(target: GboardMethodTarget) {
    applyVerified(
        VerifiedTransformationPlan(
            targetName = target.reference,
            classify = { method -> method.classifyLongPressInputEvent(target) },
            mutate = { method ->
                method.addInstructions(0, "nop")
                val continuation = method.implementation!!.instructions[0]
                method.addInstructionsWithLabels(
                    0,
                    LONG_PRESS_QUICK_ACTIONS_INPUT_EVENT_BRANCH,
                    ExternalLabel(
                        "jasondev_continue_long_press_quick_action_event",
                        continuation,
                    ),
                )
                method.addInstructions(0, LONG_PRESS_QUICK_ACTIONS_INPUT_EVENT_CALL)
                method
            },
        ),
    )
}

private fun MutableMethod.classifyLongPressInputEvent(
    target: GboardMethodTarget,
): VerifiedTransformationState {
    val implementation = implementation
        ?: error("Long-press input event target has no implementation")
    val layout = inputEventRegisterLayout(target, implementation.registerCount)
    val instructions = implementation.instructions
    return when (instructions.count { it.isMethodReference(INPUT_EVENT_RUNTIME_DESCRIPTOR) }) {
        0 -> {
            check(instructions.hasLongPressInputStockEntry(0, layout.eventRegister)) {
                "Stock entry drift in " +
                    "${target.reference}: " +
                    instructions.take(4).joinToString { instruction ->
                        instruction.opcode.name + ":" +
                            (instruction as? OneRegisterInstruction)?.registerA + ":" +
                            (instruction as? TwoRegisterInstruction)?.registerB
                    }
            }
            VerifiedTransformationState.STOCK
        }
        1 -> if (
            instructions.size >= 5 &&
            instructions[0].isInvoke(
                "INVOKE_STATIC_RANGE",
                INPUT_EVENT_RUNTIME_DESCRIPTOR,
                layout.receiverRegister,
                layout.eventRegister,
            ) &&
            instructions[1].isRegisterOperation("MOVE_RESULT", 0) &&
            instructions[2].isRegisterOperation("IF_EQZ", 0) &&
            instructions[3].isRegisterOperation("RETURN", 0) &&
            instructions[4].isOpcode("NOP") &&
            instructions.hasExactBranchTarget(2, 4) &&
            instructions.hasLongPressInputStockEntry(5, layout.eventRegister)
        ) {
            VerifiedTransformationState.PATCHED
        } else {
            VerifiedTransformationState.MALFORMED
        }
        else -> VerifiedTransformationState.MALFORMED
    }
}

private fun List<Instruction>.hasLongPressInputStockEntry(
    startIndex: Int,
    eventRegister: Int,
): Boolean {
    if (size < startIndex + 4) return false
    val firstMove = this[startIndex] as? TwoRegisterInstruction ?: return false
    if (!this[startIndex].isOpcode("MOVE_OBJECT_FROM16")) return false
    if (firstMove.registerB != eventRegister) return false
    // 18.6.3 emits the const/4 default and the if-nez guard in either order; both decode to the
    // same stock shape (move-object, const/4 v,0, if-nez vArg, return vConst).
    val candidates = listOf(this[startIndex + 1], this[startIndex + 2])
    val zero = candidates.firstOrNull { it.isOpcode("CONST_4") } as? NarrowLiteralInstruction
        ?: return false
    if (zero.narrowLiteral != 0) return false
    val zeroRegister = (zero as OneRegisterInstruction).registerA
    val guard = candidates.firstOrNull { it.isOpcode("IF_NEZ") } as? OneRegisterInstruction
        ?: return false
    if (guard.registerA != firstMove.registerA) return false
    return this[startIndex + 3].isRegisterOperation("RETURN", zeroRegister)
}

private data class InputEventRegisterLayout(
    val receiverRegister: Int,
    val eventRegister: Int,
)

private fun inputEventRegisterLayout(
    target: GboardMethodTarget,
    registerCount: Int,
): InputEventRegisterLayout {
    val binding = target
    check(binding.parameterTypes.size == 1 && binding.returnType == "Z") {
        "Long-press input event prototype drift: ${binding.reference}"
    }
    val parameterWordCount = 1 + binding.parameterTypes.sumOf { type ->
        if (type == "J" || type == "D") 2 else 1
    }
    val receiverRegister = registerCount - parameterWordCount
    val eventRegister = receiverRegister + 1
    check(receiverRegister >= 0 && eventRegister < registerCount) {
        "Long-press input event register layout is smaller than its prototype"
    }
    return InputEventRegisterLayout(receiverRegister, eventRegister)
}

private fun List<Instruction>.hasExactBranchTarget(
    branchIndex: Int,
    targetIndex: Int,
): Boolean {
    val branch = getOrNull(branchIndex) as? OffsetInstruction ?: return false
    if (targetIndex !in indices) return false
    return codeAddressOf(branchIndex) + branch.codeOffset == codeAddressOf(targetIndex)
}

private fun List<Instruction>.codeAddressOf(index: Int): Int =
    take(index).sumOf { instruction -> instruction.codeUnits }
