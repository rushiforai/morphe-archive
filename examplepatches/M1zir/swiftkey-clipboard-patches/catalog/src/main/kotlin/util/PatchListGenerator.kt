/*
 * Copyright 2025 Morphe.
 * https://github.com/MorpheApp/morphe-patches-template
 */

package util

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.google.gson.GsonBuilder
import com.google.gson.JsonObject
import com.google.gson.JsonParser
import java.io.File
import java.util.jar.JarFile
import java.time.LocalDateTime

// Adapted from the Morphe template; never packaged into the MPP.
// Explicit input avoids stale bundles and unrelated classpath manifests.
fun main(args: Array<String>) {
    require(args.size == 2) { "Expected bundle.mpp and output patches-list.json" }
    val bundle = File(args[0])
    val patchFiles = setOf(bundle)
    val loadedPatches = loadPatchesFromJar(patchFiles)
    val version = JarFile(bundle).use { requireNotNull(it.manifest.mainAttributes.getValue("Version")) }
    val output = File(args[1])
    val metadata = output.parentFile.resolve("patches-bundle.json").reader().use {
        JsonParser.parseReader(it).asJsonObject
    }
    // Match the Manager's ReleaseAsset LocalDateTime serializer, not Instant.
    LocalDateTime.parse(metadata.get("created_at").asString)
    require(metadata.get("version").asString == version) { "Bundle/source version mismatch" }
    require(metadata.get("download_url").asString.endsWith("/v$version/${bundle.name}")) {
        "Source URL does not point to the versioned bundle"
    }
    require(loadedPatches.count { it.name != null } > 0) { "No selectable patches in bundle" }
    generatePatchList(version, loadedPatches, output)
}

@Suppress("DEPRECATION")
private fun generatePatchList(version: String, patches: Set<Patch>, listJson: File) {
    val patchesMap = patches.filter { it.name != null }.sortedBy { it.name }.map { patch ->
        JsonPatch(
            name = patch.name!!,
            description = patch.description,
            default = patch.default,
            category = patch.category,
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
        "Generated from the compiled MPP by :catalog:generatePatchesList. Do not edit manually."
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
    /** Null when the patch declares no category and is left ungrouped. */
    val category: String? = null,
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
