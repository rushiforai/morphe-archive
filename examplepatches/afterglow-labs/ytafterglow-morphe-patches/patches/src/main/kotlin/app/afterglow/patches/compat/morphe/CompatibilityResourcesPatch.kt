/* Copyright 2026 Morphe. GPLv3; see NOTICE and docs/morphe-compatibility.md.
 * Afterglow adaptation of the pinned GmsCore manifest and runtime-resource behavior.
 */
package app.afterglow.patches.compat.morphe

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

internal val compatibilityResourcesPatch = resourcePatch {
    execute {
        val resources = "compat/morphe/values/compatibility.xml"
        val loader = object {}.javaClass.classLoader
        requireNotNull(loader.getResourceAsStream(resources)).use { input ->
            document(input).use { source ->
                compatibilityValueGroups(source).forEach { (path, values) ->
                    // Patcher 2.1 allocates IDs using the canonical filename's type.
                    // Decode the stock document first so its entries and IDs survive.
                    if (!get(path, true).exists()) get(path, false).writeText("<resources/>")
                    document(path).use { target -> mergeCompatibilityValues(target, values, path) }
                }
            }
        }
        get("assets/afterglow-compatibility").mkdirs()
        listOf("MORPHE_LICENSE.TXT", "MORPHE_LICENSE_NOTICE.TXT", "ASTRING_LICENSE.TXT",
            "MERIYAH_LICENSE.TXT", "YT_DLP_EJS_LICENSE.TXT").forEach { name ->
            get("assets/afterglow-compatibility/$name").outputStream().use { output ->
                requireNotNull(loader.getResourceAsStream("compat/morphe/license/$name")).use { it.copyTo(output) }
            }
        }
    }
}

internal val compatibilityGmsResourcesPatch = resourcePatch {
    dependsOn(compatibilityResourcesPatch)
    execute {
        document("AndroidManifest.xml").use { document ->
            val root = document.documentElement
            val application = document.getElementsByTagName("application").item(0) as Element
            val queries = document.getElementsByTagName("queries").item(0)
                ?: document.createElement("queries").also { root.appendChild(it) }
            val existing = (0 until queries.childNodes.length).mapNotNull {
                (queries.childNodes.item(it) as? Element)?.getAttribute("android:name")
            }.toSet()
            listOf("app.revanced.android.gms", "com.mgoogle.android.gms", "org.microg.gms", "app.morphe.pot.helper")
                .filter { it !in existing }.forEach { name ->
                    queries.appendChild(document.createElement("package").apply { setAttribute("android:name", name) })
                }
            val permissions = document.getElementsByTagName("uses-permission")
            if ((0 until permissions.length).none {
                    (permissions.item(it) as Element).getAttribute("android:name") == "android.permission.REQUEST_DELETE_PACKAGES"
                }) root.appendChild(document.createElement("uses-permission").apply {
                    setAttribute("android:name", "android.permission.REQUEST_DELETE_PACKAGES")
                })
            listOf(
                "app.revanced.android.gms.SPOOFED_PACKAGE_NAME" to ORIGINAL_PACKAGE,
                "app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE" to "24bb24c05e47e0aefa68a58a766179d9b613a600",
                "app.revanced.MICROG_PACKAGE_NAME" to "app.revanced.android.gms"
            ).forEach { (name, value) ->
                application.appendChild(document.createElement("meta-data").apply {
                    setAttribute("android:name", name); setAttribute("android:value", value)
                })
            }
        }
        val manifest = get("AndroidManifest.xml")
        val transformations = mapOf(
            "package=\"$ORIGINAL_PACKAGE" to "package=\"$COMPATIBILITY_PACKAGE",
            "android:authorities=\"$ORIGINAL_PACKAGE" to "android:authorities=\"$COMPATIBILITY_PACKAGE",
            "$ORIGINAL_PACKAGE.permission.C2D_MESSAGE" to "$COMPATIBILITY_PACKAGE.permission.C2D_MESSAGE",
            "$ORIGINAL_PACKAGE.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION" to "$COMPATIBILITY_PACKAGE.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION",
            "com.google.android.c2dm" to "app.revanced.android.c2dm",
            "com.google.android.libraries.photos.api.mars" to "app.revanced.android.apps.photos.api.mars",
            "android:autoVerify=\"true\"" to "android:autoVerify=\"false\""
        )
        manifest.writeText(transformations.entries.fold(manifest.readText()) { text, (from, to) -> text.replace(from, to) })
    }
}
