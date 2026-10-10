package app.noam.patches.blockblast.misc

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.rawResourcePatch
import app.noam.patches.blockblast.mod.Mod
import app.noam.patches.blockblast.mod.modLoaderPatch
import app.noam.patches.blockblast.shared.Constants.COMPATIBILITY_BLOCK_BLAST

@Suppress("unused")
val percentPopupsPatch = rawResourcePatch(
    name = "Hide percent-of-players popups",
    description = "Hides the \"you defeat X% of players\" fail animation and the chapter top-rank badge. Toggleable in Mod settings.",
) {
    compatibleWith(COMPATIBILITY_BLOCK_BLAST)
    dependsOn(modLoaderPatch)

    val enabled by booleanOption(
        key = "enabled",
        default = true,
        title = "Hide \"% of players\" messages",
        description = "The Adventure defeat percent and the top-rank badge.",
    )

    execute {
        Mod.enable("percentPopups", mapOf("enabled" to (enabled != false)))
    }
}
