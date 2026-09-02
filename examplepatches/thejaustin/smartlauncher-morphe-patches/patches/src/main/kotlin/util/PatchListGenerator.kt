package util

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.google.gson.GsonBuilder
import com.google.gson.JsonObject
import java.io.File
import java.net.URLClassLoader
import java.util.jar.Manifest

/**
 * Regenerates ../patches-list.json and ../patches-bundle.json from the built .mpp.
 * Matches official Morphe Manager source schema requirements.
 */
internal fun main() {
    val patchFile = File("build/libs/").listFiles { file ->
        val fileName = file.name
        !fileName.contains("javadoc") && !fileName.contains("sources") && fileName.endsWith(".mpp")
    }?.firstOrNull() ?: error("No .mpp found in build/libs/ - run the build task first")

    val loadedPatches = loadPatchesFromJar(setOf(patchFile))
    val patchClassLoader = URLClassLoader(arrayOf(patchFile.toURI().toURL()))
    val manifests = patchClassLoader.getResources("META-INF/MANIFEST.MF")

    while (manifests.hasMoreElements()) {
        Manifest(manifests.nextElement().openStream())
            .mainAttributes
            .getValue("Version")
            ?.let { generatePatchList(it, loadedPatches) }
    }
}

@Suppress("DEPRECATION")
private fun generatePatchList(version: String, patches: Set<Patch<*>>) {
    val patchesMap = patches.sortedBy { it.name }.map { patch ->
        val compatList = patch.compatiblePackages?.map { (pkgName, versions) ->
            JsonCompatiblePackage(
                packageName = pkgName,
                name = "Smart Launcher 6",
                versions = versions?.toList(),
                targets = versions?.map { JsonTarget(version = it) }
            )
        }

        JsonPatch(
            name = patch.name,
            description = patch.description,
            default = patch.use,
            use = patch.use,
            dependencies = patch.dependencies.map { it.javaClass.simpleName },
            compatiblePackages = compatList
        )
    }

    val gson = GsonBuilder()
        .serializeNulls()
        .disableHtmlEscaping()
        .setPrettyPrinting()
        .create()

    val jsonObject = JsonObject()
    jsonObject.addProperty("version", version)
    jsonObject.addProperty("downloadUrl", "https://github.com/thejaustin/smartlauncher-morphe-patches/releases/latest/download/smartlauncher-morphe-patches.mpp")
    jsonObject.add("patches", gson.toJsonTree(patchesMap))

    val jsonString = gson.toJson(jsonObject)
    File("../patches-bundle.json").writeText(jsonString)
    File("../patches-list.json").writeText(jsonString)
    File("../patches.json").writeText(jsonString)
}

@Suppress("unused")
private class JsonPatch(
    val name: String? = null,
    val description: String? = null,
    val default: Boolean = true,
    val use: Boolean = true,
    val dependencies: List<String> = emptyList(),
    val compatiblePackages: List<JsonCompatiblePackage>? = null,
)

@Suppress("unused")
private class JsonCompatiblePackage(
    val packageName: String,
    val name: String? = null,
    val versions: List<String>? = null,
    val targets: List<JsonTarget>? = null,
)

@Suppress("unused")
private class JsonTarget(
    val version: String,
    val isExperimental: Boolean = true,
    val minSdk: Int = 24,
)
