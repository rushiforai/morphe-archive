package app.template.patches.googlemessages

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import org.w3c.dom.Node

private const val APP_PACKAGE = "com.google.android.apps.messaging"
private const val SETTINGS_ACTIVITY =
    "app.template.extension.googlemessages.KeywordSettingsActivity"

// Keep a launcher icon ("Keyword Filter") until the in-settings row is confirmed working.
private const val KEEP_LAUNCHER_FALLBACK = true

internal val keywordSettingsResourcePatch = resourcePatch {
    execute {
        // 1. Register the settings activity.
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0)

            val activity = doc.createElement("activity")
            activity.setAttribute("android:name", SETTINGS_ACTIVITY)
            activity.setAttribute("android:label", "Keyword Filter")
            activity.setAttribute("android:exported", if (KEEP_LAUNCHER_FALLBACK) "true" else "false")

            if (KEEP_LAUNCHER_FALLBACK) {
                val intentFilter = doc.createElement("intent-filter")
                intentFilter.appendChild(doc.createElement("action").apply {
                    setAttribute("android:name", "android.intent.action.MAIN")
                })
                intentFilter.appendChild(doc.createElement("category").apply {
                    setAttribute("android:name", "android.intent.category.LAUNCHER")
                })
                activity.appendChild(intentFilter)
            }
            application.appendChild(activity)
        }

        // 2. Add a row to Messages' main settings screen, just above "Bubbles".
        document("res/xml/preferences_application.xml").use { doc ->
            val root = doc.documentElement

            val entry = doc.createElement("Preference")
            entry.setAttribute("android:persistent", "false")
            entry.setAttribute("android:title", "Keyword Filter")
            entry.setAttribute("android:summary", "Drop messages containing your keywords")
            entry.setAttribute("android:key", "morphe_keyword_filter_pref")
            entry.setAttribute("app:allowDividerAbove", "true")
            entry.appendChild(doc.createElement("intent").apply {
                setAttribute("android:targetPackage", APP_PACKAGE)
                setAttribute("android:targetClass", SETTINGS_ACTIVITY)
            })

            var anchor: Node? = null
            val children = root.childNodes
            for (i in 0 until children.length) {
                val node = children.item(i)
                if (node is Element &&
                    node.getAttribute("android:key") == "@string/bubble_settings_pref_key"
                ) {
                    anchor = node
                    break
                }
            }
            if (anchor != null) root.insertBefore(entry, anchor) else root.appendChild(entry)
        }
    }
}
