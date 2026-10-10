package app.noam.patches.blockblast.misc

import app.morphe.patcher.patch.rawResourcePatch
import app.noam.patches.blockblast.mod.Mod
import app.noam.patches.blockblast.mod.modLoaderPatch
import app.noam.patches.blockblast.shared.Constants.COMPATIBILITY_BLOCK_BLAST

@Suppress("unused")
val fakeBestScorePatch = rawResourcePatch(
    name = "Fake best score",
    description = "Show a chosen number as the Classic best score; the real record keeps tracking underneath and comes back when the option is turned off. Set in Mod settings.",
) {
    compatibleWith(COMPATIBILITY_BLOCK_BLAST)
    dependsOn(modLoaderPatch)

    execute {
        Mod.enable("fakeScore")
    }
}
