package app.pausefix.util

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.google.gson.GsonBuilder
import com.google.gson.JsonObject
import java.io.File
import java.net.URLClassLoader
import java.util.jar.Manifest
import java.time.format.DateTimeFormatter
import java.time.Instant

typealias PackageName = String
typealias VersionName = String

internal fun main() {
    val patchFiles = setOf(
        File("build/libs/").listFiles { file ->
            val fileName = file.name
            !fileName.contains("javadoc") &&
                    !fileName.contains("sources") &&
                    fileName.endsWith(".mpp")
        }!!.first()
    )
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

@Suppress("DEPRECATION")
private fun generatePatchList(version: String, patches: Set<Patch<*>>) {
    val outputDir = File("build/outputs/")
    if (!outputDir.exists()) outputDir.mkdirs()
    val listJson = File(outputDir, "patches-list.json")
    val listBundleJson = File(outputDir, "patches-bundle.json")

    val patchesMap = patches.sortedBy { it.name }.map {
        JsonPatch(
            it.name!!,
            it.description,
            it.use,
            it.dependencies.map { dependency -> dependency.javaClass.simpleName },
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

    // 1. Generate patches-list.json
    val listObject = JsonObject()
    listObject.addProperty("version", version)
    listObject.add("patches", gsonBuilder.toJsonTree(patchesMap))
    listJson.writeText(gsonBuilder.toJson(listObject))

    // 2. Generate patches-bundle.json
    val bundleObject = JsonObject()
    bundleObject.addProperty("name", "YouTube Pause Fix")
    bundleObject.addProperty("version", version)
    bundleObject.addProperty("created_at", DateTimeFormatter.ISO_LOCAL_DATE_TIME.format(java.time.LocalDateTime.now(java.time.ZoneOffset.UTC).truncatedTo(java.time.temporal.ChronoUnit.SECONDS)))
    bundleObject.addProperty("description", "YouTube Pause Fix Patch Bundle")
    
    val runNumber = System.getenv("GITHUB_RUN_NUMBER") ?: "0"
    val repo = System.getenv("GITHUB_REPOSITORY") ?: "TrollTaylor/morphe-pause-fix"
    bundleObject.addProperty("source", "https://github.com/$repo")
    val tagName = if (runNumber == "0") "local" else "v1.0.$runNumber"
    val mppFileName = File("build/libs/").listFiles { file -> 
        file.name.endsWith(".mpp") && !file.name.contains("sources") && !file.name.contains("javadoc")
    }?.firstOrNull()?.name ?: "patches.mpp"
    
    bundleObject.addProperty("download_url", "https://github.com/$repo/releases/download/$tagName/$mppFileName")
    bundleObject.addProperty("signature_download_url", "")
    
    listBundleJson.writeText(gsonBuilder.toJson(bundleObject))
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
