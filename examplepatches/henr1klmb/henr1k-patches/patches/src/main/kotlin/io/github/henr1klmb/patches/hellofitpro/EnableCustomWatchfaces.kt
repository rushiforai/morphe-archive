package io.github.henr1klmb.patches.hellofitpro

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val RETURN_TRUE = """
    const/4 v0, 0x1
    return v0
"""

@Suppress("unused")
val enableCustomWatchfacesPatch = patch(
    name = "Enable custom watchfaces",
    description = "Enables custom watchfaces.",
) {
    compatibleWith(HELLOFITPRO_COMPATIBILITY)

    execute {
        // Unlock AI Dial creation and tab in Watch Dial Market
        SpMapGetHashAiDialFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_TRUE.trimIndent(),
        )

        // Force modern custom dial support
        SpMapIsCustomDialNewFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_TRUE.trimIndent(),
        )

        // Force general dial support flag
        SpMapIsDialsupportFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_TRUE.trimIndent(),
        )
    }
}
