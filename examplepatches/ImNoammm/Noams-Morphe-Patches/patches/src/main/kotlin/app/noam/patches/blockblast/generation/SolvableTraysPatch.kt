package app.noam.patches.blockblast.generation

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.rawResourcePatch
import app.noam.patches.blockblast.mod.Mod
import app.noam.patches.blockblast.mod.modLoaderPatch
import app.noam.patches.blockblast.shared.Constants.COMPATIBILITY_BLOCK_BLAST

@Suppress("unused")
val solvableTraysPatch = rawResourcePatch(
    name = "Disable impossible levels",
    description = "Replace impossible Classic trays with a playable three-piece sequence. Works with Android and iOS generation; toggleable in Mod settings.",
) {
    compatibleWith(COMPATIBILITY_BLOCK_BLAST)
    dependsOn(modLoaderPatch)

    val enabled by booleanOption(
        key = "enabled",
        default = true,
        title = "Disable impossible levels",
        description = "Require a way to place all three pieces, including line clears between moves.",
    )

    execute {
        Mod.enable("solvableTrays", mapOf("enabled" to (enabled != false)), uses = listOf("traySolver"))
    }
}
