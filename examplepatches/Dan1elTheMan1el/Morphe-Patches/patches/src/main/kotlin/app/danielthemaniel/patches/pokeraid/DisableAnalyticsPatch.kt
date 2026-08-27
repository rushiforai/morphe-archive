package app.danielthemaniel.patches.pokeraid

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Disables optional analytics/diagnostics collection without touching
 * Firebase Cloud Messaging, authentication, or PokeRaid networking.
 */
@Suppress("unused")
val disableAnalyticsPatch = resourcePatch(
    name = "Disable Analytics",
    description = "Disables Firebase Analytics, Crashlytics, Performance Monitoring, and Advertising ID collection while preserving app functionality.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_POKERAID)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement

            // Remove Android's Advertising ID permission.
            val permissions = manifest.getElementsByTagName("uses-permission")

            for (i in permissions.length - 1 downTo 0) {
                val permission = permissions.item(i) as? Element ?: continue

                if (
                    permission.getAttribute("android:name") ==
                    "com.google.android.gms.permission.AD_ID"
                ) {
                    permission.parentNode.removeChild(permission)
                }
            }

            val application = manifest
                .getElementsByTagName("application")
                .item(0) as? Element
                ?: return@use

            fun setMetaData(name: String, value: String) {
                val entries = application.getElementsByTagName("meta-data")

                for (i in 0 until entries.length) {
                    val entry = entries.item(i) as? Element ?: continue

                    if (entry.getAttribute("android:name") == name) {
                        entry.setAttribute("android:value", value)
                        return
                    }
                }

                val entry = document.createElement("meta-data")
                entry.setAttribute("android:name", name)
                entry.setAttribute("android:value", value)
                application.appendChild(entry)
            }

            // Permanently disable Firebase Analytics.
            setMetaData(
                "firebase_analytics_collection_deactivated",
                "true"
            )

            // Explicitly prevent Firebase Analytics from using Advertising ID.
            setMetaData(
                "google_analytics_adid_collection_enabled",
                "false"
            )

            // Disable automatic Crashlytics reports.
            setMetaData(
                "firebase_crashlytics_collection_enabled",
                "false"
            )

            // Permanently disable Firebase Performance Monitoring.
            setMetaData(
                "firebase_performance_collection_deactivated",
                "true"
            )
        }
    }
}