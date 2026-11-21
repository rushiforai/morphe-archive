package dev.jason.gboardpatches.patches.gboard.features.wisprflow

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget
import dev.jason.gboardpatches.patches.gboard.features.editingaccesspoints.GboardEditingAccessPointsTargets
import dev.jason.gboardpatches.patches.gboard.shared.applyVoidExitLifecycleDelegate
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardWisprFlowLifecyclePatch = bytecodePatch(
    description = "Attach Wispr Flow controls to the Gboard input view lifecycle.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)
    execute {
        val targets = GboardEditingAccessPointsTargets
        targets.validate(this)
        targets.resetMethods.filterNot { it == targets.startView }.forEach { target ->
            findMutableMethodOrThrow(target).addInstructions(
                0, RuntimeCallEmitter.invoke(RuntimeCallId.WISPR_FLOW_INPUT_VIEW_ENDED, ""),
            )
        }
        findMutableMethodOrThrow(targets.startView).applyVoidExitLifecycleDelegate(
            RuntimeCallId.WISPR_FLOW_INPUT_VIEW_STARTED, "p0 .. p0",
        )
        findMutableMethodOrThrow(GboardMethodTarget("Lflb;", "G", emptyList(), "Lmtr;"))
            .wireWisprFinishAction()
        findMutableMethodOrThrow(GboardMethodTarget("Lflz;", "D", emptyList(), "Lmtr;"))
            .selectWisprCloseAction()
    }
}

private fun MutableMethod.wireWisprFinishAction() {
    val body = checkNotNull(implementation)
    val instructions = body.instructions.toList()
    val stockAction = instructions.indexOfFirst { it.isMethodReference("Lvec;->aT(Lmtm;)V") }
    check(stockAction > 0 && body.registerCount == 5 &&
        instructions[stockAction + 1].isMethodReference("Lvec;->aM(Lmtm;)Lmtm;"))
    val originalResult = instructions[stockAction - 1]
    check(originalResult.opcode == Opcode.MOVE_RESULT_OBJECT &&
        (originalResult as OneRegisterInstruction).registerA == 4 &&
        instructions[stockAction + 2].opcode == Opcode.MOVE_RESULT_OBJECT)

    replaceInstruction(stockAction - 1, "move-result-object v1")
    addInstructionsWithLabels(
        stockAction,
        """
            ${RuntimeCallEmitter.invoke(RuntimeCallId.WISPR_FLOW_NATIVE_FINISH_ACTION, "p0")}
            move-result-object v2
            move-object v4, v1
            if-eqz v2, :stock_action
            invoke-virtual {v4, v2}, Lmtm;->q(Ljava/lang/Runnable;)V
            goto :configure_button
        """.trimIndent(),
        ExternalLabel("stock_action", instructions[stockAction]),
        ExternalLabel("configure_button", instructions[stockAction + 3]),
    )
}

private fun MutableMethod.selectWisprCloseAction() {
    val instructions = checkNotNull(implementation).instructions.toList()
    val close = instructions.single { it.isMethodReference("Lflb;->u()I") }
    addInstructionsWithLabels(
        0,
        """
            ${RuntimeCallEmitter.invoke(RuntimeCallId.WISPR_FLOW_NATIVE_FINISH_ACTION, "p0")}
            move-result-object v0
            if-nez v0, :stock_close
        """.trimIndent(),
        ExternalLabel("stock_close", close),
    )
}
