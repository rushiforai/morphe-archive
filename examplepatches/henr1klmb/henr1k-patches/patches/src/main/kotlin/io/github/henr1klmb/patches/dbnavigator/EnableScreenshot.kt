package io.github.henr1klmb.patches.dbnavigator

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

@Suppress("unused")
val enableScreenshotsPatch = patch(
    name = "Enable screenshots",
    description = "Allow taking screenshots and screen recordings.",
) {
    compatibleWith(DB_NAVIGATOR_COMPATIBILITY)

    execute {
        EnableScreenshotsFingerprint.method.addInstructions(
            0,
            "const/4 p1, 0x0",
        )
    }
}
