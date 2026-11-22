/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package patapon888.morphe.patches.nova.prime

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import patapon888.morphe.patches.nova.NOVA_LAUNCHER

@Suppress("unused")
val enablePrimePatch = bytecodePatch(
    name = "Enable Prime",
    description = "Enable Nova Launcher Prime and app locked behind the subscription paywall."
) {
    compatibleWith(NOVA_LAUNCHER)

    execute {
        SetPrimeFromPreferencesFingerprint.apply {
            val primeReg = instructionMatches.last().getInstruction<OneRegisterInstruction>().registerA
            method.addInstructions(instructionMatches.last().index + 1, """
                const/16 v$primeReg, 0x200
            """.trimIndent())
        }
    }
}