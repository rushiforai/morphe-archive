package app.noam.patches.blockblast.gameplay

import app.morphe.patcher.patch.rawResourcePatch
import app.noam.patches.blockblast.mod.Mod
import app.noam.patches.blockblast.mod.modLoaderPatch
import app.noam.patches.blockblast.shared.Constants.COMPATIBILITY_BLOCK_BLAST

@Suppress("unused")
val fasterGameOverPatch = rawResourcePatch(
    name = "Faster game over",
    description = "The result screen opens as soon as the board has filled, without the extra wait.",
) {
    compatibleWith(COMPATIBILITY_BLOCK_BLAST)
    dependsOn(modLoaderPatch)
    execute { Mod.enable("fastGameOver") }
}
