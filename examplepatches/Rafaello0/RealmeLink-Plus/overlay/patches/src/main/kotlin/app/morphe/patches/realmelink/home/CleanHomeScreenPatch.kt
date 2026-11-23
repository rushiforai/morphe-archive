/*
 * Copyright (C) 2026 RealmeLink Plus contributors
 * SPDX-License-Identifier: GPL-3.0-only
 *
 * Only the home-screen demo/promotional views are modified.
 * MainFragment's real devices RecyclerView (homeRecyclerView) is untouched.
 */
package app.morphe.patches.realmelink.home

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import org.w3c.dom.Element

private const val HOME_LAYOUT = "res/layout/fragment_main.xml"

/**
 * An explicit 0dp width/height remains hidden even when an asynchronous home
 * refresh calls setVisibility(VISIBLE). The view IDs are preserved so existing
 * binding and click-handler code can still find the views without crashing.
 */
private fun Element.collapseHomeSection() {
    setAttribute("android:visibility", "gone")
    setAttribute("android:layout_width", "0dp")
    setAttribute("android:layout_height", "0dp")
    setAttribute("android:layout_marginTop", "0dp")
    setAttribute("android:layout_marginBottom", "0dp")
    setAttribute("android:layout_marginStart", "0dp")
    setAttribute("android:layout_marginEnd", "0dp")
}

@Suppress("unused")
val cleanHomeScreenPatch = resourcePatch(
    name = "Clean home screen",
    description = "Hides the AI/promotional banner and the Virtual Experience title and demo devices on the realme Link home screen. Real connected devices remain visible.",
    default = true,
) {
    compatibleWith(AppCompatibilities.REALME_LINK)

    execute {
        document(HOME_LAYOUT).use { doc ->
            val nodes = doc.getElementsByTagName("*")
            val sections = listOf(
                "MainAdvertiseView",
                "rl_virtual_device_title",
                "recycle_view_virtual_device",
            )

            for (id in sections) {
                val found = (0 until nodes.length).asSequence()
                    .mapNotNull { nodes.item(it) as? Element }
                    .filter { element ->
                        val value = element.getAttribute("android:id")
                        value == "@id/$id" || value == "@+id/$id"
                    }
                    .toList()
                check(found.size == 1) {
                    "realme Link 5.8.811.2814: expected one home view id $id, found ${found.size}"
                }
                found.single().collapseHomeSection()
            }
        }
    }
}
