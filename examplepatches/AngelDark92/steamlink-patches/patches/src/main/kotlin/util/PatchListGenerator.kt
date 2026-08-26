/*
 * Copyright 2025 Morphe.
 * https://github.com/MorpheApp/morphe-patches-template
 */

package util

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import app.template.patches.shared.Constants.EXPERIMENTAL_COMPATIBILITY_NAME
import com.google.gson.GsonBuilder
import com.google.gson.JsonObject
import java.io.File
import java.net.URLClassLoader
import java.util.jar.Manifest

internal enum class ReleaseChannel {
    STABLE,
    EXPERIMENTAL,
    ALL;

    companion object {
        fun from(raw: String?): ReleaseChannel = when (raw?.trim()?.lowercase()) {
            "stable" -> STABLE
            "experimental" -> EXPERIMENTAL
            "all", null, "" -> ALL
            else -> error("Unsupported release channel '$raw'. Use stable, experimental, or all.")
        }
    }
}

internal fun targetsForReleaseChannel(
    compatibility: app.morphe.patcher.patch.Compatibility,
    releaseChannel: ReleaseChannel,
) = compatibility.targets.filter { target ->
    // Patch release channel and APK-version support are independent. Projection experiments
    // stay in the experimental bundle even though Steam Link 2.0.22 itself is a stable target.
    val experimentalPatch = compatibility.name == EXPERIMENTAL_COMPATIBILITY_NAME
    when (releaseChannel) {
        ReleaseChannel.STABLE -> !experimentalPatch && !target.isExperimental
        // Pre-release bundles are a superset: retain stable patches and add experimental ones.
        ReleaseChannel.EXPERIMENTAL -> true
        ReleaseChannel.ALL -> true
    }
}

fun main(args: Array<String>) {
    val releaseChannel =
        ReleaseChannel.from(args.firstOrNull() ?: System.getenv("MORPHE_RELEASE_CHANNEL"))

    val patchFiles = setOf(
        File("build/libs/")
            .listFiles { file ->
                val fileName = file.name
                !fileName.contains("javadoc") &&
                        !fileName.contains("sources") &&
                        fileName.endsWith(".mpp")
            }
            ?.sortedByDescending { it.lastModified() }
            ?.firstOrNull()
            ?: error("No built patch archive found in build/libs")
    )
    val loadedPatches = loadPatchesFromJar(patchFiles)
    val patchClassLoader = URLClassLoader(patchFiles.map { it.toURI().toURL() }.toTypedArray())
    val manifest = patchClassLoader.getResources("META-INF/MANIFEST.MF")

    while (manifest.hasMoreElements()) {
        Manifest(manifest.nextElement().openStream())
            .mainAttributes
            .getValue("Version")
            ?.let {
                generatePatchLists(it, loadedPatches, releaseChannel)
            }
    }
}

@Suppress("DEPRECATION")
private fun generatePatchLists(
    version: String,
    patches: Set<Patch<*>>,
    selectedChannel: ReleaseChannel,
) {
    val channelDocuments = mapOf(
        ReleaseChannel.STABLE to buildPatchListJson(version, patches, ReleaseChannel.STABLE),
        ReleaseChannel.EXPERIMENTAL to buildPatchListJson(version, patches, ReleaseChannel.EXPERIMENTAL),
        ReleaseChannel.ALL to buildPatchListJson(version, patches, ReleaseChannel.ALL),
        selectedChannel to buildPatchListJson(version, patches, selectedChannel),
    )

    File("../patches-list-stable.json").writeText(channelDocuments.getValue(ReleaseChannel.STABLE) + "\n")
    File("../patches-list-experimental.json").writeText(channelDocuments.getValue(ReleaseChannel.EXPERIMENTAL) + "\n")
    File("../patches-list-all.json").writeText(channelDocuments.getValue(ReleaseChannel.ALL) + "\n")
    File("../patches-list.json").writeText(channelDocuments.getValue(selectedChannel) + "\n")
}

@Suppress("DEPRECATION")
private fun buildPatchListJson(
    version: String,
    patches: Set<Patch<*>>,
    releaseChannel: ReleaseChannel,
): String {
    val patchesMap = patches.sortedBy { it.name }.mapNotNull { patch ->
        val compatiblePackages = patch.compatibility?.mapNotNull { compat ->
            val filteredTargets = targetsForReleaseChannel(compat, releaseChannel)

            if (filteredTargets.isEmpty()) {
                null
            } else {
                JsonCompatibility(
                    packageName = compat.packageName!!,
                    name = compat.name,
                    description = compat.description,
                    apkFileType = compat.apkFileType?.name,
                    // Format as #RRGGBB string for readability; null if not set
                    appIconColor = compat.appIconColor?.let { "#%06X".format(it) },
                    signatures = compat.signatures,
                    targets = filteredTargets.map { target ->
                        JsonCompatibility.Target(
                            version = target.version,
                            versionCodes = target.versionCodes?.mapKeys { it.key.name },
                            isExperimental = target.isExperimental,
                            minSdk = target.minSdk,
                            description = target.description,
                        )
                    },
                )
            }
        }

        if (patch.compatibility != null && compatiblePackages.isNullOrEmpty()) {
            null
        } else {
        JsonPatch(
            name = patch.name!!,
            description = patch.description,
            default = patch.default,
            dependencies = patch.dependencies.map { it.javaClass.simpleName },
            // Null means universal patch. Non-null means scoped to app targets.
            compatiblePackages = compatiblePackages,
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
    }

    val gson = GsonBuilder()
        .serializeNulls()
        .disableHtmlEscaping()
        .setPrettyPrinting()
        .create()

    val jsonObject = JsonObject()
    jsonObject.addProperty(
        "NOTE",
        "Do NOT manually edit this file. This file is automatically generated per channel when " +
                "semantic release (release.yml) runs. Manually editing this file can break " +
                "your releases and break third party tools that use this file."
    )
    jsonObject.addProperty("channel", releaseChannel.name.lowercase())
    jsonObject.addProperty("version", version)
    jsonObject.add("patches", gson.toJsonTree(patchesMap))

    return gson.toJson(jsonObject)
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
