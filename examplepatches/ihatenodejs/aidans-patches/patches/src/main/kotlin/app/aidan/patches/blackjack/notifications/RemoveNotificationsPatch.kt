package app.aidan.patches.blackjack.notifications

import app.aidan.patches.blackjack.shared.COMPATIBILITY_BLACKJACK
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
private const val POST_NOTIFICATIONS_PERMISSION = "android.permission.POST_NOTIFICATIONS"

@Suppress("unused")
val removeNotificationsPatch = resourcePatch(
    name = "Remove Notifications",
    description = "Removes notification permissions from AndroidManifest.xml to eliminate push notifications entirely.",
    default = true
) {
    compatibleWith(COMPATIBILITY_BLACKJACK)

    execute {
        document("AndroidManifest.xml").use { document ->
            val permissionsToRemove = buildList {
                for (tagName in listOf("uses-permission", "uses-permission-sdk-23")) {
                    val permissionNodes = document.getElementsByTagName(tagName)
                    for (index in 0 until permissionNodes.length) {
                        val element = permissionNodes.item(index) as? Element ?: continue
                        val permissionName = element.getAttributeNS(ANDROID_NAMESPACE, "name")
                            .ifEmpty { element.getAttribute("android:name") }
                            .trim()
                        if (permissionName == POST_NOTIFICATIONS_PERMISSION) {
                            add(element)
                        }
                    }
                }
            }

            var removedCount = 0
            permissionsToRemove.forEach { element ->
                if (element.parentNode?.removeChild(element) != null) {
                    removedCount++
                }
            }
            if (removedCount == 0) {
                throw PatchException("Notification permission '$POST_NOTIFICATIONS_PERMISSION' not found in AndroidManifest.xml")
            }
        }
    }
}
