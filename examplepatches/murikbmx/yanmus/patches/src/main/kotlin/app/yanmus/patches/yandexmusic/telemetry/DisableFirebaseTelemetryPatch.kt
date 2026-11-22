package app.yanmus.patches.yandexmusic.telemetry

import app.morphe.patcher.patch.resourcePatch
import app.yanmus.patches.yandexmusic.shared.Constants.COMPATIBILITY_YANDEX_MUSIC
import org.w3c.dom.Element

/** Official Firebase/Google flags that turn data collection off without code changes. */
private val META = mapOf(
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_analytics_collection_enabled" to "false",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_performance_collection_deactivated" to "true",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
)

@Suppress("unused")
val disableFirebaseTelemetryPatch = resourcePatch(
    name = "Disable Firebase telemetry",
    description = "Отключает Firebase Analytics, Crashlytics, Performance и сбор рекламного ID через флаги манифеста.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YANDEX_MUSIC)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val app = doc.getElementsByTagName("application").item(0) as Element

            // existing values of these keys are replaced, not duplicated
            val metas = app.getElementsByTagName("meta-data")
            for (i in metas.length - 1 downTo 0) {
                val el = metas.item(i) as Element
                if (el.getAttribute("android:name") in META.keys) el.parentNode.removeChild(el)
            }
            META.forEach { (key, value) ->
                app.appendChild(
                    doc.createElement("meta-data").apply {
                        setAttribute("android:name", key)
                        setAttribute("android:value", value)
                    },
                )
            }

            // advertising ID permission
            val perms = doc.getElementsByTagName("uses-permission")
            for (i in perms.length - 1 downTo 0) {
                val el = perms.item(i) as Element
                if (el.getAttribute("android:name") == "com.google.android.gms.permission.AD_ID") {
                    el.parentNode.removeChild(el)
                }
            }
        }
    }
}
