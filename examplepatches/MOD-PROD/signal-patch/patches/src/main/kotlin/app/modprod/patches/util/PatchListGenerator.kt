package app.modprod.patches.util

import com.google.gson.GsonBuilder
import java.io.File

/**
 * Minimal placeholder so the generatePatchesList task resolves.
 * Morphe / ModProd pipelines may replace this with the full generator.
 */
fun main() {
    val out = File("patches-list.json")
    val payload = mapOf(
        "name" to "Signals Auto Trading Patches",
        "patches" to listOf(
            mapOf("name" to "Enable Auto Trading tab", "default" to true),
            mapOf("name" to "Wire Auto Trading fragment", "default" to true),
        ),
    )
    out.writeText(GsonBuilder().setPrettyPrinting().create().toJson(payload))
    println("Wrote ${out.absolutePath}")
}
