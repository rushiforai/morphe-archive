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
 *
 * https://www.gnu.org/licenses/gpl-3.0.html
 *
 * File-Specific Exception to Section 7b:
 * -------------------------------------
 * Section 7b (Attribution Requirement) of the Morphe patches LICENSE
 * does not apply to THIS FILE. Use of this file does NOT require any
 * user-facing, in-application, or UI-visible attribution.
 *
 * For this file only, attribution under Section 7b is satisfied by
 * retaining this comment block in the source code of this file.
 *
 * Distribution and Derivative Works:
 * ----------------------------------
 * This comment block MUST be preserved in all copies, distributions,
 * and derivative works of this file, whether in source or modified
 * form.
 *
 * All other terms of the Morphe Patches LICENSE, including Section 7c
 * (Project Name Restriction) and the GPLv3 itself, remain fully
 * applicable to this file.
 */


/*
 * Forked from:
 * https://github.com/RookieEnough/De-Vanced/blob/9ac979883a6b6eeab5cefb4fc5d955073f2f2bc2/patches/src/main/kotlin/app/morphe/util/PatchListGenerator.kt
 * (GPL-3.0), by way of
 * https://github.com/icysymmetra/tiktok-patches-for-morphe/blob/ebf6296845cb889608cdc6681348ccb2e550f2bc/patches/src/main/kotlin/app/morphe/util/PatchListGenerator.kt
 * The tiktok-patches-for-morphe copy cites a ReVanced path that never held this file.
 */
package app.morphe.util

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.google.gson.GsonBuilder
import com.google.gson.JsonObject
import java.io.File
import java.util.jar.JarFile

internal fun main(args: Array<String>) {
    require(args.size == 1) { "Expected the current patch bundle version" }
    val patchFile = File("build/libs/patches-${args.single()}.mpp")
    require(patchFile.isFile) { "Current patch bundle not found: ${patchFile.path}" }
    val version = JarFile(patchFile).use { archive ->
        checkNotNull(archive.manifest?.mainAttributes?.getValue("Version")) {
            "Patch bundle is missing the Version attribute"
        }
    }
    check(version == args.single()) { "Patch bundle version $version does not match ${args.single()}" }
    generatePatchList(version, loadPatchesFromJar(setOf(patchFile)))
}

@Suppress("DEPRECATION")
private fun generatePatchList(version: String, patches: Set<Patch>) {
    val listJson = File("../patches-list.json")

    val patchesMap = patches.sortedBy { it.name }.map { patch ->
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
