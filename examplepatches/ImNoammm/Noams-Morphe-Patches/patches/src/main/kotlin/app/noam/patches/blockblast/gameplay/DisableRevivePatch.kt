package app.noam.patches.blockblast.gameplay

import app.morphe.patcher.patch.rawResourcePatch
import app.noam.patches.blockblast.mod.Mod
import app.noam.patches.blockblast.mod.modLoaderPatch
import app.noam.patches.blockblast.shared.Constants.COMPATIBILITY_BLOCK_BLAST

@Suppress("unused")
val disableRevivePatch = rawResourcePatch(
    name = "Disable revive",
    description = "A Classic game ends at game over without the revive offer, as in the iOS-based app.",
) {
    compatibleWith(COMPATIBILITY_BLOCK_BLAST)
    dependsOn(modLoaderPatch)
    execute { Mod.enable("noRevive") }
}
