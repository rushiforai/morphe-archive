package app.template.patches.scannerradio

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SCANNERRADIO

/**
 * Changes the app name to "Scanner Radio+" making the patched version
 * easy to identify when installed alongside the original.
 *
 * Scanner Radio uses PNG mipmaps for its adaptive icon — not XML vector
 * drawables — so we only change the string resource. The app name change
 * is sufficient for visual identification on the home screen and launcher.
 */
@Suppress("unused")
val brandingPatch = resourcePatch(
    name = "Branding",
    description = "Changes app name to 'Scanner Radio+' for easy identification.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SCANNERRADIO)

    finalize {
        // Change app name: "Scanner Radio" -> "Scanner Radio+"
        document("res/values/strings.xml").use { doc ->
            val stringNodes = doc.getElementsByTagName("string")
            for (i in 0 until stringNodes.length) {
                val elem = stringNodes.item(i) as? org.w3c.dom.Element ?: continue
                if (elem.getAttribute("name") == "app_name") {
                    elem.textContent = "Scanner Radio+"
                    break
                }
            }
        }
    }
}
