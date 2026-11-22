/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.patches.mygate.navigation

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patches.mygate.shared.Constants.COMPATIBILITY_MYGATE

@Suppress("unused")
val hideNavigationBarPatch = patch(
    name = "Hide bottom navigation bar",
    description = "Hides the bottom navigation bar and expands the main view full screen.",
) {
    compatibleWith(COMPATIBILITY_MYGATE)

    execute {
        resourceXml("res/layout/home_activity.xml").use { xml ->
            xml.elements().forEach { element ->
                val id = element.attribute("android:id")
                if (id == "@id/bottomNavigationView" || id == "@id/btnCommunity") {
                    element.setAttribute("android:visibility", "gone")
                    element.setAttribute("android:layout_width", "0.0dp")
                    element.setAttribute("android:layout_height", "0.0dp")
                } else if (id == "@id/container") {
                    element.attributeNames
                        .filter { it.endsWith("layout_constraintBottom_toTopOf") }
                        .forEach { element.removeAttribute(it) }
                    element.setAttribute("app:layout_constraintBottom_toBottomOf", "parent")
                }
            }
        }
    }
}
