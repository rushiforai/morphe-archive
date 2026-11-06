package dev.jason.gboardpatches.patches.gboard.features.splitkeyboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.isOpcode
import dev.jason.gboardpatches.patches.gboard.shared.mutableFieldOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardSplitKeyboardAccessPointPatch = bytecodePatch(
    description = "啟用 split Access Point 狀態並補入 Access Points 排序清單",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        mutableFieldOrThrow(GboardSplitKeyboard1803Targets.accessPointName)
        findMutableMethodOrThrow(GboardSplitKeyboard1803Targets.accessPointState)
            .applySplitKeyboardAccessPointStateDelegate()
        findMutableMethodOrThrow(GboardSplitKeyboard1803Targets.accessPointOrder)
            .applySplitKeyboardAccessPointOrderDelegate()
    }
}

internal fun MutableMethod.applySplitKeyboardAccessPointStateDelegate() {
    val abi = RuntimeAbiCatalog.abi(
        RuntimeCallId.SPLIT_KEYBOARD_RUNTIME_APPLY_ACCESS_POINT_STATE,
    )
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val existing = instructions.count { it.isMethodReference(abi.reference) }
    if (existing > 0) {
        check(existing == 1) { "Duplicate split Access Point state delegate" }
        return
    }
    addInstructions(
        0,
        """
            iget-object v0, p0, ${GboardSplitKeyboard1803Targets.accessPointName.reference}

            ${RuntimeCallEmitter.invoke(
                RuntimeCallId.SPLIT_KEYBOARD_RUNTIME_APPLY_ACCESS_POINT_STATE,
                "v0, p1",
            )}

            move-result p1
        """.trimIndent(),
    )
}

internal fun MutableMethod.applySplitKeyboardAccessPointOrderDelegate() {
    val abi = RuntimeAbiCatalog.abi(
        RuntimeCallId.SPLIT_KEYBOARD_RUNTIME_INCLUDE_ACCESS_POINT_IN_ORDER,
    )
    val instructions = implementation?.instructions
        ?: error("No instructions in $definingClass->$name")
    val existing = instructions.count { it.isMethodReference(abi.reference) }
    if (existing > 0) {
        check(existing == 1) { "Duplicate split Access Point order delegate" }
        return
    }
    val returns = returnInstructionIndices().filter { instructions[it].isOpcode("RETURN_OBJECT") }
    check(returns.size == 1) { "Expected one Access Point order return, found ${returns.size}" }
    val resultRegister = (instructions[returns.single()] as OneRegisterInstruction).registerA
    addInstructions(
        returns.single(),
        """
            ${RuntimeCallEmitter.invoke(
                RuntimeCallId.SPLIT_KEYBOARD_RUNTIME_INCLUDE_ACCESS_POINT_IN_ORDER,
                "v$resultRegister",
            )}

            move-result-object v$resultRegister

            check-cast v$resultRegister, ${GboardSplitKeyboard1803Targets.ORDER_RETURN_TYPE}
        """.trimIndent(),
    )
}
