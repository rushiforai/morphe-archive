package app.template.patches.facebooklite

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants
import org.w3c.dom.Element

@Suppress("unused")
val disableInBuiltBrowserPatch = resourcePatch(
    name = "Disable In-Built Browser",
    description = "Disables the in-built browser in Facebook Lite by removing its activities from the manifest.",
    default = true
) {
    compatibleWith(Constants.FACEBOOK_LITE_COMPATIBILITY)
    execute {
        document("AndroidManifest.xml").use { document ->
            val activities = document.getElementsByTagName("activity")
            val toDisable = setOf(
                "com.facebook.browser.lite.BrowserLiteInMainProcessActivity",
                "com.facebook.lite.inappbrowser.common.BrowserLiteProxyActivity"
            )

            val toRemove = mutableListOf<Element>()
            for (i in 0 until activities.length) {
                val activity = activities.item(i) as? Element ?: continue
                val name = activity.getAttribute("android:name")
                if (toDisable.contains(name)) {
                    toRemove.add(activity)
                }
            }

            toRemove.forEach { activity ->
                activity.parentNode?.removeChild(activity)
            }
        }
    }
}
