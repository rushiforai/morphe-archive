package org.ungoogled.patches.waze

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch

/** Anchor for getResourceAsStream: the patches file's class loader finds waze/ through any of its classes. */
private object WazeSkinResource

/** waze/skin_colors.txt: "[day]" / "[night]" / "[editor.day]" / "[editor.night]" headers, then "name value" lines (made by tools/waze_skin_gen.py). */
private fun readSkinColors(): Map<String, List<Pair<String, String>>> {
    val stream = WazeSkinResource::class.java.getResourceAsStream("/waze/skin_colors.txt")
        ?: throw PatchException("waze/skin_colors.txt is missing from the patches file")
    val result = linkedMapOf<String, MutableList<Pair<String, String>>>()
    var variant: MutableList<Pair<String, String>>? = null
    stream.bufferedReader(Charsets.UTF_8).useLines { lines ->
        for (line in lines) {
            when {
                line.isBlank() -> Unit
                line.startsWith("[") -> variant = result.getOrPut(line.trim('[', ']', ' ')) { mutableListOf() }
                else -> variant!! += line.substringBefore(' ') to line.substringAfter(' ')
            }
        }
    }
    return result
}

/**
 * The Mod's map colours (black map background, darker roads and areas, brighter labels) written into Waze's own lua
 * skins: the day and night skins, the map editor's, and the experiment skins next to them that Waze uses when its experiment is on. The
 * `name = rgb(...)` line of each colour is rewritten in place, so nothing else of the skin changes.
 */
internal val wazeSkinPatch = resourcePatch(
    description = "Sets the Waze Mod's map colours in Waze's lua skins.",
) {
    execute {
        for ((variant, colors) in readSkinColors()) {
            for (directory in listOf("", "experiment/")) {
                val name = "skin_values.$variant.lua"
                val file = get("assets/res/skins/default/$directory$name")
                if (!file.isFile) throw PatchException("$directory$name not found: not the Waze build the colours were made for")
                var text = file.readText(Charsets.UTF_8)
                for ((color, value) in colors) {
                    val line = Regex("^([ \\t]*${Regex.escape(color)}[ \\t]*=[ \\t]*)rgba?\\([^)]*\\)", RegexOption.MULTILINE)
                    if (line.findAll(text).count() != 1) {
                        throw PatchException("$directory$name: $color is not one line: not the Waze build the colours were made for")
                    }
                    text = line.replace(text) { it.groupValues[1] + value }
                }
                file.writeText(text, Charsets.UTF_8)
            }
        }
    }
}
