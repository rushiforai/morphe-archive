package app.morphe.patches.oraimohealth.ui

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.oraimohealth.shared.COMPATIBILITY_ORAIMO_HEALTH
import org.w3c.dom.Element

/**
 * Resource patch that statically collapses Mall, Sport, and Mine tabs in activity_main.xml,
 * leaving only Data (Dashboard) and Device Management active.
 */
@Suppress("unused")
val hideNavigationTabsLayoutPatch = resourcePatch(
    name = "Hide Navigation Tabs (Layout)",
    description = "Statically collapses Mall, Sport, and Mine tabs to 0dp in activity_main.xml, keeping Data and Device tabs.",
    default = true
) {
    compatibleWith(COMPATIBILITY_ORAIMO_HEALTH)

    execute {
        document("res/layout/activity_main.xml").use { doc ->
            val radioButtons = doc.getElementsByTagName("RadioButton")
            for (i in 0 until radioButtons.length) {
                val element = radioButtons.item(i) as? Element ?: continue
                val viewId = element.getAttribute("android:id")
                if (viewId.contains("rb_sport") || viewId.contains("rb_mall") || viewId.contains("rb_mine")) {
                    element.setAttribute("android:visibility", "gone")
                    element.setAttribute("android:layout_width", "0dp")
                    element.setAttribute("android:layout_height", "0dp")
                    element.setAttribute("android:layout_weight", "0")
                    element.removeAttribute("android:drawableTop")
                    element.removeAttribute("android:text")
                }
            }
        }
    }
}
