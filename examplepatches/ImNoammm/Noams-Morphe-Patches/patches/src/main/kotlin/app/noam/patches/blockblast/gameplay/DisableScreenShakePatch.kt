package app.noam.patches.blockblast.gameplay

import app.morphe.patcher.patch.rawResourcePatch
import app.noam.patches.blockblast.mod.Mod
import app.noam.patches.blockblast.mod.modLoaderPatch
import app.noam.patches.blockblast.shared.Constants.COMPATIBILITY_BLOCK_BLAST

@Suppress("unused")
val disableScreenShakePatch = rawResourcePatch(
    name = "Disable screen shake",
    description = "Adds a screen-shake toggle to the Mod settings, off to start with.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_BLOCK_BLAST)
    dependsOn(modLoaderPatch)
    execute { Mod.enable("screenShake", mapOf("enabled" to false)) }
}
