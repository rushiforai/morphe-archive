package mightymich.morphe.patches.com.mixplorer

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Limits CopyActivity to the system share sheet only.
 *
 * Keeps ACTION_SEND / SEND_MULTIPLE intent-filters (share menu).
 * Removes ACTION_VIEW filters so Copy no longer appears in local
 * "Open with" dialogs for images/videos/files.
 *
 * Does not touch ImageViewerActivity / PlayerActivity / other handlers.
 */
@Suppress("unused")
val limitCopyToShareMenuPatch = resourcePatch(
    name = "Limit Copy to share menu",
    description = "Removes CopyActivity VIEW filters (open-with) while keeping " +
        "SEND filters so Copy remains in the system share menu.",
    default = false
) {
    compatibleWith(MiXplorerCompatibility.MIXPLORER)

    execute {
        document("AndroidManifest.xml").use { document ->
            val activities = document.getElementsByTagName("activity")
            for (i in 0 until activities.length) {
                val activity = activities.item(i) as? Element ?: continue
                if (activity.getAttribute("android:name") !=
                    "com.mixplorer.activities.CopyActivity"
                ) {
                    continue
                }

                val children = activity.childNodes
                for (j in children.length - 1 downTo 0) {
                    val child = children.item(j)
                    if (child !is Element || child.tagName != "intent-filter") continue

                    var hasView = false
                    var hasSend = false
                    val actions = child.getElementsByTagName("action")
                    for (a in 0 until actions.length) {
                        val el = actions.item(a) as? Element ?: continue
                        when (el.getAttribute("android:name")) {
                            "android.intent.action.VIEW" -> hasView = true
                            "android.intent.action.SEND",
                            "android.intent.action.SEND_MULTIPLE" -> hasSend = true
                        }
                    }
                    // Drop filters that are VIEW-based (open-with / browser)
                    if (hasView && !hasSend) {
                        activity.removeChild(child)
                    }
                }
            }
        }
    }
}
