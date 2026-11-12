package app.cesbar.patches.all.misc

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.doRecursively
import org.w3c.dom.Element
import org.w3c.dom.Node

@Suppress("unused")
val exportAllComponentsPatch = resourcePatch(
    name = "Export all components",
    description = "Makes components accessible externally by setting android:exported=\"true\" in the manifest",
    default = false,
) {
    val exportActivities by booleanOption(
        key = "export_activities",
        title = "Export activities",
        description = "Export all <activity> and <activity-alias>",
        default = true
    )
    val exportServices by booleanOption(
        key = "export_services",
        title = "Export services",
        description = "Export all <service>",
        default = true
    )
    val exportReceivers by booleanOption(
        key = "export_receivers",
        title = "Export receivers",
        description = "Export all <receiver>",
        default = true
    )

    execute {
        document("AndroidManifest.xml").use { document ->
            document.doRecursively { node ->
                if (node.nodeType == Node.ELEMENT_NODE) {
                    val element = node as Element
                    val tagName = element.tagName

                    val shouldExport = when (tagName) {
                        "activity", "activity-alias" -> exportActivities == true
                        "service" -> exportServices == true
                        "receiver" -> exportReceivers == true
                        else -> false
                    }

                    if (shouldExport) {
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
