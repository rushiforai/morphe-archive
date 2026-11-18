/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.patches.universal

import app.morphe.patcher.patch.ResourcePatchContext

/** Resource name of the Loki Patches launcher icon written by [writeLokiIcon]. */
internal const val LOKI_ICON = "@drawable/loki_patches_icon"

/** Material's puzzle piece ("extension"), the Loki Patches mark, on a 24x24 grid. */
internal const val PUZZLE =
    "M20.5,11H19V7c0,-1.1 -0.9,-2 -2,-2h-4V3.5C13,2.12 11.88,1 10.5,1S8,2.12 8,3.5V5H4c-1.1,0 -1.99,0.9 " +
        "-1.99,2v3.8H3.5c1.49,0 2.7,1.21 2.7,2.7s-1.21,2.7 -2.7,2.7H2V20c0,1.1 0.9,2 2,2h3.8v-1.5c0,-1.49 1.21,-2.7 " +
        "2.7,-2.7 1.49,0 2.7,1.21 2.7,2.7V22H17c1.1,0 2,-0.9 2,-2v-4h1.5c1.38,0 2.5,-1.12 2.5,-2.5S21.88,11 20.5,11z"

/**
 * Writes the launcher icon of the optional "Loki Patches" app-drawer entry: the teal tile with the white puzzle
 * piece, the same mark as the long-press shortcut. A vector, so one file serves every screen density; it
 * replaces the framework info glyph the alias used to borrow.
 */
internal fun ResourcePatchContext.writeLokiIcon() {
    val drawable = get("res").resolve("drawable")
    drawable.mkdirs()
    drawable.resolve("loki_patches_icon.xml").writeText(
        """
        <?xml version="1.0" encoding="utf-8"?>
        <vector xmlns:android="http://schemas.android.com/apk/res/android"
            android:width="108dp"
            android:height="108dp"
            android:viewportWidth="108"
            android:viewportHeight="108">
            <path android:fillColor="#FF2DBCB1" android:pathData="M0,0h108v108h-108z" />
            <group android:translateX="30" android:translateY="30" android:scaleX="2" android:scaleY="2">
                <path android:fillColor="#FFFFFFFF" android:pathData="$PUZZLE" />
            </group>
        </vector>
        """.trimIndent(),
    )
}
