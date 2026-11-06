package app.morphe.patches.colonyflow

import app.morphe.patches.colonyflow.Constants.COMPATIBILITY_COLONY_FLOW
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

@Suppress("unused")
val manifestPatch =
    resourcePatch(
        name = "Fix Native Libs & Disable Analytics",
        description = "Sets extractNativeLibs to true and adds metadata to disable Firebase/Google analytics.",
    ) {
        compatibleWith(COMPATIBILITY_COLONY_FLOW)

        execute {
            document("AndroidManifest.xml").use { document ->
                val appList = document.getElementsByTagName("application")
                if (appList.length == 0) return@use
                val appElement = appList.item(0) as Element

                // Fix native library extraction crash on modern Android
                appElement.setAttribute("android:extractNativeLibs", "true")

                // Enable debuggable for adb run-as save data backup/restore
                appElement.setAttribute("android:debuggable", "true")

                // Helper to append meta-data
                fun addMetaData(name: String, value: String) {
                    val meta = document.createElement("meta-data")
                    meta.setAttribute("android:name", name)
                    meta.setAttribute("android:value", value)
                    appElement.appendChild(meta)
                }

                addMetaData("firebase_analytics_collection_enabled", "false")
                addMetaData("firebase_analytics_collection_deactivated", "true")
                addMetaData("firebase_crashlytics_collection_enabled", "false")
                addMetaData("google_analytics_adid_collection_enabled", "false")
                addMetaData("google_analytics_default_allow_ad_personalization_signals", "false")
            }
        }
    }
