package app.template.patches.mav

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MAV_EMMAPP
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

/**
 * Verified against hu.mav.emmapp_merged.apk (AndroidManifest.xml). The
 * manifest already disables Firebase Analytics collection by default:
 *
 *   <meta-data android:name="firebase_analytics_collection_enabled" android:value="false"/>
 *
 * but has no equivalent entry for Crashlytics, which is collection-enabled
 * by default. This app's own internal logging funnel (used throughout for
 * things like the "PlayIntegrityValidator" debug messages seen elsewhere in
 * this patch set) forwards into Crashlytics as breadcrumb logs and
 * non-fatal exception reports, in addition to Crashlytics' own automatic
 * crash reporting.
 *
 * Rather than chase every call site that forwards into Crashlytics through
 * this app's own obfuscated logging code, this adds the official,
 * documented opt-out flag (mirroring the analytics one already present),
 * which disables collection at the SDK's own initialization -- before any
 * report, breadcrumb, or non-fatal could be generated or queued at all:
 *
 *   <meta-data android:name="firebase_crashlytics_collection_enabled" android:value="false"/>
 */
@Suppress("unused")
val disableFirebaseCrashlyticsPatch = resourcePatch(
    name = "Disable Firebase Crashlytics",
    description = "Adds the official firebase_crashlytics_collection_enabled=false manifest flag, disabling all crash/log reporting to Firebase Crashlytics at SDK init.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MAV_EMMAPP)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val application = doc.getElementsByTagName("application").item(0) as Element

            val alreadyPresent = (0 until application.childNodes.length).any { i ->
                val node = application.childNodes.item(i)
                node is Element &&
                    node.tagName == "meta-data" &&
                    node.getAttributeNS(ANDROID_NS, "name") == "firebase_crashlytics_collection_enabled"
            }
            if (alreadyPresent) return@use

            val metaData = doc.createElement("meta-data")
            metaData.setAttributeNS(ANDROID_NS, "android:name", "firebase_crashlytics_collection_enabled")
            metaData.setAttributeNS(ANDROID_NS, "android:value", "false")
            application.appendChild(metaData)
        }
    }
}
