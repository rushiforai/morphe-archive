package dev.jason.gboardpatches.util

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.google.gson.GsonBuilder
import com.google.gson.JsonArray
import com.google.gson.JsonObject
import com.google.gson.JsonParser
import dev.abotmaker.ramblerenhancements.patches.PatchCatalog
import dev.jason.gboardpatches.patches.gboard.registry.GboardPublishedPatchCatalog
import java.io.File
import java.net.URLClassLoader
import java.util.jar.Manifest

internal fun main() {
    val patchBundle = resolvePatchBundleFile()
    val patchFiles = setOf(patchBundle)
    val loadedPatchNames = loadPatchesFromJar(patchFiles).mapNotNull { patch -> patch.name }.toSet()
    val gboardPatchNames = GboardPublishedPatchCatalog.morpheRegistrations
        .mapNotNull { patch -> patch.name }
        .toSet()
    val ramblerPatchNames = PatchCatalog.morpheRegistrations
        .mapNotNull { patch -> patch.name }
        .toSet()
    val duplicateNames = gboardPatchNames.intersect(ramblerPatchNames)
    require(duplicateNames.isEmpty()) {
        "Duplicate patch names between Gboard and Rambler catalogs: $duplicateNames"
    }
    val catalogPatchNames = gboardPatchNames + ramblerPatchNames
    require(loadedPatchNames == catalogPatchNames) {
        "Published catalog ($catalogPatchNames) does not match Morphe registrations ($loadedPatchNames) in ${patchBundle.name}"
    }
    val patchClassLoader = URLClassLoader(patchFiles.map { it.toURI().toURL() }.toTypedArray())
    val manifest = patchClassLoader.getResources("META-INF/MANIFEST.MF")

    while (manifest.hasMoreElements()) {
        Manifest(manifest.nextElement().openStream())
            .mainAttributes
            .getValue("Version")
            ?.let {
                generatePatchList(it)
            }
    }
}

private fun resolvePatchBundleFile(): File {
    val buildLibs = File("build/libs/")
    val patchBundles = buildLibs.listFiles { file ->
        val fileName = file.name
        !fileName.contains("javadoc") &&
            !fileName.contains("sources") &&
            fileName.endsWith(".mpp")
    }?.toList().orEmpty()

    require(patchBundles.isNotEmpty()) { "No patch bundle found under ${buildLibs.path}" }

    val currentVersion = Regex("""(?m)^\s*version\s*=\s*([^\r\n#]+?)\s*$""")
        .find(File("../gradle.properties").readText())
        ?.groupValues
        ?.getOrNull(1)
        ?.trim()

    return patchBundles.firstOrNull { bundle ->
        currentVersion != null && bundle.name == "patches-$currentVersion.mpp"
    } ?: patchBundles.maxByOrNull(File::lastModified)
    ?: error("Unable to resolve patch bundle from ${buildLibs.path}")
}

private fun generatePatchList(version: String) {
    val gboardJson = JsonParser.parseString(
        GboardPublishedPatchCatalog.publishedInventory(version)
    ).asJsonObject
    val ramblerJson = JsonParser.parseString(
        PatchCatalog.publishedInventory(version)
    ).asJsonObject
    val mergedPatches = (
        gboardJson.getAsJsonArray("patches").map { it.asJsonObject } +
            ramblerJson.getAsJsonArray("patches").map { it.asJsonObject }
        ).sortedBy { it.get("name").asString }
    val mergedArray = JsonArray().apply { mergedPatches.forEach(::add) }
    val inventory = JsonObject().apply {
        addProperty("version", version)
        add("patches", mergedArray)
    }
    val gson = GsonBuilder()
        .serializeNulls()
        .disableHtmlEscaping()
        .setPrettyPrinting()
        .create()
    val listJson = File("../patches-list.json")
    listJson.writeText(gson.toJson(inventory) + "\n")
}
