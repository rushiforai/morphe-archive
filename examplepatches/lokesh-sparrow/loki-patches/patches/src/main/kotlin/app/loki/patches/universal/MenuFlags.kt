/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.patches.universal

import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * Marks a patch as applied in the manifest, where the Loki Patches screen reads it. Every patch that
 * has something to say about itself calls this so the screen can list it as applied.
 */
internal fun Document.addMenuFlag(name: String) {
    val application = getElementsByTagName("application").item(0) as? Element ?: return
    val existing = application.getElementsByTagName("meta-data")
    for (index in 0 until existing.length) {
        val node = existing.item(index) as Element
        if (node.getAttribute("android:name") == name) return
    }
    application.appendChild(createElement("meta-data").also {
        it.setAttribute("android:name", name)
        it.setAttribute("android:value", "true")
    })
}
