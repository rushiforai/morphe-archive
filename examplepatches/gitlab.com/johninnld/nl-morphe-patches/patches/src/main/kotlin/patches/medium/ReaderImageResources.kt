package patches.medium

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

internal val readerImageResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { xml ->
            val app = xml.getElementsByTagName("application").item(0) as Element
            val providers = xml.getElementsByTagName("provider")
            val authority = "com.medium.reader.native-reader.images"
            check((0 until providers.length).none {
                (providers.item(it) as Element).getAttributeNS(ANDROID, "authorities").split(';').contains(authority)
            }) { "Reader image authority already registered" }
            val provider = xml.createElement("provider")
            provider.setAttributeNS(ANDROID, "android:name", "nl.johninnl.medium.reader.ReaderImageProvider")
            provider.setAttributeNS(ANDROID, "android:authorities", authority)
            provider.setAttributeNS(ANDROID, "android:exported", "false")
            provider.setAttributeNS(ANDROID, "android:grantUriPermissions", "false")
            app.appendChild(provider)
            val activity = xml.createElement("activity")
            activity.setAttributeNS(ANDROID, "android:name", "nl.johninnl.medium.reader.OfflineArticlesActivity")
            activity.setAttributeNS(ANDROID, "android:exported", "true")
            activity.setAttributeNS(ANDROID, "android:enableOnBackInvokedCallback", "false")
            app.appendChild(activity)
        }
        document("res/values/strings.xml").use { xml ->
            val string = xml.createElement("string")
            string.setAttribute("name", "medium_reader_offline_articles")
            string.textContent = "Offline articles"
            xml.documentElement.appendChild(string)
        }
        document("res/xml/shortcuts.xml").use { xml ->
            val shortcut = xml.createElement("shortcut")
            shortcut.setAttributeNS(ANDROID, "android:shortcutId", "medium_reader_offline")
            shortcut.setAttributeNS(ANDROID, "android:shortcutShortLabel", "@string/medium_reader_offline_articles")
            shortcut.setAttributeNS(ANDROID, "android:icon", "@android:drawable/ic_menu_save")
            val intent = xml.createElement("intent")
            intent.setAttributeNS(ANDROID, "android:action", "android.intent.action.VIEW")
            intent.setAttributeNS(ANDROID, "android:targetPackage", "com.medium.reader")
            intent.setAttributeNS(ANDROID, "android:targetClass", "nl.johninnl.medium.reader.OfflineArticlesActivity")
            shortcut.appendChild(intent)
            xml.documentElement.appendChild(shortcut)
        }
    }
}
