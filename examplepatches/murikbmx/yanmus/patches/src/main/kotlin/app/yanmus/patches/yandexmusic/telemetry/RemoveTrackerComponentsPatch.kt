package app.yanmus.patches.yandexmusic.telemetry

import app.morphe.patcher.patch.resourcePatch
import app.yanmus.patches.yandexmusic.shared.Constants.COMPATIBILITY_YANDEX_MUSIC
import org.w3c.dom.Element

/**
 * Tracker services/receivers/providers. Conservative on purpose, NOT removed:
 * - io.appmetrica.analytics.* — the AppMetrica service also serves device identifiers for the login;
 * - com.yandex.metrica.push.* and FirebaseMessagingService — push notifications;
 * - datatransport and FirebaseInitProvider — pushes depend on them, a job for a missing service crashes the app.
 */
private val TRACKER_PREFIXES = listOf(
    "com.appsflyer.",
    "com.google.android.gms.measurement.",
    "com.google.firebase.analytics.",
    "com.google.firebase.crashlytics.",
    "com.google.firebase.sessions.",
    "com.my.tracker.",
    "com.adjust.sdk.",
)

@Suppress("unused")
val removeTrackerComponentsPatch = resourcePatch(
    name = "Remove tracker components",
    description = "Экспериментально. Удаляет из манифеста сервисы и ресиверы трекеров (AppsFlyer, Firebase Analytics/Crashlytics/Sessions).",
    default = false,
) {
    compatibleWith(COMPATIBILITY_YANDEX_MUSIC)
    dependsOn(disableFirebaseTelemetryPatch)

    execute {
        document("AndroidManifest.xml").use { doc ->
            listOf("service", "receiver", "provider").forEach { tag ->
                val nodes = doc.getElementsByTagName(tag)
                for (i in nodes.length - 1 downTo 0) {
                    val el = nodes.item(i) as Element
                    val name = el.getAttribute("android:name")
                    if (TRACKER_PREFIXES.any(name::startsWith)) el.parentNode.removeChild(el)
                }
            }
        }
    }
}
