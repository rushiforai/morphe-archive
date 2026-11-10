/*
 * Copyright 2025 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * File-Specific License Notice (GPLv3 Section 7 Terms)
 *
 * This file is part of the Morphe patches project and is licensed under
 * the GNU General Public License version 3 (GPLv3), with the Additional
 * Terms under Section 7 described in the Morphe patches
 * LICENSE file: https://github.com/MorpheApp/morphe-patches/blob/main/NOTICE
 */

package util

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.google.gson.Gson
import com.google.gson.GsonBuilder
import com.google.gson.JsonObject
import java.io.File
import java.net.URLClassLoader
import java.util.jar.Manifest

typealias PackageName = String
typealias VersionName = String

fun main() {
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

/**
 * Emits `version`, root-level `appNames` (package to label), and `patches` with
 * `compatiblePackages`, **`compatibility`** (full `Compatibility` metadata for Manager UI),
 * and options.
 */
@Suppress("DEPRECATION")
private fun generatePatchList(version: String, patches: Set<Patch>) {
    val listJson = File("../patches-list.json")

    val appNames = patches
        .asSequence()
        .flatMap { it.compatibility.orEmpty().asSequence() }
        .mapNotNull { c ->
            val pkg = c.packageName ?: return@mapNotNull null
            val label = c.name ?: return@mapNotNull null
            pkg to label
        }
        .toMap()

    val patchesMap = patches.sortedBy { it.name }.map {
        JsonPatch(
            name = it.name!!,
            description = it.description,
            category = it.category,
            use = true,
            dependencies = it.dependencies
                .map { dependency -> dependency.name ?: dependency.javaClass.simpleName }
                .distinct()
                .sorted(),
            compatiblePackages = it.compatibility?.mapNotNull { c -> c.legacyPackage() }?.toMap(),
            compatibility = it.compatibility.orEmpty().map { c -> c.toJsonCompatibility() },
            options = it.options.values.map { option ->
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

    val gsonBuilder = GsonBuilder()
        .serializeNulls()
        .disableHtmlEscaping()
        .setPrettyPrinting()
        .create()

    val jsonObject = JsonObject()
    jsonObject.addProperty("version", "v$version")
    jsonObject.add("appNames", gsonBuilder.toJsonTree(appNames))
    jsonObject.add("patches", gsonBuilder.toJsonTree(patchesMap))

    listJson.writeText(
        gsonBuilder.toJson(jsonObject)
    )
}

private fun Compatibility.legacyPackage(): Pair<PackageName, Set<VersionName>?>? {
    val pkg = packageName ?: return null
    val onlyExperimental = targets.none { !it.isExperimental }
    val counted = targets.filter { onlyExperimental || !it.isExperimental }
    if (counted.any { it.version == null }) return pkg to null
    return pkg to counted.mapNotNull { it.version }.toSet().ifEmpty { null }
}

private fun Compatibility.toJsonCompatibility() = JsonCompatibility(
    name = name ?: "",
    packageName = packageName ?: "",
    description = description?.takeUnless { it.isBlank() },
    appIconColor = appIconColor,
    signatures = signatures?.sorted(),
    targets = targets?.map { t -> t.toJsonAppTarget() },
)

private fun AppTarget.toJsonAppTarget() = JsonAppTarget(
    version = version ?: "",
    experimental = isExperimental,
    versionCodes = versionCodes?.entries?.sortedBy { it.key.name }?.associate { it.key.name to it.value },
)

@Suppress("unused")
private class JsonCompatibility(
    val name: String,
    val packageName: String,
    val description: String? = null,
    val appIconColor: Int?,
    val signatures: List<String>?,
    val targets: List<JsonAppTarget>?,
)

@Suppress("unused")
private class JsonAppTarget(
    val version: String,
    val experimental: Boolean = false,
    val versionCodes: Map<String, Int>? = null,
)

@Suppress("unused")
private class JsonPatch(
    val name: String? = null,
    val description: String? = null,
    val category: String? = null,
    val use: Boolean = true,
    val dependencies: List<String>,
    val compatiblePackages: Map<PackageName, Set<VersionName>?>? = null,
    val compatibility: List<JsonCompatibility>,
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
