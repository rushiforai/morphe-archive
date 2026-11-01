package patches.brabant

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

internal val consentResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("res/layout/fragment_more.xml").use { doc ->
            val nodes = doc.getElementsByTagName("TextView")
            val row = (0 until nodes.length).map { nodes.item(it) as Element }
                .single { it.getAttribute("android:id") == "@id/privacy_policy" }
            check(row.getAttribute("android:text") == "@string/more_fragment_settings_cookies" &&
                !row.hasAttribute("android:visibility")) { "Brabant original cookie menu changed" }
            // Retain the required view-binding ID, but exclude the row from the
            // inflated layout before any frame can be displayed.
            row.setAttributeNS("http://schemas.android.com/apk/res/android", "android:visibility", "gone")
        }
    }
}
