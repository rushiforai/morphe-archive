package app.noam.patches.blockblast.ads

import app.morphe.patcher.patch.rawResourcePatch
import app.noam.patches.blockblast.mod.Mod
import app.noam.patches.blockblast.mod.modLoaderPatch
import app.noam.patches.blockblast.shared.Constants.COMPATIBILITY_BLOCK_BLAST

@Suppress("unused")
val blockAdsPatch = rawResourcePatch(
    name = "Block ads",
    description = "No ad is ever requested or shown; flows that would wait on an ad continue at once. Toggleable in the Mod settings.",
) {
    compatibleWith(COMPATIBILITY_BLOCK_BLAST)
    dependsOn(modLoaderPatch)
    execute { Mod.enable("blockAds", mapOf("enabled" to true)) }
}
