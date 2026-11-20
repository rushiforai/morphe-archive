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
import java.net.URLClassLoader
import java.util.jar.Manifest

fun main() {
    val patchFiles = setOf(
        File("build/libs/").listFiles { file ->
            val fileName = file.name
            !fileName.contains("javadoc") &&
                !fileName.contains("sources") &&
                fileName.endsWith(".mpp")
        }!!.maxByOrNull { it.lastModified() }!!
    )
    val loadedPatches = loadPatchesFromJar(patchFiles)
    val internalLoaded = loadedPatches.filter { isInternalPatch(it) }
    check(internalLoaded.isEmpty()) {
        "Discovered internal patches via PatchLoader: ${internalLoaded.map { it.name }}"
    }
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
private fun isInternalPatch(patch: Patch<*>): Boolean = patch.category == "Internal" ||
    patch.name?.endsWith("(Internal Resource)") == true ||
    patch.name?.endsWith("(Internal Raw Resource)") == true

@Suppress("DEPRECATION")
private fun generatePatchList(version: String, patches: Set<Patch<*>>) {
    val listJson = File("../patches-list.json")

    val userFacingPatches = patches.filterNot { isInternalPatch(it) }
    val appsList = deriveAppCatalog(userFacingPatches)
    val patchesMap = userFacingPatches.sortedBy { it.name }.map { patch ->
        JsonPatch(
            name = patch.name!!,
            description = patch.description,
            default = patch.default,
            category = patch.category,
            dependencies = patch.dependencies.filterNot { isInternalPatch(it) }.map { it.name!! },
            // Patches with null compatiblePackages are universal (apply to any app).
            compatiblePackages = patch.compatibility?.map { compat ->
                JsonCompatibility(
                    packageName = compat.packageName!!,
                    name = compat.name,
                    description = compat.description,
                    apkFileType = compat.apkFileType?.name,
                    // Format as #RRGGBB string for readability; null if not set
                    appIconColor = compat.appIconColor?.let { "#%06X".format(it) },
                    signatures = compat.signatures,
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
            "semantic release (release.yml) runs. Manually editing this file can break " +
            "your releases and break third party tools that use this file."
    )
    jsonObject.addProperty("version", version)
    jsonObject.add("apps", gson.toJsonTree(appsList))
    jsonObject.add("patches", gson.toJsonTree(patchesMap))

    listJson.writeText(gson.toJson(jsonObject) + "\n")
}

private object VersionComparator : Comparator<String> {
    private fun parseSegments(v: String): List<Long> {
        val clean = v.replace(Regex("^v", RegexOption.IGNORE_CASE), "")
            .substringBefore('-')
            .substringBefore('+')
        return clean.split('.').map { part ->
            val digits = part.filter { it.isDigit() }
            if (digits.isEmpty()) 0L else (digits.toLongOrNull() ?: 0L)
        }
    }

    override fun compare(a: String, b: String): Int {
        val aParts = parseSegments(a)
        val bParts = parseSegments(b)
        val maxLength = maxOf(aParts.size, bParts.size)
        for (i in 0 until maxLength) {
            val aVal = aParts.getOrElse(i) { 0L }
            val bVal = bParts.getOrElse(i) { 0L }
            if (aVal > bVal) return 1
            if (aVal < bVal) return -1
        }
        return a.compareTo(b)
    }
}

private class AppCatalogAccumulator(val packageName: String) {
    var name: String? = null
    var description: String? = null
    var apkFileType: String? = null
    var appIconColor: String? = null
    val signatures = mutableSetOf<String>()
    val patchNames = mutableSetOf<String>()
    val targetsByVersion = mutableMapOf<String, JsonCompatibility.Target>()
}

private fun deriveAppCatalog(userFacingPatches: List<Patch<*>>): List<JsonApp> {
    val accumulators = mutableMapOf<String, AppCatalogAccumulator>()

    for (patch in userFacingPatches) {
        val patchName = patch.name?.takeIf { it.isNotBlank() }
            ?: error("User-facing patch is missing a non-blank name")
        val compatibility = patch.compatibility ?: continue

        for (compat in compatibility) {
            val packageName = compat.packageName?.takeIf { it.isNotBlank() }
                ?: error("Patch '$patchName' contains compatibility entry with missing or blank packageName")

            val app = accumulators.getOrPut(packageName) { AppCatalogAccumulator(packageName) }
            app.patchNames.add(patchName)

            compat.name?.takeIf { it.isNotBlank() }?.let { newName ->
                val current = app.name
                if (current != null && current != newName) {
                    error("Conflicting app name for package $packageName: '$current' vs '$newName' in patch '$patchName'")
                }
                app.name = newName
            }

            compat.description?.let { newDesc ->
                val current = app.description
                if (current != null && current != newDesc) {
                    error("Conflicting description for package $packageName: '$current' vs '$newDesc' in patch '$patchName'")
                }
                app.description = newDesc
            }

            compat.apkFileType?.name?.let { newType ->
                val current = app.apkFileType
                if (current != null && current != newType) {
                    error("Conflicting apkFileType for package $packageName: '$current' vs '$newType' in patch '$patchName'")
                }
                app.apkFileType = newType
            }

            compat.appIconColor?.let { "#%06X".format(it) }?.let { newColor ->
                val current = app.appIconColor
                if (current != null && current != newColor) {
                    error("Conflicting appIconColor for package $packageName: '$current' vs '$newColor' in patch '$patchName'")
                }
                app.appIconColor = newColor
            }

            compat.signatures?.let { sigs ->
                app.signatures.addAll(sigs)
            }

            for (target in compat.targets) {
                val version = target.version?.takeIf { it.isNotBlank() }
                    ?: error("Target for package $packageName in patch '$patchName' has null or blank version")

                val mappedTarget = JsonCompatibility.Target(
                    version = version,
                    versionCodes = target.versionCodes?.mapKeys { it.key.name },
                    isExperimental = target.isExperimental,
                    minSdk = target.minSdk,
                    description = target.description,
                )

                val existing = app.targetsByVersion[version]
                if (existing == null) {
                    app.targetsByVersion[version] = mappedTarget
                } else {
                    if (existing.versionCodes != mappedTarget.versionCodes) {
                        error("Conflicting versionCodes for package $packageName version $version: ${existing.versionCodes} vs ${mappedTarget.versionCodes} in patch '$patchName'")
                    }
                    if (existing.isExperimental != mappedTarget.isExperimental) {
                        error("Conflicting isExperimental for package $packageName version $version: ${existing.isExperimental} vs ${mappedTarget.isExperimental} in patch '$patchName'")
                    }
                    if (existing.minSdk != mappedTarget.minSdk) {
                        error("Conflicting minSdk for package $packageName version $version: ${existing.minSdk} vs ${mappedTarget.minSdk} in patch '$patchName'")
                    }
                    if (existing.description != mappedTarget.description) {
                        error("Conflicting description for package $packageName version $version: '${existing.description}' vs '${mappedTarget.description}' in patch '$patchName'")
                    }
                }
            }
        }
    }

    return accumulators.values.sortedBy { it.packageName }.map { app ->
        val name = app.name?.takeIf { it.isNotBlank() }
            ?: error("Missing app name for package ${app.packageName}")
        val apkFileType = app.apkFileType?.takeIf { it.isNotBlank() }
            ?: error("Missing apkFileType for package ${app.packageName}")

        if (app.targetsByVersion.isEmpty()) {
            error("Package ${app.packageName} has no supported versions declared")
        }

        val sortedVersions = app.targetsByVersion.keys.sortedWith(VersionComparator)
        val latestSupportedVersion = sortedVersions.last()
        val sortedTargets = sortedVersions.map { app.targetsByVersion.getValue(it) }

        JsonApp(
            packageName = app.packageName,
            name = name,
            description = app.description,
            apkFileType = apkFileType,
            appIconColor = app.appIconColor,
            signatures = app.signatures.toSortedSet().toList(),
            targets = sortedTargets,
            patchNames = app.patchNames.toSortedSet().toList(),
            supportedVersions = sortedVersions,
            latestSupportedVersion = latestSupportedVersion,
        )
    }
}

/** JSON representation of a canonical app entry in patches-list.json. */
@Suppress("unused")
private class JsonApp(
    val packageName: String,
    val name: String,
    val description: String?,
    val apkFileType: String,
    val appIconColor: String?,
    val signatures: List<String>,
    val targets: List<JsonCompatibility.Target>,
    val patchNames: List<String>,
    val supportedVersions: List<String>,
    val latestSupportedVersion: String,
)

/** JSON representation of a patch entry in patches-list.json. */
@Suppress("unused")
private class JsonPatch(
    val name: String? = null,
    val description: String? = null,
    val default: Boolean = true,
    /** Null when the patch declares no category and is left ungrouped. */
    val category: String? = null,
    val dependencies: List<String>,
    /** Null means the patch is universal and applies to any app. */
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

/** JSON representation of a compatible app entry, including name and per-version metadata. */
@Suppress("unused")
private class JsonCompatibility(
    /** Android package name, e.g. com.google.android.youtube. */
    val packageName: String,
    /** Human-readable app name declared in Compatibility, e.g. "YouTube". */
    val name: String?,
    /** User-facing description of the app. */
    val description: String?,
    /** Target unpatched app file type, e.g. APK, APKM. Null if not specified. */
    val apkFileType: String?,
    /** App icon background color as #RRGGBB string, or null if not set. */
    val appIconColor: String?,
    /** Valid SHA-256 signatures of the app. */
    val signatures: Set<String>?,
    val targets: List<Target>,
) {
    class Target(
        val version: String?,
        val versionCodes: Map<String, Int>?,
        val isExperimental: Boolean,
        /** Minimum device SDK version. Null means any SDK version. */
        val minSdk: Int?,
        /** Optional user-facing note about this specific version. */
        val description: String?,
    )
}
