package app.strong.pro

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.shared.Constants

@Suppress("unused")
val unlockProPatch = patch(
    name = "Unlock Pro",
    description = "Unlocks all Strong Pro features.",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_STRONG)

    execute {
        ProCheckerFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lwp6;->i:Lwp6;
                return-object v0
            """
        )
    }
}
