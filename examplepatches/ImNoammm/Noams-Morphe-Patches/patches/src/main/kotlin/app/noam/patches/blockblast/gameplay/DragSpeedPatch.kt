package app.noam.patches.blockblast.gameplay

import app.morphe.patcher.patch.floatOption
import app.morphe.patcher.patch.rawResourcePatch
import app.noam.patches.blockblast.mod.Mod
import app.noam.patches.blockblast.mod.modLoaderPatch
import app.noam.patches.blockblast.shared.Constants.COMPATIBILITY_BLOCK_BLAST

@Suppress("unused")
val dragSpeedPatch = rawResourcePatch(
    name = "Drag speed",
    description = "How far a held piece moves for each finger movement, on every screen size.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_BLOCK_BLAST)
    dependsOn(modLoaderPatch)

    val ratio by floatOption(
        key = "ratio",
        default = 1.5f,
        values = mapOf("Finger speed (1x)" to 1f, "iOS (1.5x)" to 1.5f, "Fast (2x)" to 2f),
        title = "Drag ratio",
        description = "1.5 is what the iOS game uses.",
        validator = { it == null || it in 0.5f..4f },
    )

    execute { Mod.enable("dragSpeed", mapOf("ratio" to (ratio ?: 1.5f))) }
}
