package com.awt.regain.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import com.awt.regain.patches.Constants.COMPATIBILITY_REGAIN

@Suppress("unused")
val proUserUnlockPatch = patch(
    name = "Pro user unlock",
    description = "Always returns true for isProUser() to enable Pro features during testing.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_REGAIN)

    execute {
        IsProUserFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )
    }
}
