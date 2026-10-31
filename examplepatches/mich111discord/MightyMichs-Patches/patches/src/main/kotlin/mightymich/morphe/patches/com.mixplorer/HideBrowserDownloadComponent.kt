package mightymich.morphe.patches.com.mixplorer

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Removes all intent-filters from DownloadActivity so MiXplorer no longer
 * appears as "Download" in Firefox / browser download handlers.
 *
 * Does not remove the activity class itself (internal use may remain).
 */
@Suppress("unused")
val hideBrowserDownloadComponentPatch = resourcePatch(
    name = "Hide browser Download component",
    description = "Removes DownloadActivity intent-filters so MiXplorer is not " +
        "offered in browser/Firefox download choosers.",
    default = false
) {
    compatibleWith(MiXplorerCompatibility.MIXPLORER)

    execute {
        document("AndroidManifest.xml").use { document ->
            val activities = document.getElementsByTagName("activity")
            for (i in 0 until activities.length) {
                val activity = activities.item(i) as? Element ?: continue
                val name = activity.getAttribute("android:name")
                if (name != "com.mixplorer.activities.DownloadActivity") continue

                // Remove every intent-filter child
                val children = activity.childNodes
                for (j in children.length - 1 downTo 0) {
                    val child = children.item(j)
                    if (child is Element && child.tagName == "intent-filter") {
                        activity.removeChild(child)
                    }
                }
                // Prevent external resolution
                activity.setAttribute("android:exported", "false")
            }
        }
    }
}
