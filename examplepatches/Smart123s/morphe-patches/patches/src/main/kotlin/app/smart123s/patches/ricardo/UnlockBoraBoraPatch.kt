/*
 * Copyright (C) 2026 Smart123s' patches contributors
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.smart123s.patches.ricardo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22t
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val GAME = "Lricardonemlopot/nemlopot/rube/RubeLoaderTest;"

internal object BoraBoraAvailabilityFingerprint : Fingerprint(
    definingClass = GAME,
    name = "present",
    parameters = listOf("F"),
    returnType = "V",
)

internal fun MutableMethod.unlockBoraBora() {
    val instructions = implementation?.instructions ?: throw PatchException("Missing map availability code")
    val pattern = listOf(
        Opcode.SGET_OBJECT, Opcode.ARRAY_LENGTH, Opcode.IF_GE, Opcode.IF_EQZ,
        Opcode.CONST_4, Opcode.IF_NE, Opcode.SGET_OBJECT,
    )
    fun Instruction.isGameField(name: String): Boolean {
        val field = (this as? ReferenceInstruction)?.reference as? FieldReference
        return field?.definingClass == GAME && field.name == name
    }
    val start = (0..instructions.size - pattern.size).singleOrNull { index ->
        pattern.indices.all { instructions[index + it].opcode == pattern[it] } &&
            instructions[index].isGameField("palyaNevek") &&
            instructions[index + 6].isGameField("elerhetoPalyak") &&
            (instructions[index + 4] as NarrowLiteralInstruction).narrowLiteral == 2
    } ?: throw PatchException("Expected Ricardo's original free-map check")

    val branch = instructions[start + 5] as BuilderInstruction22t
    val firstMap = instructions[start + 3] as OneRegisterInstruction
    val bonusMap = instructions[start + 4] as OneRegisterInstruction
    if (branch.registerA != firstMap.registerA || branch.registerB != bonusMap.registerA) {
        throw PatchException("Unexpected map availability registers")
    }

    // Map indices 0 and 2 are already free. Include Bora Bora (1) by reading
    // saved availability only for indices above 2. Keep the original jump label
    // and every instruction address; no balance or preferences are written.
    replaceInstruction(start + 5, BuilderInstruction22t(
        Opcode.IF_GT, branch.registerA, branch.registerB, branch.target,
    ))
}

@Suppress("unused")
val unlockBoraBoraPatch = bytecodePatch(
    name = "Unlock Bora Bora",
    description = "Unlocks the second map, Bora Bora, by default without spending coins.",
) {
    compatibleWith(ricardoCompatibility)

    execute {
        BoraBoraAvailabilityFingerprint.method.unlockBoraBora()
    }
}
