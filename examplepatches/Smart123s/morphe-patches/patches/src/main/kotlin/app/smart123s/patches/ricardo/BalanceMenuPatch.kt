package app.smart123s.patches.ricardo

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import com.google.gson.JsonArray
import com.google.gson.JsonObject
import com.google.gson.JsonParser

internal object RicardoBalanceMenu {
    const val BUTTON = "morphe_balance_editor"

    fun addButton(json: String): String {
        val menu = JsonParser.parseString(json).asJsonObject
        val images = menu.getAsJsonArray("image")
        val icons = images.map { it.asJsonObject }.singleOrNull {
            it.get("file")?.asString == "tuning_icons.png"
        } ?: throw PatchException("Expected the tuning icons in Ricardo's menu")
        val bodyIndex = icons.get("body").asInt
        val background = menu.getAsJsonArray("body")[bodyIndex].asJsonObject
        if (background.get("name")?.asString != "bg" || images.any {
                it.asJsonObject.get("name")?.asString == BUTTON
            }) throw PatchException("Unexpected Ricardo tuning menu layout")

        // Leave the original body/image indices intact. The coin and its sensor
        // share the tuning background's transform and the original camera.
        val x = icons.getAsJsonObject("center").get("x").asDouble - 5.1
        val y = icons.getAsJsonObject("center").get("y").asDouble - 2.5
        val radius = 1.75
        val center = JsonObject().apply { addProperty("x", x); addProperty("y", y) }
        val fixture = JsonObject().apply {
            addProperty("name", BUTTON)
            addProperty("sensor", true)
            addProperty("filter-maskBits", 0)
            add("circle", JsonObject().apply {
                add("center", center.deepCopy())
                addProperty("radius", radius)
            })
        }
        background.getAsJsonArray("fixture").add(fixture)
        val xs = listOf(x - radius, x + radius, x + radius, x - radius)
        val ys = listOf(y - radius, y - radius, y + radius, y + radius)
        fun List<Double>.jsonArray() = JsonArray().also { array -> forEach(array::add) }
        images.add(icons.deepCopy().apply {
            addProperty("name", BUTTON)
            addProperty("file", "coin.png")
            add("center", center)
            addProperty("angle", 0)
            addProperty("aspectScale", 1)
            addProperty("opacity", 1)
            addProperty("renderOrder", 10)
            addProperty("scale", radius * 2)
            // Ricardo's loader calculates width/height from these corners.
            add("corners", JsonObject().apply { add("x", xs.jsonArray()); add("y", ys.jsonArray()) })
            add("glVertexPointer", xs.indices.flatMap { listOf(xs[it], ys[it]) }.jsonArray())
        })
        return menu.toString()
    }
}

internal val balanceMenuResourcesPatch = rawResourcePatch {
    execute {
        get("assets/data/menu.json").apply { writeText(RicardoBalanceMenu.addButton(readText())) }
    }
}
