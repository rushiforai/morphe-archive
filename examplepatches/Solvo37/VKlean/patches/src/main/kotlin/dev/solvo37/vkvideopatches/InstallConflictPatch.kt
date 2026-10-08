package dev.solvo37.vkvideopatches

import app.morphe.patcher.patch.resourcePatch
import dev.solvo37.vkvideopatches.Constants.VK_VIDEO
import org.w3c.dom.Element

private val conflictingVkPermissions = setOf(
    "com.vkontakte.android.permission.ACCESS_DATA",
    "com.vkontakte.android.permission.APP_REDIRECT",
)

/**
 * Stock VK and VK Video are signed by the same vendor key, so both APKs can declare
 * these signature permissions. A patched VK Video APK is re-signed with the project
 * key; Android then rejects installation while stock VK is installed with
 * INSTALL_FAILED_DUPLICATE_PERMISSION / STATUS_FAILURE_CONFLICT.
 *
 * Keep the uses-permission entries, but remove VK Video's duplicate declarations so
 * the already-installed stock VK package remains the owner of these permissions.
 */
@Suppress("unused")
val fixVkInstallConflictPatch = resourcePatch(
    name = "Fix install conflict with stock VK",
    description = "Allows the re-signed VK Video build to coexist with the official VK app.",
    default = true,
) {
    compatibleWith(VK_VIDEO)

    execute {
        document("AndroidManifest.xml").use { document ->
            val permissions = document.getElementsByTagName("permission")

            for (index in permissions.length - 1 downTo 0) {
                val element = permissions.item(index) as? Element ?: continue
                val permissionName = element.getAttribute("android:name")

                if (permissionName in conflictingVkPermissions) {
                    element.parentNode.removeChild(element)
                }
            }
        }
    }
}
