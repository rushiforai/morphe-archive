package app.afterglow.patches.menus

import app.afterglow.patches.settings.afterglowSettingsPatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/** Grants access only to the image explicitly copied or shared by the user. */
internal val longPressCaptureResourcesPatch = resourcePatch {
    dependsOn(afterglowSettingsPatch)
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application = document.getElementsByTagName("application").item(0) as Element
            val name = "app.afterglow.extension.menus.LongPressImageProvider"
            val providers = document.getElementsByTagName("provider")
            if ((0 until providers.length).none {
                (providers.item(it) as Element).getAttribute("android:name") == name
            }) {
                application.appendChild(document.createElement("provider").apply {
                    setAttribute("android:name", name)
                    setAttribute("android:authorities", manifest.getAttribute("package") + ".afterglow.longpress.images")
                    setAttribute("android:exported", "false")
                    setAttribute("android:grantUriPermissions", "true")
                })
            }
        }
    }
}
