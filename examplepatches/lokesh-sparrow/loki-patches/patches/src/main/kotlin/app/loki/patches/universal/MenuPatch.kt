/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.patches.universal

import app.docscanner.patches.menu.drawerRowPatch
import app.splitwise.patches.menu.splitwiseAccountRowPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val MENU = "app.loki.extension"

/**
 * The screen and the long-press shortcut. A row inside each app's own settings is not possible from one patch:
 * every app builds that menu differently. This adds an entry the launcher can always open.
 */
private val menuManifestPatch = resourcePatch {
    execute {
        writeLokiIcon()
        writeLokiLogo()
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as? Element ?: return@use
            val pkg = document.documentElement.getAttribute("package")
            if (pkg.isEmpty()) return@use

            application.appendChild(document.node(
                "activity",
                "android:name" to "$MENU.MenuActivity",
                "android:exported" to "true",
                "android:label" to "Loki Patches",
                "android:theme" to "@android:style/Theme.DeviceDefault.DayNight",
            ))
            application.appendChild(document.node(
                "activity-alias",
                "android:name" to "$MENU.MenuLauncher",
                "android:targetActivity" to "$MENU.MenuActivity",
                "android:enabled" to "false",
                "android:exported" to "true",
                "android:label" to "Loki Patches",
                "android:icon" to LOKI_ICON,
                children = listOf(document.node(
                    "intent-filter",
                    children = listOf(
                        document.node("action", "android:name" to "android.intent.action.MAIN"),
                        document.node("category", "android:name" to "android.intent.category.LAUNCHER"),
                    ),
                )),
            ))
            application.appendChild(document.node(
                "provider",
                "android:name" to "$MENU.MenuProvider",
                "android:authorities" to "$pkg.loki.menu",
                "android:exported" to "false",
                "android:initOrder" to "100",
            ))
            application.appendChild(document.node(
                "meta-data",
                "android:name" to "app.loki.menu",
                "android:value" to "true",
            ))
        }
    }
}

/**
 * Branding, applied automatically with every Loki patch: the extension merges in, the version is
 * stamped, and the manifest gets the screen and the long-press shortcut. Unnamed, so it never
 * appears in Manager and cannot be opted out of.
 */
internal val menuPatch = bytecodePatch {
    dependsOn(menuManifestPatch)
    dependsOn(drawerRowPatch)
    dependsOn(splitwiseAccountRowPatch)
    extendWith("extensions/extension.mpe")

    execute {
        Fingerprint(
            definingClass = "Lapp/loki/extension/MenuInfo;",
            name = "patchesVersion",
            returnType = "Ljava/lang/String;",
        ).matchOrNull()?.method?.addInstructions(
            0,
            "const-string v0, \"${bundleVersion()}\"\nreturn-object v0",
        )
    }
}

private fun Document.node(tag: String, vararg attributes: Pair<String, String>, children: List<Element> = emptyList()) =
    createElement(tag).also { element ->
        for ((key, value) in attributes) element.setAttribute(key, value)
        children.forEach(element::appendChild)
    }

/** Version stamped into the bundle, or "dev" when this build has none. */
private fun bundleVersion(): String {
    val manifests = object {}.javaClass.classLoader.getResources("META-INF/MANIFEST.MF")
    while (manifests.hasMoreElements()) {
        val main = manifests.nextElement().openStream().use { java.util.jar.Manifest(it).mainAttributes }
        // The bundle is Loki Patches now; the old name is kept so a Doc Scanner bundle still stamps its
        // own version. Without one of these the screen shows "Patches dev".
        if (main.getValue("Name") !in setOf("Loki Patches", "Doc Scanner Patches")) continue
        return main.getValue("Version") ?: "dev"
    }
    return "dev"
}
