package app.noam.patches.blockblast.themes

import app.morphe.patcher.patch.rawResourcePatch
import app.noam.patches.blockblast.mod.Mod
import app.noam.patches.blockblast.mod.modLoaderPatch
import app.noam.patches.blockblast.shared.Constants.COMPATIBILITY_BLOCK_BLAST

@Suppress("unused")
val fxThemePatch = rawResourcePatch(
    name = "Animation theme",
    description = "The iOS-based app's animation themes: one colour transform over the game's effects (Neon, Gold, Ice, Rainbow and more), with previews and a live preview on the Themes page.",
) {
    compatibleWith(COMPATIBILITY_BLOCK_BLAST)
    dependsOn(modLoaderPatch)

    execute {
        Mod.enable(
            "fxTheme",
            mapOf("value" to "original", "themes" to Mod.jsonResource("themes/fx.json")),
            uses = listOf("color"),
        )
    }
}
