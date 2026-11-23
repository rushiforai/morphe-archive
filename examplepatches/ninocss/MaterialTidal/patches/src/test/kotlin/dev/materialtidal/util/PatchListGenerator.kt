package dev.materialtidal.util

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.google.gson.GsonBuilder
import com.google.gson.JsonObject
import java.io.File
import java.net.URLClassLoader
import java.util.jar.Manifest

fun main(args: Array<String>) {
    require(args.size >= 2) {
        "Usage: PatchListGeneratorKt <patches.mpp> <outputJsonPath> [version]"
    }

    val mppFile = File(args[0])
    val outputFile = File(args[1])
    require(mppFile.isFile) { "Missing .mpp bundle: $mppFile" }

    val loadedPatches = loadPatchesFromJar(setOf(mppFile)).toSet()
    require(loadedPatches.isNotEmpty()) { "No patches found in $mppFile" }

    val version = args.getOrNull(2)?.trim()?.takeIf { it.isNotEmpty() }
        ?: readManifestVersion(mppFile)
        ?: error("Unable to determine bundle version from arguments or ${mppFile.name} manifest")

    writePatchList(version, loadedPatches, outputFile)
}

private fun readManifestVersion(mppFile: File): String? {
    URLClassLoader(arrayOf(mppFile.toURI().toURL())).use { classLoader ->
        val manifests = classLoader.getResources("META-INF/MANIFEST.MF")
        while (manifests.hasMoreElements()) {
            manifests.nextElement().openStream().use { stream ->
                val version = Manifest(stream).mainAttributes.getValue("Version")
                if (!version.isNullOrBlank()) {
                    return version
                }
            }
        }
    }
    return null
}

@Suppress("DEPRECATION")
private fun writePatchList(version: String, patches: Set<Patch>, outputFile: File) {
    val patchesMap = patches.sortedBy { it.name }.map { patch ->
        JsonPatch(
            name = patch.name!!,
            description = patch.description,
            default = patch.default,
            category = patch.category,
            compatiblePackages = patch.compatibility?.map { compat ->
                JsonCompatibility(
                    packageName = compat.packageName!!,
                    name = compat.name,
                    description = compat.description,
                    apkFileType = compat.apkFileType?.name,
                    appIconColor = compat.appIconColor?.let { "#%06X".format(it and 0xFFFFFF) },
                    signatures = compat.signatures,
                    formFactor = compat.formFactor?.name,
                    targets = compat.targets.map { target ->
                        JsonCompatibility.Target(
                            version = target.version,
                            versionCodes = target.versionCodes?.mapKeys { it.key.name },
                            isExperimental = target.isExperimental,
                            minSdk = target.minSdk,
                            description = target.description,
                        )
                    },
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
                    values = option.values,
                )
            },
        )
    }

    val gson = GsonBuilder()
        .serializeNulls()
        .disableHtmlEscaping()
        .setPrettyPrinting()
        .create()

    val jsonObject = JsonObject().apply {
        addProperty(
            "NOTE",
            "Do NOT manually edit this file. This file is automatically updated when " +
                "release.yml runs. Manually editing this file can break your releases " +
                "and break third party tools that use this file.",
        )
        addProperty("version", version)
        add("patches", gson.toJsonTree(patchesMap))
    }

    outputFile.parentFile?.mkdirs()
    outputFile.writeText(gson.toJson(jsonObject) + "\n", Charsets.UTF_8)
    println("Generated ${outputFile.absolutePath} with ${patchesMap.size} patch(es) for v$version.")
}

@Suppress("unused")
private class JsonPatch(
    val name: String? = null,
    val description: String? = null,
    val default: Boolean = true,
    val category: String? = null,
    val compatiblePackages: List<JsonCompatibility>? = null,
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

@Suppress("unused")
private class JsonCompatibility(
    val packageName: String,
    val name: String?,
    val description: String?,
    val apkFileType: String?,
    val appIconColor: String?,
    val signatures: Set<String>?,
    val formFactor: String?,
    val targets: List<Target>,
) {
    class Target(
        val version: String?,
        val versionCodes: Map<String, Int>?,
        val isExperimental: Boolean,
        val minSdk: Int?,
        val description: String?,
    )
}
