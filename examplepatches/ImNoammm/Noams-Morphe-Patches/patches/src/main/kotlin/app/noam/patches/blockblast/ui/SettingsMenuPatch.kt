package app.noam.patches.blockblast.ui

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.rawResourcePatch
import app.noam.patches.blockblast.mod.Mod
import app.noam.patches.blockblast.mod.modLoaderPatch
import app.noam.patches.blockblast.shared.Constants.COMPATIBILITY_BLOCK_BLAST

@Suppress("unused")
val settingsMenuPatch = rawResourcePatch(
    name = "Tidy settings menu",
    description = "More games becomes the game's own Back-to-home button (and More games is gone everywhere), " +
        "and the default-skin row hides itself while the patches' own themes are in use. Toggleable in the Mod settings.",
) {
    compatibleWith(COMPATIBILITY_BLOCK_BLAST)
    dependsOn(modLoaderPatch)

    val homeButton by booleanOption(
        key = "homeButton",
        default = true,
        title = "More games becomes Back to home",
        description = "Starting state of the toggle in the Mod settings.",
    )

    execute { Mod.enable("setupMenu", mapOf("homeButton" to (homeButton != false))) }
}
