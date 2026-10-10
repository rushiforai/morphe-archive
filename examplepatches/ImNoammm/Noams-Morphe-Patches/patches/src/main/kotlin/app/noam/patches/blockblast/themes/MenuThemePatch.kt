package app.noam.patches.blockblast.themes

import app.morphe.patcher.patch.rawResourcePatch
import app.noam.patches.blockblast.mod.Mod
import app.noam.patches.blockblast.mod.modLoaderPatch
import app.noam.patches.blockblast.shared.Constants.COMPATIBILITY_BLOCK_BLAST

@Suppress("unused")
val menuThemePatch = rawResourcePatch(
    name = "Menu theme",
    description = "The iOS-based app's menu themes for the home screen; Original follows the colour theme. Picked with previews on the Mod settings Themes page.",
) {
    compatibleWith(COMPATIBILITY_BLOCK_BLAST)
    dependsOn(modLoaderPatch)

    execute {
        Mod.enable(
            "menuTheme",
            mapOf("value" to "original", "themes" to Mod.jsonResource("themes/menu.json")),
            uses = listOf("color"),
        )
    }
}
