package app.morphe.util

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction as patcherAddInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions as patcherAddInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels as patcherAddInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode

fun MutableMethod.addInstruction(index: Int, smali: String) =
    keepsEvery(smali) { patcherAddInstruction(index, smali) }

fun MutableMethod.addInstruction(smali: String) =
    keepsEvery(smali) { patcherAddInstruction(smali) }

fun MutableMethod.addInstructions(index: Int, smali: String) =
    keepsEvery(smali) { patcherAddInstructions(index, smali) }

fun MutableMethod.addInstructions(smali: String) =
    keepsEvery(smali) { patcherAddInstructions(0, smali) }

fun MutableMethod.addInstructionsWithLabels(
    index: Int,
    smali: String,
    vararg externalLabels: ExternalLabel,
) = keepsEvery(smali) { patcherAddInstructionsWithLabels(index, smali, *externalLabels) }

private inline fun MutableMethod.keepsEvery(smali: String, add: () -> Unit) {
    val written = smaliInstructionCount(smali)
    val before = countedInstructions()
    val kept = try {
        add()
        countedInstructions() - before
    } catch (_: NoSuchElementException) {
        0
    }
    if (kept != written) {
        throw PatchException(
            "$definingClass->$name: inline smali compiler kept $kept of $written instructions " +
                "(registerCount=${implementation?.registerCount}): ${smali.trim().lines().joinToString(" | ") { it.trim() }}",
        )
    }
}

private fun MutableMethod.countedInstructions() =
    implementation!!.instructions.count { it.opcode != Opcode.NOP }

private fun smaliInstructionCount(smali: String): Int {
    var count = 0
    for (raw in smali.lines()) {
        val line = raw.trim()
        if (line.isEmpty() || line.startsWith("#") || line.startsWith(":")) continue
        if (line == "nop" || line.startsWith("nop ") || line.startsWith("nop#")) continue
        if (line.startsWith(".")) continue
        count++
    }
    return count
}
