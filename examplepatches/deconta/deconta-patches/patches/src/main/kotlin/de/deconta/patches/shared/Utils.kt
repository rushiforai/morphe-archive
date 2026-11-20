package de.deconta.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

internal const val ROSSMANN_EXTENSION = "extensions/extension.mpe"

internal fun MutableMethod.replaceBody(smali: String) {
    removeInstructions(instructions.size)
    addInstructions(0, smali)
}

internal fun MutableMethod.prependReturn(smali: String) {
    addInstructions(0, smali)
}
