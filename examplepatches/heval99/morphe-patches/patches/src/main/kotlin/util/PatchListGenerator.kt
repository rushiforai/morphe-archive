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
import java.util.jar.JarFile

/**
 * System property with the Gradle project version (gradle.properties `version`, bumped by
 * semantic-release). patches/build.gradle.kts passes it to generatePatchesList and the tests.
 */
const val PATCHES_VERSION_PROPERTY = "patches.version"

fun main() {
    val version = requirePatchesVersion()
    val bundle = selectPatchBundle(File("build/libs"), version)
    generatePatchList(version, loadPatchesFromJar(setOf(bundle)))
}

/** The project version from [PATCHES_VERSION_PROPERTY]; fails when it was not passed in. */
fun requirePatchesVersion(): String =
    System.getProperty(PATCHES_VERSION_PROPERTY)?.takeIf { it.isNotBlank() && it != "unspecified" }
        ?: error(
            "system property $PATCHES_VERSION_PROPERTY is not set; run through Gradle " +
                "(:patches:generatePatchesList or :patches:test), which passes the gradle.properties version"
        )

/**
 * Exactly `patches-<version>.mpp` in [libsDir]. Other bundles there (older versions left in
 * build/libs, whatever their timestamps) are ignored. Fails when the bundle is missing or its own
 * manifest names another version.
 */
fun selectPatchBundle(libsDir: File, version: String): File {
    val bundle = File(libsDir, "patches-$version.mpp")
    if (!bundle.isFile) {
        val others = libsDir.listFiles { file -> file.isFile && file.name.endsWith(".mpp") }
            ?.map { it.name }?.sorted().orEmpty()
        error(
            "patch bundle ${bundle.path} for version $version not found; build it with " +
                "`./gradlew :patches:buildAndroid`" +
                if (others.isEmpty()) "" else " (ignored other bundles: ${others.joinToString()})"
        )
    }
    val bundleVersion = JarFile(bundle).use { it.manifest?.mainAttributes?.getValue("Version") }
    check(bundleVersion == version) {
        "patch bundle ${bundle.path} has manifest Version $bundleVersion, expected $version; " +
            "rebuild it with `./gradlew :patches:buildAndroid`"
    }
    return bundle
}

@Suppress("DEPRECATION")
private fun generatePatchList(version: String, patches: Set<Patch<*>>) {
    val listJson = File("../patches-list.json")

    val patchesMap = patches.sortedBy { it.name }.map { patch ->
        JsonPatch(
            name = patch.name!!,
            description = patch.description,
            default = patch.default,
            dependencies = patch.dependencies.map { it.javaClass.simpleName },
            // Map each Compatibility to a JsonCompatibility object with full metadata.
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
                "semantic release (release.yml) runs. Manually editing this file can break " +
                "your releases and break third party tools that use this file."
    )
    jsonObject.addProperty("version", version)
    jsonObject.add("patches", gson.toJsonTree(patchesMap))

    listJson.writeText(gson.toJson(jsonObject))
}

/** JSON representation of a patch entry in patches-list.json. */
@Suppress("unused")
private class JsonPatch(
    val name: String? = null,
    val description: String? = null,
    val default: Boolean = true,
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
    /** Device form factor of the app, e.g. MOBILE, TV. Null means all form factors. */
    val formFactor: String?,
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
