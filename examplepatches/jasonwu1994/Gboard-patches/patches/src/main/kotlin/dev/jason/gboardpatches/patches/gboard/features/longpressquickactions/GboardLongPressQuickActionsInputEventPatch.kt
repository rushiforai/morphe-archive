package dev.jason.gboardpatches.patches.gboard.features.longpressquickactions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val INPUT_EVENT_RUNTIME_DESCRIPTOR =
    "$LONG_PRESS_QUICK_ACTIONS_RUNTIME_CLASS->maybeHandleInputEvent(Landroid/inputmethodservice/InputMethodService;Ljava/lang/Object;)Z"

internal val LONG_PRESS_QUICK_ACTIONS_INPUT_EVENT_DELEGATE = """
    invoke-static/range {p0 .. p1}, $INPUT_EVENT_RUNTIME_DESCRIPTOR

    move-result v0

    if-eqz v0, :jasondev_continue_long_press_quick_action_event

    return v0
""".trimIndent()

private val LONG_PRESS_QUICK_ACTIONS_INPUT_EVENT_CALL = """
    invoke-static/range {p0 .. p1}, $INPUT_EVENT_RUNTIME_DESCRIPTOR

    move-result v0
""".trimIndent()

private val LONG_PRESS_QUICK_ACTIONS_INPUT_EVENT_BRANCH = """
    if-eqz v0, :jasondev_continue_long_press_quick_action_event

    return v0
""".trimIndent()

internal val gboardLongPressQuickActionsInputEventPatch = bytecodePatch(
    description = "在 17.7.7 Gboard input event dispatcher 前處理 exact editing shortcuts。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val method = findMutableMethodOrThrow(
            GboardLongPressQuickActions1777Bindings.inputEvent,
        )
        method.applyLongPressQuickActionsInputEventDelegate()
    }
}

internal fun MutableMethod.applyLongPressQuickActionsInputEventDelegate() {
        val implementation = implementation
            ?: error("Long-press input event target has no implementation")
        check(implementation.registerCount == 25) {
            "17.7.7 Long-press input event register drift: ${implementation.registerCount}"
        }
        val instructions = implementation.instructions
        val count = instructions.count {
            it.methodDescriptor() == INPUT_EVENT_RUNTIME_DESCRIPTOR
        }
        check(count <= 1) { "Duplicate Long-press input event delegates" }
        if (count == 1) {
            check(instructions.size >= 5)
            val invoke = instructions[0] as? RegisterRangeInstruction
                ?: error("Malformed Long-press input event invoke")
            check(
                instructions[0].methodDescriptor() == INPUT_EVENT_RUNTIME_DESCRIPTOR &&
                    invoke.registerCount == 2 && invoke.startRegister == 23 &&
                    instructions[1].isOneRegister("MOVE_RESULT", 0) &&
                    instructions[2].isOneRegister("IF_EQZ", 0) &&
                    instructions[3].isOneRegister("RETURN", 0) &&
                    instructions[4].opcode.name.normalized() == "NOP"
            ) { "Malformed Long-press input event delegate state" }
            return
        }
        check(instructions.size >= 4)
        val firstMove = instructions[0] as? TwoRegisterInstruction
        val zero = instructions[1] as? NarrowLiteralInstruction
        check(
            instructions[0].opcode.name.normalized() == "MOVE_OBJECT_FROM16" &&
                firstMove?.registerA == 1 && firstMove.registerB == 24 &&
                instructions[1].opcode.name.normalized() == "CONST_4" &&
                (instructions[1] as? OneRegisterInstruction)?.registerA == 2 &&
                zero?.narrowLiteral == 0 &&
                instructions[2].isOneRegister("IF_NEZ", 1) &&
                instructions[3].isOneRegister("RETURN", 2)
        ) {
            "Stock entry drift in ${GboardLongPressQuickActions1777Bindings.inputEvent.descriptor()}: " +
                instructions.take(4).joinToString { instruction ->
                    instruction.opcode.name + ":" +
                        (instruction as? OneRegisterInstruction)?.registerA + ":" +
                        (instruction as? TwoRegisterInstruction)?.registerB
                } + "; refs=" + instructions.mapNotNull { it.methodDescriptor() }.take(8)
        }

        addInstructions(0, "nop")
        val continuation = this.implementation!!.instructions[0]
        addInstructionsWithLabels(
            0,
            LONG_PRESS_QUICK_ACTIONS_INPUT_EVENT_BRANCH,
            ExternalLabel(
                "jasondev_continue_long_press_quick_action_event",
                continuation,
            ),
        )
        addInstructions(0, LONG_PRESS_QUICK_ACTIONS_INPUT_EVENT_CALL)
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.isOneRegister(
    opcode: String,
    register: Int,
): Boolean = this is OneRegisterInstruction &&
    this.opcode.name.normalized() == opcode && registerA == register

private fun String.normalized(): String = uppercase().replace('-', '_').replace('/', '_')

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.methodDescriptor(): String? =
    ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()
