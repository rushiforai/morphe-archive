package app.fakh.patches.confluence

import app.fakh.patches.confluence.shared.Constants.COMPATIBILITY_CONFLUENCE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch

@Suppress("unused")
val pitchBlackPatch = patch(
    name = "Pitch black",
    description = "Turns the dark mode backgrounds black.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CONFLUENCE)
    category("Theme")
    dependsOn(colorsPatch, settingsPatch)

    execute {
        mutableClassDefBy(EXTENSION).methods.first { it.name == "isPitchBlackIncluded" }.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
