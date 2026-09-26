/*
 * Ather Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package util

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.google.gson.GsonBuilder
import com.google.gson.JsonObject
import java.io.File

private const val NOTE =
    "Do NOT manually edit this file. This file is automatically updated when semantic release " +
        "(release.yml) runs. Manually editing this file can break your releases and break third " +
        "party tools that use this file."

fun main(args: Array<String>) {
    val version = args.firstOrNull() ?: error("Usage: PatchListGenerator <version>")
    val bundle = findBundle(version)
    val patches = loadPatchesFromJar(setOf(bundle))

    writePatchList(version, patches)
    println("Wrote patches-list.json for $version with ${patches.size} patches from ${bundle.name}")
}

private fun findBundle(version: String): File {
    val bundle = File("build/libs/patches-$version.mpp")
    check(bundle.isFile) {
        "${bundle.path} does not exist. Run :patches:build before :patches:generatePatchesList."
    }
    return bundle
}

private fun writePatchList(version: String, patches: Set<Patch<*>>) {
    val gson = GsonBuilder()
        .serializeNulls()
        .disableHtmlEscaping()
        .setPrettyPrinting()
        .create()

    val entries = patches
        .sortedBy { it.name }
        .map { patch ->
            JsonPatch(
                name = patch.name,
                description = patch.description,
                default = patch.default,
                category = patch.category,
                dependencies = listOf(patch.javaClass.simpleName),
            )
        }

    val root = JsonObject()
    root.addProperty("NOTE", NOTE)
    root.addProperty("version", version)
    root.add("patches", gson.toJsonTree(entries))

    File("../patches-list.json").writeText(gson.toJson(root) + "\n")
}

@Suppress("unused")
private class JsonPatch(
    val name: String?,
    val description: String?,
    val default: Boolean,
    val category: String?,
    val dependencies: List<String>,
)
