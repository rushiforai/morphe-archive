/*
 * Copyright (C) 2026 Ricardo ARM64 port contributors
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.smart123s.patches.ricardo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val CONFIGURATION = "Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;"

internal object ImmersiveConfigurationFingerprint : Fingerprint(
    definingClass = CONFIGURATION,
    name = "<init>",
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        fieldAccess(definingClass = CONFIGURATION, name = "useImmersiveMode", type = "Z", opcode = Opcode.IPUT_BOOLEAN),
    ),
)

@Suppress("unused")
val immersiveFullscreenPatch = bytecodePatch(
    name = "Immersive fullscreen",
    description = "Enables the engine's immersive mode to hide system bars during play, including after returning to the game.",
) {
    compatibleWith(ricardoCompatibility)

    execute {
        ImmersiveConfigurationFingerprint.let { fingerprint ->
            val method = fingerprint.method
            val implementation = method.implementation ?: throw PatchException("Missing configuration constructor")
            val assignment = fingerprint.instructionMatches.single().instruction as TwoRegisterInstruction
            val receiver = implementation.registerCount - 1 // The constructor has no arguments other than p0.
            if (assignment.registerB != receiver || assignment.registerA >= receiver) {
                throw PatchException("Unexpected immersive-mode initialization")
            }
            val returnIndex = implementation.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .singleOrNull()?.index ?: throw PatchException("Expected one configuration constructor return")

            // At the final return the local value register is dead. Reusing it
            // avoids changing the register count or the defaults of other fields.
            method.addInstructions(
                returnIndex,
                """
                    const/4 v${assignment.registerA}, 0x1
                    iput-boolean v${assignment.registerA}, p0, $CONFIGURATION->useImmersiveMode:Z
                """,
            )
        }
    }
}
