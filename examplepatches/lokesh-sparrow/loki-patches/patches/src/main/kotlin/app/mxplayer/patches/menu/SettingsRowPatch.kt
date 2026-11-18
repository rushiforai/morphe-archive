/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.mxplayer.patches.menu

import app.loki.patches.universal.PUZZLE
import app.loki.patches.universal.menuPatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ICON = "loki_patches_pref_icon"

/**
 * MX draws its settings icons in the text colour: white on the dark theme, near-black on the light one. A single
 * colour disappears in the other theme, and a new colour resource cannot be added by a patch (the patcher refuses
 * an entry that is not in the table), so the icon ships twice - drawable/ for light, drawable-night/ for dark.
 */
private const val ICON_COLOR_LIGHT_THEME = "#FF35344C"
private const val ICON_COLOR_DARK_THEME = "#FFFFFFFF"

/**
 * A "Loki Patches" entry at the top of MX Player's settings. Phones use the preference screen
 * (res/xml/preferences.xml), tablets the header list (res/xml/pro_preference_header.xml); both get the row.
 */
internal val settingsRowPatch = resourcePatch {
    dependsOn(menuPatch)
    dependsOn(meRowHookPatch)

    execute {
        for ((folder, colour) in listOf("drawable" to ICON_COLOR_LIGHT_THEME, "drawable-night" to ICON_COLOR_DARK_THEME)) {
            val dir = get("res").resolve(folder)
            dir.mkdirs()
            dir.resolve("$ICON.xml").writeText(
                """
                <?xml version="1.0" encoding="utf-8"?>
                <vector xmlns:android="http://schemas.android.com/apk/res/android"
                    android:width="24dp"
                    android:height="24dp"
                    android:viewportWidth="24"
                    android:viewportHeight="24">
                    <group android:pivotX="12" android:pivotY="12" android:scaleX="0.9" android:scaleY="0.9">
                        <path android:fillColor="$colour" android:pathData="$PUZZLE" />
                    </group>
                </vector>
                """.trimIndent(),
            )
        }

        val pkg = document("AndroidManifest.xml").use { it.documentElement.getAttribute("package") }

        fun Document.row(tag: String): Element = createElement(tag).apply {
            setAttribute("android:title", "Loki Patches")
            setAttribute("android:icon", "@drawable/$ICON")
            appendChild(createElement("intent").apply {
                setAttribute("android:targetPackage", pkg)
                setAttribute("android:targetClass", "app.loki.extension.MenuActivity")
            })
        }

        document("res/xml/preferences.xml").use { document ->
            val root = document.documentElement
            if (root.tagName != "PreferenceScreen") throw PatchException("MX settings changed - unsupported version")
            root.insertBefore(document.row("PreferenceScreen").apply {
                setAttribute("android:summary", "Licence, codecs and patch settings")
            }, root.firstChild)
        }
        document("res/xml/pro_preference_header.xml").use { document ->
            val root = document.documentElement
            if (root.tagName != "preference-headers") throw PatchException("MX settings changed - unsupported version")
            root.insertBefore(document.row("header"), root.firstChild)
        }
    }
}
