package app.fblite.patches.browser

import app.fblite.patches.shared.Constants.COMPATIBILITY_FACEBOOK_LITE
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

/**
 * Facebook Lite opens links in its own WebView screens. Disabling them in the manifest makes the app
 * fall back to the system's default browser. Both names are real, unobfuscated classes.
 */
private val IN_APP_BROWSER_ACTIVITIES = setOf(
    "com.facebook.browser.lite.BrowserLiteInMainProcessActivity",
    "com.facebook.lite.inappbrowser.common.BrowserLiteProxyActivity",
)

@Suppress("unused")
val disableInAppBrowserPatch = resourcePatch(
    name = "Disable in-app browser",
    description = "Opens links in the phone's default browser instead of Facebook Lite's built-in browser.",
    default = true
) {
    compatibleWith(COMPATIBILITY_FACEBOOK_LITE)

    execute {
        document("AndroidManifest.xml").use { document ->
            var disabled = 0
            val activities = document.getElementsByTagName("activity")
            for (index in 0 until activities.length) {
                val activity = activities.item(index) as? Element ?: continue
                if (activity.getAttribute("android:name") !in IN_APP_BROWSER_ACTIVITIES) continue
                activity.setAttributeNS(ANDROID_NS, "android:enabled", "false")
                disabled++
            }
            if (disabled == 0) throw PatchException("No in-app browser activity found in the manifest")
        }
    }
}
