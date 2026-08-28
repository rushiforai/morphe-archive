/*
 * Copyright 2025 Morphe.
 * Modified 2026 by NullWaypoint.
 *
 * Originally derived from:
 * https://github.com/MorpheApp/morphe-patches-template
 *
 * See LICENSE for licensing terms.
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
        }!!.first(),
    )

    val loadedPatches = loadPatchesFromJar(patchFiles)
    val patchClassLoader = URLClassLoader(
        patchFiles.map { it.toURI().toURL() }.toTypedArray(),
    )
    val manifests = patchClassLoader.getResources("META-INF/MANIFEST.MF")

    while (manifests.hasMoreElements()) {
        Manifest(manifests.nextElement().openStream())
            .mainAttributes
            .getValue("Version")
            ?.let { version ->
                generatePatchList(version, loadedPatches)
            }
    }
}

@Suppress("DEPRECATION")
private fun generatePatchList(
    version: String,
    patches: Set<Patch<*>>,
) {
    val listJson = File("../patches-list.json")

    val patchesMap = patches
        .sortedBy { it.name }
        .map { patch ->
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
                        appIconColor = compatibility.appIconColor?.let {
                            "#%06X".format(it)
                        },
                        signatures = compatibility.signatures,
                        targets = compatibility.targets.map { target ->
                            JsonCompatibility.Target(
                                version = target.version,
                                versionCodes = target.versionCodes?.mapKeys {
                                    it.key.name
                                },
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

    val jsonObject = JsonObject()

    jsonObject.addProperty(
        "NOTE",
        "Do NOT manually edit this file. This file is automatically updated when " +
            "semantic release (release.yml) runs. Manually editing this file can break " +
            "your releases and break third party tools that use this file.",
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

/** JSON representation of a compatible app and its supported versions. */
@Suppress("unused")
private class JsonCompatibility(
    /** Android package name, for example com.crunchyroll.crunchyroid. */
    val packageName: String,
    /** Human-readable app name declared in Compatibility. */
    val name: String?,
    /** User-facing description of the app. */
    val description: String?,
    /** Target unpatched app file type, such as APK or APKM. */
    val apkFileType: String?,
    /** App icon background colour as #RRGGBB, or null if not specified. */
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