/*
 * Copyright 2026 Brave Morphe Patches.
 */

package util

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.google.gson.GsonBuilder
import com.google.gson.JsonObject
import java.io.File
import java.util.Properties
import java.util.jar.JarFile

fun main() {
    val libsDir = File("build/libs/")
    val candidates = libsDir.listFiles { file ->
        val fileName = file.name
        !fileName.contains("javadoc") &&
            !fileName.contains("sources") &&
            fileName.endsWith(".mpp")
    }?.sortedBy { it.name } ?: emptyList()

    require(candidates.isNotEmpty()) {
        "No .mpp patch bundle found in ${libsDir.absolutePath}. Run :patches:buildAndroid first."
    }

    val expectedVersion = File("../gradle.properties")
        .takeIf { it.exists() }
        ?.inputStream()
        ?.use { input ->
            Properties().apply { load(input) }.getProperty("version")?.trim()
        }

    val selectedBundle = if (candidates.size == 1) {
        candidates.first()
    } else if (!expectedVersion.isNullOrEmpty()) {
        candidates.firstOrNull { it.name.contains("-$expectedVersion.mpp") }
            ?: throw IllegalStateException(
                "Multiple .mpp bundles found in ${libsDir.absolutePath} (${candidates.map { it.name }}), " +
                    "and none matched version=$expectedVersion"
            )
    } else {
        throw IllegalStateException(
            "Expected exactly 1 .mpp bundle in ${libsDir.absolutePath}, found ${candidates.map { it.name }}"
        )
    }

    val patchFiles = setOf(selectedBundle)
    val loadedPatches = loadPatchesFromJar(patchFiles)

    val version = JarFile(selectedBundle).use { jar ->
        jar.manifest?.mainAttributes?.getValue("Version")
    } ?: expectedVersion ?: "1.0.0"

    generatePatchList(version, loadedPatches)
}

@Suppress("DEPRECATION")
private fun generatePatchList(version: String, patches: Set<Patch>) {
    val listJson = File("../patches-list.json")

    val patchesMap = patches.sortedBy { it.name ?: "" }.map { patch ->
        JsonPatch(
            name = patch.name ?: "",
            description = patch.description,
            default = patch.default,
            category = patch.category,
            compatiblePackages = patch.compatibility?.map { compat ->
                JsonCompatibility(
                    packageName = compat.packageName ?: "",
                    name = compat.name,
                    description = compat.description,
                    apkFileType = compat.apkFileType?.name,
                    appIconColor = compat.appIconColor?.let { "#%06X".format(it) },
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
        "Do NOT manually edit this file. This file is automatically updated when " +
                "patches are compiled."
    )
    jsonObject.addProperty("version", version)
    jsonObject.add("patches", gson.toJsonTree(patchesMap))

    listJson.writeText(gson.toJson(jsonObject))
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
