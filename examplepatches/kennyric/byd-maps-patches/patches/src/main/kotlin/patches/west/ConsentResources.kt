package patches.west

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

internal val consentResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("res/layout/fragment_settings_overview.xml").use { doc ->
            val children = (0 until doc.documentElement.childNodes.length)
                .mapNotNull { doc.documentElement.childNodes.item(it) as? Element }
            val index = children.indices.single {
                children[it].getAttribute("android:id") == "@id/privacy_item"
            }
            val row = children[index]
            val divider = children[index + 1]
            val texts = row.getElementsByTagName("TextView")
            check((0 until texts.length).any {
                (texts.item(it) as Element).getAttribute("android:text") == "@string/Settings_Privacy_Title"
            } && divider.tagName == "include" && divider.getAttribute("layout") == "@layout/divider_settings") {
                "West original cookie-settings row changed"
            }
            for (element in listOf(row, divider)) {
                check(!element.hasAttribute("android:visibility")) { "West original cookie-settings visibility changed" }
                // Keep the required binding ID while occupying no space from
                // the first frame. Native progress updates only touch children.
                element.setAttributeNS("http://schemas.android.com/apk/res/android", "android:visibility", "gone")
            }
        }
    }
}
