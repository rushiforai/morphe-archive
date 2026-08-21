package anxyis.morphe.util

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.google.gson.GsonBuilder
import com.google.gson.JsonObject
import java.io.File
import java.net.URLClassLoader
import java.util.jar.Manifest

fun main() {
    val patchLibsDir = File("build/libs/")
    val mppFiles = patchLibsDir.listFiles { file ->
        val fileName = file.name
        !fileName.contains("javadoc") && !fileName.contains("sources") && fileName.endsWith(".mpp")
    }

    if (mppFiles == null || mppFiles.isEmpty()) {
        println("No .mpp bundle found in build/libs/. Skipping patch list generation.")
        return
    }

    val patchFiles = setOf(mppFiles.first())
    val loadedPatches = loadPatchesFromJar(patchFiles)
    val patchClassLoader = URLClassLoader(patchFiles.map { it.toURI().toURL() }.toTypedArray())
    val manifest = patchClassLoader.getResources("META-INF/MANIFEST.MF")

    var version = "1.0.0"
    while (manifest.hasMoreElements()) {
        Manifest(manifest.nextElement().openStream())
            .mainAttributes
            .getValue("Version")
            ?.let { version = it }
    }
    generatePatchList(version, loadedPatches)
}

private fun generatePatchList(version: String, patches: Set<Patch<*>>) {
    val listJson = File("../patches-list.json")
    val patchesMap = patches.sortedBy { it.name }.map { patch ->
        JsonPatch(
            name = patch.name ?: "",
            description = patch.description,
            default = patch.default,
            dependencies = patch.dependencies.map { it.javaClass.simpleName },
            compatiblePackages = patch.compatibility?.map { compat ->
                JsonCompatibility(
                    packageName = compat.packageName ?: "",
                    name = compat.name,
                    description = compat.description,
                    apkFileType = compat.apkFileType?.name,
                    appIconColor = compat.appIconColor?.let { "#%06X".format(it) },
                    signatures = compat.signatures,
                    targets = compat.targets.map { target ->
                        JsonCompatibility.Target(
                            version = target.version,
                            versionCodes = target.versionCodes?.mapKeys { it.key.name },
                            isExperimental = target.isExperimental,
                            minSdk = target.minSdk,
                            description = target.description
                        )
                    }
                )
            },
            options = patch.options.values.map { option ->
                JsonPatch.Option(
                    key = option.key,
                    title = option.title,
                    description = option.description,
                    required = option.required,
                    type = option.type.toString(),
                    default = option.default,
                    values = option.values
                )
            }
        )
    }

    val gson = GsonBuilder()
        .serializeNulls()
        .disableHtmlEscaping()
        .setPrettyPrinting()
        .create()

    val jsonObject = JsonObject()
    jsonObject.addProperty(
        "NOTE",
        "Do NOT manually edit this file. This file is automatically updated by release.yml."
    )
    jsonObject.addProperty("version", version)
    jsonObject.add("patches", gson.toJsonTree(patchesMap))

    listJson.writeText(gson.toJson(jsonObject))
    println("Generated patches-list.json for version $version (${patches.size} patches)")
}

private class JsonPatch(
    val name: String,
    val description: String?,
    val default: Boolean,
    val dependencies: List<String>,
    val compatiblePackages: List<JsonCompatibility>?,
    val options: List<Option>
) {
    class Option(
        val key: String,
        val title: String?,
        val description: String?,
        val required: Boolean,
        val type: String,
        val default: Any?,
        val values: Map<String, Any?>?
    )
}

private class JsonCompatibility(
    val packageName: String,
    val name: String?,
    val description: String?,
    val apkFileType: String?,
    val appIconColor: String?,
    val signatures: Set<String>?,
    val targets: List<Target>
) {
    class Target(
        val version: String?,
        val versionCodes: Map<String, Int>?,
        val isExperimental: Boolean,
        val minSdk: Int?,
        val description: String?
    )
}
