/*
 * Copyright (C) 2026 Ricardo ARM64 port contributors
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.smart123s.patches.ricardo

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

internal fun Document.enableRicardoLandscapeRotation() {
    val packageName = documentElement.getAttribute("package")
    val activities = getElementsByTagName("activity")
    val mainActivity = (0 until activities.length).map { activities.item(it) as Element }.singleOrNull {
        val declared = it.getAttribute("android:name")
        val resolved = when {
            declared.startsWith(".") -> packageName + declared
            '.' !in declared -> "$packageName.$declared"
            else -> declared
        }
        resolved == "ricardonemlopot.nemlopot.MainActivity"
    } ?: throw PatchException("Expected Ricardo MainActivity in AndroidManifest.xml")

    mainActivity.setAttribute("android:screenOrientation", "sensorLandscape")
}

@Suppress("unused")
val landscapeRotationPatch = resourcePatch(
    name = "Landscape rotation",
    description = "Allows both landscape directions when rotating the phone through 180 degrees.",
) {
    compatibleWith(ricardoCompatibility)

    execute {
        document("AndroidManifest.xml").use { it.enableRicardoLandscapeRotation() }
    }
}
