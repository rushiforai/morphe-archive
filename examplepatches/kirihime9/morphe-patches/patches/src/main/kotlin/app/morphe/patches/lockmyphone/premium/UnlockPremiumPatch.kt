/*
 * Copyright (C) 2026 kirihime
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.lockmyphone.premium
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.p0Register
import app.morphe.patches.shared.compat.AppCompatibilities.LOCK_MY_PHONE

@Suppress("unused")
val unlockPremiumPatch = patch(
    name = "Unlock premium",
    description = "Unlocks unlimited lock periods.",
) {
    compatibleWith(LOCK_MY_PHONE)

    // Force the premium flag on app start so premium gates read true.
    execute {
        val method = MainActivityOnCreateFingerprint.method

        val registers = method.getFreeRegisterProvider(0, 2, method.p0Register)
        val valueRegister = registers.getFreeRegister4Bit()
        val instanceRegister = registers.getFreeRegister4Bit()

        method.addInstructions(
            0,
            """
                const/4 v$valueRegister, 0x1
                move-object/from16 v$instanceRegister, p0
                iput-boolean v$valueRegister, v$instanceRegister, Ltomka/lockmyphone/activities/MainActivity;->v:Z
            """.trimIndent(),
        )
    }
}
