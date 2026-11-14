package semicoloncolonel.mobilestream.patches.shared.misc

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

// Expo checks for a new JavaScript bundle on every launch and would replace
// a patched one, so Expo updates are turned off in the manifest. The app then
// always runs the JavaScript that shipped with the APK. Every patch that
// edits the bundle depends on this one.
internal val disableExpoUpdatesPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val metaData = application.getElementsByTagName("meta-data")
            for (i in 0 until metaData.length) {
                val element = metaData.item(i) as? Element ?: continue
                if (element.getAttribute("android:name") == "expo.modules.updates.ENABLED") {
                    element.setAttribute("android:value", "false")
                }
            }
        }
    }
}
