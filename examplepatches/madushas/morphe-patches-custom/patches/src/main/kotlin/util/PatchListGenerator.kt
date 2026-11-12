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
    // build/libs accumulates one bundle per version, so pick the *newest* version
    // explicitly. Taking the first file the directory listing happens to return
    // silently generates the patch list from a stale bundle.
    fun versionKey(name: String): Int =
        name.removePrefix("patches-").removeSuffix(".mpp")
            .split('.')
            .fold(0) { acc, part -> acc * 1000 + (part.takeWhile(Char::isDigit).toIntOrNull() ?: 0) }

    val bundles = File("build/libs/").listFiles { file ->
        val fileName = file.name
        !fileName.contains("javadoc") &&
                !fileName.contains("sources") &&
                fileName.endsWith(".mpp")
    }.orEmpty()
    require(bundles.isNotEmpty()) { "no patch bundle (.mpp) found in build/libs" }

    val patchFiles = setOf(bundles.maxByOrNull { versionKey(it.name) }!!)
    val loadedPatches = loadPatchesFromJar(patchFiles)
    val patchClassLoader = URLClassLoader(patchFiles.map { it.toURI().toURL() }.toTypedArray())
    val manifest = patchClassLoader.getResources("META-INF/MANIFEST.MF")

    while (manifest.hasMoreElements()) {
        Manifest(manifest.nextElement().openStream())
            .mainAttributes
            .getValue("Version")
            ?.let {
                generatePatchList(it, loadedPatches)
                generateReadme(it, loadedPatches)
            }
    }
}

/**
 * Regenerate the patch list inside README.md, between `<!-- PATCHES_START -->` and
 * `<!-- PATCHES_END -->` — the same convention the official Morphe/ReVanced bundles use.
 *
 * The structure mirrors the upstream standard:
 *   - one `<details>` block per supported app, `<details>` for the universal patches last;
 *   - a "🎯 Supported versions" table (🧪 marks an experimental target);
 *   - a "💊 Patch | 📜 Description | ⚙️ Options" table.
 *
 * Grouping is by **compatible package**, not by an authored category — patches that
 * declare no package (the shared/universal ones) go in the 🌐 block. There is no
 * per-patch category anywhere in the catalogue (upstream emits `category: null` for
 * every patch), so nothing here invents one.
 */
@Suppress("DEPRECATION")
private fun generateReadme(version: String, patches: Set<Patch<*>>) {
    val readme = File("../README.md")
    if (!readme.exists()) return
    val text = readme.readText()
    val startMarker = "<!-- PATCHES_START -->"
    val endMarker = "<!-- PATCHES_END -->"
    val startIdx = text.indexOf(startMarker)
    val endIdx = text.indexOf(endMarker)
    if (startIdx < 0 || endIdx < 0) return

    fun anchor(name: String) = name.lowercase()
        .map { if (it.isLetterOrDigit()) it else '-' }
        .joinToString("")
        .trim('-')

    val apps = sortedMapOf<String, MutableList<Patch<*>>>()
    val universal = mutableListOf<Patch<*>>()
    patches.sortedBy { it.name }.forEach { patch ->
        val compat = patch.compatibility.orEmpty()
        if (compat.isEmpty()) {
            universal += patch
        } else {
            compat.forEach { c ->
                apps.getOrPut(c.name ?: c.packageName ?: "Unknown") { mutableListOf() } += patch
            }
        }
    }

    fun render(name: String, list: List<Patch<*>>): String = buildString {
        appendLine("<details>")
        appendLine("<summary>$name&nbsp;&nbsp;•&nbsp;&nbsp;${list.size} patches</summary>")
        appendLine("<br>")
        appendLine()
        val targets = list.flatMap { it.compatibility.orEmpty() }
            .flatMap { it.targets }
            .distinctBy { it.version }
        if (targets.isNotEmpty()) {
            appendLine("**🎯 Supported versions:**")
            appendLine()
            appendLine("| " + targets.joinToString(" | ") {
                (if (it.isExperimental) "🧪&nbsp;" else "") + (it.version ?: "?")
            } + " |")
            appendLine("| " + targets.joinToString(" | ") { ":---:" } + " |")
            appendLine()
        }
        appendLine("| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |")
        appendLine("|----------|----------------|-----------|")
        list.forEach { p ->
            val options = p.options.values
                .map { "• " + (it.title ?: it.key) }
                .joinToString("<br>")
            appendLine(
                "| [${p.name}](#${anchor(p.name!!)}) | ${p.description ?: ""} | $options |",
            )
        }
        appendLine()
        appendLine("</details>")
        appendLine()
    }

    val sb = StringBuilder()
    sb.appendLine()
    sb.appendLine(
        "> **[v$version](https://github.com/madushas/morphe-patches-custom/releases/tag/v$version)**" +
            "&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;${patches.size} patches total",
    )
    sb.appendLine()
    apps.forEach { (name, list) -> sb.append(render("📦 $name", list)) }
    if (universal.isNotEmpty()) sb.append(render("🌐 Universal", universal))

    val head = text.substring(0, startIdx + startMarker.length)
    val tail = text.substring(endIdx)
    readme.writeText(head + "\n" + sb.toString() + tail)
}

@Suppress("DEPRECATION")
private fun generatePatchList(version: String, patches: Set<Patch<*>>) {
    val listJson = File("../patches-list.json")

    val patchesMap = patches.sortedBy { it.name }.map { patch ->
        JsonPatch(
            name = patch.name!!,
            description = patch.description,
            default = patch.default,
            // Grouping label declared by patch.category("…"). The official bundle
            // never populates this (it emits category: null for every patch), so a
            // real value here is strictly extra metadata for tools that group patches.
            category = patch.category,
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
    /**
     * Grouping label from `category("…")`, e.g. "Ads", "Privacy", "PairIP".
     * Null when a patch does not declare one.
     */
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