/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.warunglife

import app.fakh.patches.warunglife.shared.Constants.COMPATIBILITY_WARUNGLIFE
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.decode
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

private const val PACKAGE = "com.neopawstudio.warunglife"

/**
 * Gives the app its own package so it installs next to the Play Store app. The manifest names every component by
 * its full class name, so only the package, the two content provider authorities and the receiver permission carry
 * the old package; the code builds the FileProvider authority from `getPackageName()` at runtime. The launcher label
 * becomes the chosen app name so the two icons can be told apart.
 */
@Suppress("unused")
val warungLifeClonePatch = resourcePatch(
    name = "Clone",
    description = "Installs the app as a separate app next to the Play Store version, under its own name. Progress " +
        "is not shared between the two.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WARUNGLIFE)
    category("Mods")

    val appName = stringOption(
        key = "appName",
        default = "Warung Life Simulator (Clone)",
        title = "App name",
        description = "The name shown under the launcher icon.",
        required = true,
    ) { value -> !value.isNullOrBlank() }
    val packageName = stringOption(
        key = "packageName",
        default = "$PACKAGE.fakh",
        title = "Package name",
        description = "The package the clone installs as. Lowercase letters, digits and underscores, starting with a " +
            "letter; dots separate parts. A different name installs another clone.",
        required = true,
    ) { value ->
        value != null && value != PACKAGE && Regex("[a-z][a-z0-9_]*(\\.[a-z][a-z0-9_]*)+").matches(value)
    }

    execute {
        val clonePackage = packageName.value!!
        var label: String? = null
        document("AndroidManifest.xml").use { manifest ->
            val root = manifest.documentElement
            if (root.getAttribute("package") != PACKAGE) throw PatchException("Warung Life: unexpected package.")
            root.setAttribute("package", clonePackage)
            var renamed = 0
            val elements = manifest.getElementsByTagName("*")
            for (i in 0 until elements.length) {
                val element = elements.item(i) as Element
                for (attribute in listOf("android:authorities", "android:name", "android:permission")) {
                    val value = element.getAttribute(attribute)
                    if (!value.startsWith("$PACKAGE.")) continue
                    element.setAttribute(attribute, clonePackage + value.removePrefix(PACKAGE))
                    renamed++
                }
            }
            // fileprovider and androidx-startup authorities, the receiver permission and its uses-permission.
            if (renamed != 4) throw PatchException("Warung Life: expected 4 package references, found $renamed.")
            label = (manifest.getElementsByTagName("application").item(0) as Element).getAttribute("android:label")
        }

        val name = label?.removePrefix("@string/")?.takeIf { it != label }
            ?: throw PatchException("Warung Life: app label is not a string resource ($label).")
        var labels = 0
        decode("res/values*/strings.xml").forEach { path ->
            document(path).use { strings ->
                val entries = strings.getElementsByTagName("string")
                for (i in 0 until entries.length) {
                    val entry = entries.item(i) as Element
                    if (entry.getAttribute("name") != name) continue
                    entry.textContent = appName.value
                    labels++
                }
            }
        }
        if (labels == 0) throw PatchException("Warung Life: label string $name not found.")
    }
}
