package app.npci.bhim.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_BHIM

@Suppress("unused")
val disableBlacklisting = bytecodePatch(
    name = "Disable Blacklisting",
    description = "Disables the blacklisting check in the affirmation flow to prevent the app from blocking rooted devices server-side.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BHIM)

    execute {
        // Patch the DeviceIntegrityCheckFingerprint to always return false (not empty)
        // This makes the device recognition verdict appear valid
        DeviceIntegrityCheckFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
