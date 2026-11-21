/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.patches.universal

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * The Loki mark as a small 24 dp glyph for rows inside an app's own screens: `loki_glyph` in the brand teal for
 * screens that draw their icons as they are, and `loki_glyph_white` for screens that put the icon on a coloured tile.
 * Same puzzle piece as the launcher icon and the long-press shortcut.
 */
internal val lokiGlyphPatch = resourcePatch {
    execute {
        val drawable = get("res").resolve("drawable")
        drawable.mkdirs()
        for ((name, color) in listOf("loki_glyph" to "#FF2DBCB1", "loki_glyph_white" to "#FFFFFFFF")) {
            drawable.resolve("$name.xml").writeText(
                """
                <?xml version="1.0" encoding="utf-8"?>
                <vector xmlns:android="http://schemas.android.com/apk/res/android"
                    android:width="24dp"
                    android:height="24dp"
                    android:viewportWidth="24"
                    android:viewportHeight="24">
                    <path android:fillColor="$color" android:pathData="$PUZZLE" />
                </vector>
                """.trimIndent(),
            )
        }
    }
}

/**
 * The app's own resource ids by type and name, read from the decoded `res/values/public.xml`. Bytecode patches use it
 * to find code by the resource it shows ("the row labelled og_app_settings") instead of by a raw number that changes
 * from one app version to the next.
 */
internal object AppResources {
    private val ids = mutableMapOf<String, Int>()

    internal fun put(type: String, name: String, id: Int) {
        ids["$type/$name"] = id
    }

    fun id(type: String, name: String): Int =
        ids["$type/$name"] ?: throw PatchException("Resource $type/$name not found in this app")
}

internal val appResourcesPatch = resourcePatch {
    execute {
        document("res/values/public.xml").use { document ->
            val entries = document.getElementsByTagName("public")
            for (index in 0 until entries.length) {
                val entry = entries.item(index) as Element
                val id = entry.getAttribute("id").removePrefix("0x").toLongOrNull(16)?.toInt() ?: continue
                AppResources.put(entry.getAttribute("type"), entry.getAttribute("name"), id)
            }
        }
    }
}
