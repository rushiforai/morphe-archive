package app.template.patches.chatgpt.privacy

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.CHATGPT_COMPATIBILITY
import org.w3c.dom.Element

private val personalDataPermissions = setOf(
    "android.permission.ACCESS_COARSE_LOCATION",
    "android.permission.ACCESS_FINE_LOCATION",
    "android.permission.READ_CONTACTS",
    "android.permission.READ_BASIC_PHONE_STATE",
    "android.permission.READ_PHONE_STATE",
    "android.permission.SEND_SMS",
)

@Suppress("unused")
val privacyRemoveLocationContactsPhonePatch = resourcePatch(
    name = "Privacy: no location, contacts or phone data",
    description = "Removes ChatGPT's location, contacts, phone-state and SMS-send permissions. " +
        "Location-based answers, contact lookup, phone-state access and direct SMS sending are " +
        "disabled. Call/voice-assistant framework permissions, chat, files and push notifications " +
        "are preserved.",
    default = true,
) {
    compatibleWith(CHATGPT_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            listOf("uses-permission", "uses-permission-sdk-23").forEach { tag ->
                val nodes = document.getElementsByTagName(tag)
                for (index in nodes.length - 1 downTo 0) {
                    val node = nodes.item(index) as Element
                    if (node.getAttribute("android:name") in personalDataPermissions) {
                        manifest.removeChild(node)
                    }
                }
            }
        }
    }
}
