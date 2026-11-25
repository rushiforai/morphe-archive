package app.masareef.patches.subscription

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.masareef.patches.shared.Constants.COMPATIBILITY_MASAREEF

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro (Masareef)",
    description = "Makes UserDataManager.isSubscribed() always return true, unlocking all Pro features.",
    default = false
) {
    compatibleWith(COMPATIBILITY_MASAREEF)

    execute {
        val method = IsSubscribedFingerprint.method

        method.replaceInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
