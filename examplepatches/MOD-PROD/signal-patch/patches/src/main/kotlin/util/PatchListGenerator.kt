/*
 * Copyright 2025 Morphe.
 * https://github.com/MorpheApp/morphe-patches-template
 */

package util

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import com.google.gson.GsonBuilder
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
    val patchClassLoader = URLClassLoader(patchFiles.map { it.toURI().toURL() }.toTypedArray())
    val manifest = patchClassLoader.getResources("META-INF/MANIFEST.MF")

    var aboutJson: Map<String, String?>? = null
    while (manifest.hasMoreElements()) {
        val m = Manifest(manifest.nextElement().openStream())
        val attrs = m.mainAttributes
        if (attrs.getValue("Name") != null || attrs.getValue("Description") != null) {
            aboutJson = mapOf(
                "name" to attrs.getValue("Name"),
                "description" to attrs.getValue("Description"),
                "source" to attrs.getValue("Source"),
                "author" to attrs.getValue("Author"),
                "contact" to attrs.getValue("Contact"),
                "website" to attrs.getValue("Website"),
                "license" to attrs.getValue("License"),
            )
            break
        }
    }

    val patchesJson = loadedPatches.map { patch ->
        mapOf(
            "name" to patch.name,
            "description" to patch.description,
            "default" to patch.default,
            // Morphe API: compatiblePackages was renamed to compatibility
            "compatiblePackages" to patch.compatibility?.map { it.packageName ?: it.name },
        )
    }

    val payload = mapOf(
        "about" to aboutJson,
        "patches" to patchesJson,
    )

    val out = File("../patches-list.json")
    out.writeText(GsonBuilder().setPrettyPrinting().create().toJson(payload))
    println("Wrote ${out.absolutePath} (${patchesJson.size} patches)")
}
