package app.noam.patches.blockblast.misc

import app.morphe.patcher.patch.rawResourcePatch
import app.noam.patches.blockblast.mod.Mod
import app.noam.patches.blockblast.mod.modLoaderPatch
import app.noam.patches.blockblast.shared.Constants.COMPATIBILITY_BLOCK_BLAST

@Suppress("unused")
val debugLogPatch = rawResourcePatch(
    name = "Debug log",
    description = "Writes the screens the game opens to files/bbmod.log in the app's data (for troubleshooting the patches).",
    default = false,
) {
    compatibleWith(COMPATIBILITY_BLOCK_BLAST)
    dependsOn(modLoaderPatch)
    execute { Mod.enable("debug") }
}
