/*
 * Copyright 2025 Morphe.
 * https://github.com/MorpheApp/morphe-patches-template
 */

package util

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.google.gson.GsonBuilder
import com.google.gson.JsonObject
import java.io.File

fun main(args: Array<String>) {
    require(args.size == 1) { "Expected the current project version" }
    val version = args.single()
    val patchFile = File("build/libs/patches-$version.mpp")
    require(patchFile.isFile) { "Current patch bundle does not exist: $patchFile" }

    generatePatchList(version, loadPatchesFromJar(setOf(patchFile)))
}

@Suppress("DEPRECATION")
private fun generatePatchList(version: String, patches: Set<Patch<*>>) {
    val patchesMap = patches.sortedBy { it.name }.map { patch ->
        JsonPatch(
            name = patch.name!!,
            description = patch.description,
            default = patch.default,
            dependencies = patch.dependencies.map { it.javaClass.simpleName },
            compatiblePackages = patch.compatibility?.map { compatibility ->
                JsonCompatibility(
                    packageName = compatibility.packageName!!,
                    name = compatibility.name,
                    description = compatibility.description,
                    apkFileType = compatibility.apkFileType?.name,
                    appIconColor = compatibility.appIconColor?.let { "#%06X".format(it) },
                    signatures = compatibility.signatures,
                    targets = compatibility.targets.map { target ->
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

    val json = JsonObject().apply {
        addProperty(
            "NOTE",
            "Do NOT manually edit this file. This file is automatically updated when " +
                "semantic release (release.yml) runs. Manually editing this file can break " +
                "your releases and break third party tools that use this file.",
        )
        addProperty("version", version)
        add("patches", gson.toJsonTree(patchesMap))
    }

    File("../patches-list.json").writeText(gson.toJson(json) + "\n")
}

@Suppress("unused")
private class JsonPatch(
    val name: String? = null,
    val description: String? = null,
    val default: Boolean = true,
    val dependencies: List<String>,
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
