package app.noam.patches.blockblast.themes

import app.morphe.patcher.patch.rawResourcePatch
import app.noam.patches.blockblast.mod.Mod
import app.noam.patches.blockblast.mod.modLoaderPatch
import app.noam.patches.blockblast.shared.Constants.COMPATIBILITY_BLOCK_BLAST

@Suppress("unused")
val colorThemePatch = rawResourcePatch(
    name = "Colour theme",
    description = "The iOS-based app's colour themes for the game screen (OLED, Midnight, Candy and more), picked with previews on the Mod settings Themes page.",
) {
    compatibleWith(COMPATIBILITY_BLOCK_BLAST)
    dependsOn(modLoaderPatch)

    execute {
        Mod.enable(
            "theme",
            mapOf("value" to "classic", "themes" to Mod.jsonResource("themes/color.json")),
            uses = listOf("color"),
        )
    }
}
