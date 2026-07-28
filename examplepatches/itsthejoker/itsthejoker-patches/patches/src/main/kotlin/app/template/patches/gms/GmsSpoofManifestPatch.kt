package app.template.patches.gms

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.gms.Constants.ROOST_PACKAGE_NAME
import app.template.patches.gms.Constants.SPOOFED_PACKAGE_SIGNATURE
import app.template.patches.gms.Constants.VENDOR
import org.w3c.dom.Element
import org.w3c.dom.Node

/**
 * Manifest side of microG support (internal dependency of [redirectGmsToMicrogPatch]):
 *
 *  1. Adds the spoofing meta-data microG reads to present Roost's original identity
 *     (package name + signing SHA-1) to Google during login.
 *  2. Adds a `<queries>` entry so Roost can see/bind the microG package on Android 11+
 *     (package visibility).
 *
 * This intentionally does NOT rename the app package, so the patched build replaces the
 * Play install rather than coexisting with it (keeps the port minimal).
 */
internal val gmsSpoofManifestPatch = resourcePatch {
    execute {
        val microgPackage = "$VENDOR.android.gms"

        fun Node.adoptChild(tagName: String, block: Element.() -> Unit) {
            val child = ownerDocument.createElement(tagName)
            child.block()
            appendChild(child)
        }

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement

            val application = document.getElementsByTagName("application").item(0)

            // microG reads these to spoof Roost's original package + signature to Google.
            application.adoptChild("meta-data") {
                setAttribute("android:name", "$microgPackage.SPOOFED_PACKAGE_NAME")
                setAttribute("android:value", ROOST_PACKAGE_NAME)
            }
            application.adoptChild("meta-data") {
                setAttribute("android:name", "$microgPackage.SPOOFED_PACKAGE_SIGNATURE")
                setAttribute("android:value", SPOOFED_PACKAGE_SIGNATURE)
            }

            // Package visibility for the microG app (required on API 30+).
            val queries = document.getElementsByTagName("queries").item(0)
                ?: manifest.appendChild(document.createElement("queries"))
            queries.adoptChild("package") {
                setAttribute("android:name", microgPackage)
            }
        }
    }
}
