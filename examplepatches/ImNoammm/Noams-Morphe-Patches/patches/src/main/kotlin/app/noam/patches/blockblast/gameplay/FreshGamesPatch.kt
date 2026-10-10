package app.noam.patches.blockblast.gameplay

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.rawResourcePatch
import app.noam.patches.blockblast.mod.Mod
import app.noam.patches.blockblast.mod.modLoaderPatch
import app.noam.patches.blockblast.shared.Constants.COMPATIBILITY_BLOCK_BLAST

@Suppress("unused")
val freshGamesPatch = rawResourcePatch(
    name = "Fresh Classic games",
    description = "Every new Classic game starts on an empty board in the original skin, and the tutorial is skipped.",
) {
    compatibleWith(COMPATIBILITY_BLOCK_BLAST)
    dependsOn(modLoaderPatch)

    val emptyBoard by booleanOption(
        key = "emptyBoard",
        default = true,
        title = "Empty board",
        description = "No pre-filled cells at the start of a game.",
    )
    val originalSkin by booleanOption(
        key = "originalSkin",
        default = true,
        title = "Original skin",
        description = "Go back to the original look when a game starts (all-clears change the skin during a game).",
    )
    val skipTutorial by booleanOption(
        key = "skipTutorial",
        default = true,
        title = "Skip the tutorial",
        description = "A fresh install starts with a normal game instead of the scripted tutorial.",
    )

    execute {
        Mod.enable(
            "freshGames",
            mapOf("emptyBoard" to (emptyBoard != false), "originalSkin" to (originalSkin != false), "skipTutorial" to (skipTutorial != false)),
        )
    }
}
