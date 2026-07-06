package app.cesbar.patches.all.misc

import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.doRecursively
import org.w3c.dom.Element
import org.w3c.dom.Node

@Suppress("unused")
val exportAllActivitiesPatch = resourcePatch(
    name = "Export all activities",
    description = "Makes all activities launchable externally by setting android:exported=\"true\" in the manifest",
    default = false,
) {

    execute {
        document("AndroidManifest.xml").use { document ->
            document.doRecursively { node ->
                if (node.nodeType == Node.ELEMENT_NODE) {
                    val element = node as Element
                    val tagName = element.tagName
                    if (tagName == "activity" || tagName == "activity-alias") {
                        element.setAttribute("android:exported", "true")
                        if (element.hasAttribute("android:permission")) {
                            element.removeAttribute("android:permission")
                        }
                    }
                }
            }
        }
    }
}