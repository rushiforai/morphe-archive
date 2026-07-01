package dev.jason.gboardpatches.util

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.google.gson.GsonBuilder
import com.google.gson.JsonObject
import java.io.File
import java.net.URLClassLoader
import java.util.jar.Manifest

typealias PackageName = String
typealias VersionName = String

internal fun main() {
    val patchBundle = resolvePatchBundleFile()
    val patchFiles = setOf(patchBundle)
    val loadedPatches = loadPatchesFromJar(patchFiles)
    val patchClassLoader = URLClassLoader(patchFiles.map { it.toURI().toURL() }.toTypedArray())
    val manifest = patchClassLoader.getResources("META-INF/MANIFEST.MF")

    while (manifest.hasMoreElements()) {
        Manifest(manifest.nextElement().openStream())
            .mainAttributes
            .getValue("Version")
            ?.let {
                generatePatchList(it, loadedPatches)
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

@Suppress("DEPRECATION")
private fun generatePatchList(version: String, patches: Set<Patch<*>>) {
    val listJson = File("../patches-list.json")

    val patchesMap = patches.sortedBy { it.name }.map {
        JsonPatch(
            it.name!!,
            it.description,
            it.use,
            it.dependencies.mapNotNull { dependency -> dependency.name }.sorted(),
            it.compatiblePackages?.associate { (packageName, versions) -> packageName to versions },
            it.options.values.map { option ->
                JsonPatch.Option(
                    option.key,
                    option.title,
                    option.description,
                    option.required,
                    option.type.toString(),
                    option.default,
                    option.values,
                )
            },
        )
    }

    val gsonBuilder = GsonBuilder()
        .serializeNulls()
        .disableHtmlEscaping()
        .setPrettyPrinting()
        .create()

    val jsonObject = JsonObject()
    jsonObject.addProperty("version", version)
    jsonObject.add("patches", gsonBuilder.toJsonTree(patchesMap))

    listJson.writeText(
        gsonBuilder.toJson(jsonObject)
    )
}

@Suppress("unused")
private class JsonPatch(
    val name: String? = null,
    val description: String? = null,
    val use: Boolean = true,
    val dependencies: List<String>,
    val compatiblePackages: Map<PackageName, Set<VersionName>?>? = null,
    val options: List<Option>,
) {
    class Option(
        val key: String,
        val title: String?,
        val description: String?,
        val required: Boolean,
        val type: String,
        val default: Any?,
        val values: Map<String, Any?>?,
    )
}
