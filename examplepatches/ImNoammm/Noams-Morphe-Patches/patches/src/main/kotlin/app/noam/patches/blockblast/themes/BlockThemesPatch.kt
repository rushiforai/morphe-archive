package app.noam.patches.blockblast.themes

import app.morphe.patcher.patch.rawResourcePatch
import app.noam.patches.blockblast.mod.Mod
import app.noam.patches.blockblast.mod.modLoaderPatch
import app.noam.patches.blockblast.shared.Constants.COMPATIBILITY_BLOCK_BLAST

/** The style list rendered alongside the art (blocks/styles.json: [{"id":..,"label":..}, ...]). */
private fun styles(): List<Pair<String, String>> =
    Regex("\\{\\s*\"id\"\\s*:\\s*\"([^\"]+)\"\\s*,\\s*\"label\"\\s*:\\s*\"([^\"]+)\"\\s*\\}")
        .findAll(Mod.resource("blocks/styles.json"))
        .map { it.groupValues[1] to it.groupValues[2] }
        .toList()

@Suppress("unused")
val blockThemesPatch = rawResourcePatch(
    name = "Block themes",
    description = "The block looks of the iOS-based app (ASCII, Nothing, pixel, neon, glass and more), picked in the Mod settings.",
) {
    compatibleWith(COMPATIBILITY_BLOCK_BLAST)
    dependsOn(modLoaderPatch)

    execute {
        val styles = styles()
        for ((id, _) in styles) {
            if (id == "original") continue
            for (key in listOf("1", "2", "3", "4", "5", "6", "7", "8", "gray")) {
                get("assets/blocks/$id/$key.png").writeBytes(Mod.resourceBytes("blocks/$id/$key.png"))
            }
        }
        Mod.enable(
            "blockTheme",
            mapOf(
                "style" to "original",
                "styles" to styles.map { (id, label) -> mapOf("v" to id, "label" to label) },
            ),
            uses = listOf("color"),
        )
    }
}
