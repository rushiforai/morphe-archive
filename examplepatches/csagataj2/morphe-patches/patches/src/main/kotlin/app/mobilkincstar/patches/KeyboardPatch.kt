package app.mobilkincstar.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.mobilkincstar.patches.shared.Constants.COMPATIBILITY_MOBILKINCSTAR

@Suppress("unused")
val keyboardPatch = bytecodePatch(
    name = "Disable Keyboard Discrimination",
    description = "Prevents the app from detecting specific keyboards.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MOBILKINCSTAR)

    execute {
        KeyboardDetectionFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """
        )
    }
}
