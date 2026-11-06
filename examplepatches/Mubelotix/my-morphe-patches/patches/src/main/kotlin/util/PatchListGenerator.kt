/*
 * Generates the patches-list.json file used by Morphe Manager.
 * Based on the Morphe Patches template project.
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
    val patchFile = File("build/libs/").listFiles { file ->
        file.name.endsWith(".mpp") && !file.name.contains("javadoc") && !file.name.contains("sources")
    }?.firstOrNull() ?: error("No Morphe patch bundle found in patches/build/libs")

    val loadedPatches = loadPatchesFromJar(setOf(patchFile))
    val patchClassLoader = URLClassLoader(arrayOf(patchFile.toURI().toURL()))
    val manifests = patchClassLoader.getResources("META-INF/MANIFEST.MF")
    while (manifests.hasMoreElements()) {
        Manifest(manifests.nextElement().openStream()).mainAttributes.getValue("Version")?.let {
            generatePatchList(it, loadedPatches)
        }
    }
}

@Suppress("DEPRECATION")
private fun generatePatchList(version: String, patches: Set<Patch<*>>) {
    val entries = patches.sortedBy { it.name }.map { patch ->
        PatchEntry(
            name = patch.name!!,
            description = patch.description,
            default = patch.default,
            category = patch.category,
            dependencies = patch.dependencies.map { it.javaClass.simpleName },
            compatiblePackages = patch.compatibility?.map { compatibility ->
                CompatibilityEntry(
                    packageName = compatibility.packageName!!,
                    name = compatibility.name,
                    description = compatibility.description,
                    apkFileType = compatibility.apkFileType?.name,
                    appIconColor = compatibility.appIconColor?.let { "#%06X".format(it) },
                    signatures = compatibility.signatures,
                    targets = compatibility.targets.map { target ->
                        TargetEntry(
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
                OptionEntry(
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

    val gson = GsonBuilder().serializeNulls().disableHtmlEscaping().setPrettyPrinting().create()
    val json = JsonObject().apply {
        addProperty("NOTE", "Do NOT manually edit this file. It is generated during semantic releases.")
        addProperty("version", version)
        add("patches", gson.toJsonTree(entries))
    }
    File("../patches-list.json").writeText(gson.toJson(json))
}

private data class PatchEntry(
    val name: String,
    val description: String?,
    val default: Boolean,
    val category: String?,
    val dependencies: List<String>,
    val compatiblePackages: List<CompatibilityEntry>?,
    val options: List<OptionEntry>,
)

private data class OptionEntry(
    val key: String,
    val title: String?,
    val description: String?,
    val required: Boolean,
    val type: String,
    val default: Any?,
    val values: Map<String, Any?>?,
)

private data class CompatibilityEntry(
    val packageName: String,
    val name: String?,
    val description: String?,
    val apkFileType: String?,
    val appIconColor: String?,
    val signatures: Set<String>?,
    val targets: List<TargetEntry>,
)

private data class TargetEntry(
    val version: String?,
    val versionCodes: Map<String, Int>?,
    val isExperimental: Boolean,
    val minSdk: Int?,
    val description: String?,
)
