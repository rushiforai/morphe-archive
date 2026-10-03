/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.patches.facebook.misc

import app.morphe.patches.facebook.shared.Constants
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private val messengerPermissions = mapOf(
    "com.facebook.permission.prod.FB_APP_COMMUNICATION" to
        "com.facebook.permission.prod.FB_APP_COMMUNICATION.devanced",
    "com.facebook.receiver.permission.ACCESS" to
        "com.facebook.receiver.permission.ACCESS.devanced",
)

/**
 * Facebook and Messenger normally share two signature-level permission names.
 * Re-signing Facebook changes the owner of those declarations, so Android refuses
 * a Meta-signed Messenger update with INSTALL_FAILED_DUPLICATE_PERMISSION.
 *
 * This patch namespaces Facebook's copies and every manifest reference to them,
 * leaving the original names free for Messenger.
 */
@Suppress("unused")
val messengerInstallCompatibilityPatch = resourcePatch(
    name = "Messenger install compatibility",
    description = "Namespaces Facebook's shared signature permissions so official Messenger installs beside a re-signed Facebook build.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    finalize {
        document("AndroidManifest.xml").use { document ->
            val declarations = document.getElementsByTagName("permission")
            var declarationCount = 0
            for (index in declarations.length - 1 downTo 0) {
                val permission = declarations.item(index) as? Element ?: continue
                val current = permission.getAttribute("android:name")
                val replacement = messengerPermissions[current]
                if (replacement != null) {
                    permission.setAttribute("android:name", replacement)
                    declarationCount++
                }
            }

            val elements = document.getElementsByTagName("*")
            val permissionAttributes = listOf(
                "android:name",
                "android:permission",
                "android:readPermission",
                "android:writePermission",
            )
            var referenceCount = 0
            for (index in 0 until elements.length) {
                val element = elements.item(index) as? Element ?: continue
                for (attribute in permissionAttributes) {
                    val current = element.getAttribute(attribute)
                    val replacement = messengerPermissions[current] ?: continue
                    element.setAttribute(attribute, replacement)
                    referenceCount++
                }
            }

            check(declarationCount == messengerPermissions.size) {
                "Expected ${messengerPermissions.size} Messenger-shared permission declarations, " +
                    "found $declarationCount"
            }
            println(
                "[MessengerInstall] permissionDeclarations=$declarationCount " +
                    "manifestReferences=$referenceCount",
            )
        }
    }
}
