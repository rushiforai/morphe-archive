package me.mikem.musicleague

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private const val EXPO_ANDROID_NS = "http://schemas.android.com/apk/res/android"

private fun Element.expoAndroidAttr(name: String): String {
    return getAttributeNS(EXPO_ANDROID_NS, name).ifBlank { getAttribute("android:$name") }
}

private fun Element.setExpoAndroidAttr(name: String, value: String) {
    if (hasAttributeNS(EXPO_ANDROID_NS, name)) {
        setAttributeNS(EXPO_ANDROID_NS, "android:$name", value)
    } else {
        setAttribute("android:$name", value)
    }
}

private fun Element.removeExpoAndroidAttr(name: String) {
    if (hasAttributeNS(EXPO_ANDROID_NS, name)) removeAttributeNS(EXPO_ANDROID_NS, name)
    if (hasAttribute("android:$name")) removeAttribute("android:$name")
}

@Suppress("unused")
val disableExpoUpdatesPatch = resourcePatch(
    name = "Disable Expo updates and backup restore",
    description = "Forces the app to use the bundled local Hermes asset instead of cached Expo OTA updates or restored app data.",
    default = true,
) {
    compatibleWith(MUSIC_LEAGUE)

    execute {
        document("AndroidManifest.xml").use { document ->
            val applications = document.getElementsByTagName("application")

            if (applications.length > 0) {
                val application = applications.item(0)

                if (application is Element) {
                    application.setExpoAndroidAttr("allowBackup", "false")
                    application.setExpoAndroidAttr("fullBackupOnly", "false")
                    application.removeExpoAndroidAttr("fullBackupContent")
                    application.removeExpoAndroidAttr("dataExtractionRules")
                }
            }

            val metaDataNodes = document.getElementsByTagName("meta-data")

            for (i in 0 until metaDataNodes.length) {
                val node = metaDataNodes.item(i)
                if (node !is Element) continue

                when (node.expoAndroidAttr("name")) {
                    "expo.modules.updates.ENABLED" -> node.setExpoAndroidAttr("value", "false")
                    "expo.modules.updates.EXPO_UPDATES_CHECK_ON_LAUNCH" -> node.setExpoAndroidAttr("value", "NEVER")
                    "expo.modules.updates.EXPO_UPDATES_LAUNCH_WAIT_MS" -> node.setExpoAndroidAttr("value", "0")
                    "expo.modules.updates.EXPO_UPDATE_URL" -> node.setExpoAndroidAttr("value", "")
                    "expo.modules.updates.UPDATES_CONFIGURATION_REQUEST_HEADERS_KEY" -> node.setExpoAndroidAttr("value", "{}")
                }
            }
        }
    }
}
