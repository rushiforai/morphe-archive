package com.latanvillegas.lawnchair.patches.allapps

import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Removes the drag-handle views from Lawnchair's All Apps bottom sheet.
 *
 * This reproduces the resource-side change used by the customized Lawnchair build:
 * bottom_sheet_handle_area and bottom_sheet_handle are removed while the root background
 * remains match_parent.
 */
@Suppress("unused")
val removeAllAppsHandlePatch = resourcePatch(
    name = "Remove All Apps handle",
    description = "Removes the handle and its reserved area from the top of Lawnchair's app drawer.",
) {
    compatibleWith(
        Compatibility(
            name = "Lawnchair Nightly",
            packageName = "app.lawnchair.nightly",
            appIconColor = 0x8BC34A,
        ),
    )

    execute {
        document("res/layout/all_apps_bottom_sheet_background.xml").use { document ->
            val idsToRemove = setOf(
                "@id/bottom_sheet_handle_area",
                "@+id/bottom_sheet_handle_area",
                "@id/bottom_sheet_handle",
                "@+id/bottom_sheet_handle",
            )

            val nodes = document.getElementsByTagName("View")
            val targets = buildList {
                for (index in 0 until nodes.length) {
                    val element = nodes.item(index) as? Element ?: continue
                    val id = element.getAttribute("android:id")
                    if (id in idsToRemove) add(element)
                }
            }

            targets.forEach { element ->
                element.parentNode?.removeChild(element)
            }
        }
    }
}
