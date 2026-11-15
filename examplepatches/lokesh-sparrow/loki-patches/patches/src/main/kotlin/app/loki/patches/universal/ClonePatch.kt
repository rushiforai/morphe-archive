/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.patches.universal

import app.loki.patches.universal.OriginalApp
import app.loki.patches.universal.recordOriginalAppPatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element

/** Manifest attributes whose value is a component class name, which the manifest may write relative to the package. */
private val CLASS_ATTRIBUTES = listOf("name", "targetActivity", "backupAgent", "appComponentFactory", "zygotePreloadName")

@Suppress("unused")
val clonePatch = resourcePatch(
    name = "Change package name",
    description = "Changes the package name by adding a suffix (\".loki\" by default), so the patched app installs " +
        "next to the original app instead of replacing it. Some apps check their own package name and need a small " +
        "extra patch to run under the new one.",
    default = false,
) {
    dependsOn(recordOriginalAppPatch)
    dependsOn(menuPatch)

    val suffix by stringOption(
        key = "suffix",
        default = ".loki",
        title = "Package suffix",
        description = "Appended to the original package name. Must start with a dot.",
        required = true,
    ) { it != null && Regex("""\.[A-Za-z][A-Za-z0-9_]*""").matches(it) }

    execute {
        val old = OriginalApp.packageName
        val new = old + suffix
        document("AndroidManifest.xml").use { document ->
            val root = document.documentElement
            if (old.isEmpty() || root.getAttribute("package") != old) return@use // nothing safe to rename
            val all = document.getElementsByTagName("*")
            val elements = (0 until all.length).map { all.item(it) as Element }

            // Names written as ".Foo" resolve against the package, so spell them out before the package changes.
            for (element in elements) for (attribute in CLASS_ATTRIBUTES) {
                val value = element.getAttribute("android:$attribute")
                if (value.startsWith(".")) element.setAttribute("android:$attribute", old + value)
            }

            // What would clash with the original app, which stays installed: content provider authorities and
            // the app's own permissions.
            for (element in elements) when (element.tagName) {
                "provider" -> element.setAttribute(
                    "android:authorities",
                    element.getAttribute("android:authorities").split(";").joinToString(";") { it.renameIn(old, new) },
                )
                "permission", "uses-permission", "uses-permission-sdk-23" -> element.setAttribute(
                    "android:name", element.getAttribute("android:name").renameIn(old, new),
                )
            }
            for (element in elements) {
                val guard = element.getAttribute("android:permission")
                if (guard.isNotEmpty()) element.setAttribute("android:permission", guard.renameIn(old, new))
            }

            root.setAttribute("package", new)
            (document.getElementsByTagName("application").item(0) as Element).appendChild(
                document.createElement("meta-data").also {
                    it.setAttribute("android:name", "app.loki.menu.clone")
                    it.setAttribute("android:value", "true")
                },
            )
        }
    }
}

/** Renames [old] where it is the whole value or a dotted prefix of it. */
private fun String.renameIn(old: String, new: String) =
    if (this == old || startsWith("$old.")) new + removePrefix(old) else this
