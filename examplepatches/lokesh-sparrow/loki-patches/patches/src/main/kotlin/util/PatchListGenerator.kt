/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package util

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.google.gson.Gson
import com.google.gson.GsonBuilder
import com.google.gson.JsonObject
import java.io.File
import java.net.URLClassLoader
import java.util.jar.Manifest

/**
 * Writes ../patches-list.json, the patch manifest that the Morphe Manager and the README table are built
 * from, out of the bundle this module has just built. Run by the generatePatchesList task in CI; the file it
 * writes is generated state and is not edited by hand.
 */

/** The one bundle in build/libs: no javadoc or sources jar, and exactly one .mpp. */
private fun builtBundle(): File {
    val bundles = File("build/libs").listFiles { file ->
        file.name.endsWith(".mpp") && !file.name.contains("javadoc") && !file.name.contains("sources")
    }!!
    require(bundles.isNotEmpty()) { "No .mpp in build/libs" }
    return bundles.first()
}

fun main() {
    val bundle = builtBundle()
    val patches = loadPatchesFromJar(setOf(bundle))
    val loader = URLClassLoader(arrayOf(bundle.toURI().toURL()))

    // Normally one manifest, with the version the build stamped into the bundle.
    val manifests = loader.getResources("META-INF/MANIFEST.MF")
    while (manifests.hasMoreElements()) {
        val version = Manifest(manifests.nextElement().openStream()).mainAttributes.getValue("Version")
        if (version != null) writePatchList(version, patches)
    }
}

/** A patch and everything the Manager shows for it, in the shape patches-list.json expects. */
private class PatchJson(
    val name: String?,
    val description: String?,
    val default: Boolean = true,
    /** Null for a patch that declares no category and stays ungrouped. */
    val category: String? = null,
    val dependencies: List<String>,
    /** Null for a patch that applies to any app. */
    val compatiblePackages: List<AppJson>? = null,
    val options: List<OptionJson> = emptyList(),
) {
    class OptionJson(
        val key: String,
        val title: String?,
        val description: String?,
        val required: Boolean,
        val type: String,
        val default: Any?,
        val values: Map<String, Any?>?,
    )
}

/** One compatible app, with the metadata of every target version. */
private class AppJson(
    /** The app's package name, e.g. com.linkedin.android. */
    val packageName: String,
    /** The app's display name declared in the Compatibility, e.g. "LinkedIn". */
    val name: String?,
    val description: String?,
    /** The unpatched file type the patch accepts, e.g. APK or APKM; null when unspecified. */
    val apkFileType: String?,
    /** The app icon's background color as #RRGGBB, or null. */
    val appIconColor: String?,
    /** The accepted SHA-256 signatures of the app. */
    val signatures: Set<String>?,
    val targets: List<TargetJson>,
) {
    class TargetJson(
        val version: String?,
        val versionCodes: Map<String, Int>?,
        val isExperimental: Boolean,
        /** The lowest device SDK, or null for any version. */
        val minSdk: Int?,
        /** A note about this version that the Manager shows, if any. */
        val description: String?,
    )
}

private fun writePatchList(version: String, patches: Set<Patch<*>>) {
    val entries = patches.sortedBy { it.name }.map { patch ->
        PatchJson(
            name = patch.name!!,
            description = patch.description,
            default = patch.default,
            category = patch.category,
            dependencies = patch.dependencies.map { it.javaClass.simpleName },
            // A null compatibility list marks a universal patch, which applies to any app.
            compatiblePackages = patch.compatibility?.map { compat ->
                AppJson(
                    packageName = compat.packageName!!,
                    name = compat.name,
                    description = compat.description,
                    apkFileType = compat.apkFileType?.name,
                    // #RRGGBB reads better in the file than the integer.
                    appIconColor = compat.appIconColor?.let { "#%06X".format(it) },
                    signatures = compat.signatures,
                    targets = compat.targets.map { target ->
                        AppJson.TargetJson(
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
                PatchJson.OptionJson(
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

    val document = JsonObject().apply {
        addProperty(
            "NOTE",
            "Do NOT manually edit this file. This file is automatically updated when semantic release " +
                "(release.yml) runs. Manually editing this file can break your releases and break third " +
                "party tools that use this file."
        )
        addProperty("version", version)
        add("patches", GSON.toJsonTree(entries))
    }
    File("../patches-list.json").writeText(GSON.toJson(document))
}

/** Nulls are kept (the Manager tells them apart) and <, > and & stay readable instead of being escaped. */
private val GSON: Gson = GsonBuilder()
    .serializeNulls()
    .disableHtmlEscaping()
    .setPrettyPrinting()
    .create()
