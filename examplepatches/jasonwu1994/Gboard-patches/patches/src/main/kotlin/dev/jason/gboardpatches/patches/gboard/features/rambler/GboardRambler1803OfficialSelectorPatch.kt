package dev.jason.gboardpatches.patches.gboard.features.rambler

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.isMethodReference
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val VOICE_SETTINGS =
    "Lcom/google/android/apps/inputmethod/latin/preference/VoiceSettingsFragment;"

private object GboardRambler1803Targets {
    val layout = method(VOICE_SETTINGS, "aB", emptyList(), "I")
    val setup = method(VOICE_SETTINGS, "ac", emptyList(), "V")
    val create = method(VOICE_SETTINGS, "f", listOf("Landroid/os/Bundle;"), "V")
    val selectionWrite = method(
        VOICE_SETTINGS,
        "aD",
        listOf(
            "Z",
            "Lqhy;",
            "Lcom/google/android/libraries/inputmethod/preferencewidgets/" +
                "CustomSelectorWithWidgetPreference;",
            "Lcom/google/android/libraries/inputmethod/preferencewidgets/" +
                "CustomSelectorWithWidgetPreference;",
        ),
        "V",
    )
    val selectionRead = method("Lmqk;", "a", listOf("Landroid/content/Context;"), "Z")
    val defaultSelection = method("Lfbl;", "hN", emptyList(), "V")

    private fun method(
        owner: String,
        name: String,
        parameters: List<String>,
        returnType: String,
    ) = GboardMethodTarget(owner, name, parameters, returnType)
}

internal val gboardRambler1803OfficialSelectorPatch = bytecodePatch(
    description = "讓 18.0.3 Rambler capability 只在官方 Voice typing selector scope 放行。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        findMutableMethodOrThrow(GboardRambler1803Targets.layout)
            .applyScope(
                RuntimeCallId.RAMBLER_RUNTIME_ENTER_VOICE_SETTINGS_SCOPE,
                RuntimeCallId.RAMBLER_RUNTIME_EXIT_VOICE_SETTINGS_SCOPE,
            )
        findMutableMethodOrThrow(GboardRambler1803Targets.setup)
            .applyScope(
                RuntimeCallId.RAMBLER_RUNTIME_ENTER_VOICE_SETTINGS_SCOPE,
                RuntimeCallId.RAMBLER_RUNTIME_EXIT_VOICE_SETTINGS_SCOPE,
            )
        findMutableMethodOrThrow(GboardRambler1803Targets.create)
            .applyScope(
                RuntimeCallId.RAMBLER_RUNTIME_ENTER_VOICE_SETTINGS_SCOPE,
                RuntimeCallId.RAMBLER_RUNTIME_EXIT_VOICE_SETTINGS_SCOPE,
            )
        findMutableMethodOrThrow(GboardRambler1803Targets.selectionWrite)
            .applySelectionWriteObserver()
        findMutableMethodOrThrow(GboardRambler1803Targets.selectionRead)
            .applySelectionReadObserver()
        findMutableMethodOrThrow(GboardRambler1803Targets.defaultSelection)
            .applyScope(
                RuntimeCallId.RAMBLER_RUNTIME_ENTER_DEFAULT_SELECTION_SUPPRESSION,
                RuntimeCallId.RAMBLER_RUNTIME_EXIT_DEFAULT_SELECTION_SUPPRESSION,
            )
    }
}

private fun MutableMethod.applyScope(enter: RuntimeCallId, exit: RuntimeCallId) {
    val enterReference = RuntimeAbiCatalog.abi(enter).reference
    val exitReference = RuntimeAbiCatalog.abi(exit).reference
    val instructions = implementation?.instructions
        ?: error("No implementation in $definingClass->$name")
    val enterCount = instructions.count { it.isMethodReference(enterReference) }
    val exitCount = instructions.count { it.isMethodReference(exitReference) }
    val returns = returnInstructionIndices()
    check(returns.isNotEmpty()) { "No returns in $definingClass->$name" }
    if (enterCount + exitCount != 0) {
        check(enterCount == 1 && exitCount == returns.size) {
            "Malformed Rambler selector scope in $definingClass->$name"
        }
        return
    }
    returns.asReversed().forEach { addInstructions(it, RuntimeCallEmitter.invoke(exit, "")) }
    addInstructions(0, RuntimeCallEmitter.invoke(enter, ""))
}

private fun MutableMethod.applySelectionWriteObserver() {
    val call = RuntimeCallId.RAMBLER_RUNTIME_UPDATE_OFFICIAL_SELECTION
    val reference = RuntimeAbiCatalog.abi(call).reference
    val instructions = implementation?.instructions ?: error("No selection writer implementation")
    val returns = returnInstructionIndices()
    val existing = instructions.count { it.isMethodReference(reference) }
    if (existing != 0) {
        check(existing == returns.size) { "Malformed Rambler selection writer observer" }
        return
    }
    returns.asReversed().forEach {
        addInstructions(it, RuntimeCallEmitter.invoke(call, "p0"))
    }
}

private fun MutableMethod.applySelectionReadObserver() {
    val call = RuntimeCallId.RAMBLER_RUNTIME_UPDATE_OFFICIAL_SELECTION
    val reference = RuntimeAbiCatalog.abi(call).reference
    val instructions = implementation?.instructions ?: error("No selection reader implementation")
    val returns = returnInstructionIndices()
    val existing = instructions.count { it.isMethodReference(reference) }
    if (existing != 0) {
        check(existing == returns.size) { "Malformed Rambler selection reader observer" }
        return
    }
    returns.asReversed().forEach { returnIndex ->
        val resultRegister = (instructions[returnIndex] as? OneRegisterInstruction)?.registerA
            ?: error("Rambler selection return does not expose registerA")
        check(resultRegister <= 15) { "Rambler selection result register is not invoke-35c safe" }
        addInstructions(returnIndex, RuntimeCallEmitter.invoke(call, "v$resultRegister"))
    }
}
