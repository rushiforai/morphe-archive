/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.patches.yandexmusic.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.nyandex.patches.yandexmusic.shared.Constants.COMPATIBILITY_YANDEX_MUSIC
import app.nyandex.patches.yandexmusic.util.StringReplacement
import app.nyandex.patches.yandexmusic.util.replaceStringConstants
import java.util.logging.Logger

private val logger = Logger.getLogger("YandexMusicDisableTelemetry")

private const val DISABLED = "app.nyandex.yandexmusic.TELEMETRY_DISABLED"

/**
 * Endpoints, binder descriptors and SDK constants of the telemetry libraries bundled
 * with Yandex Music. Pointing them at an inert value keeps the SDK code from sending
 * anything even when its process starts.
 */
private val TELEMETRY_STRINGS = listOf(
    // AppsFlyer.
    "https://%sgcdsdk.%s/install_data/v5.0/",
    "https://%spia.%s/api/v1.0/pia-android-event?app_id=",
    "https://%svalidate-and-log.%s/api/v1.0/android/validateAndLog?app_id=",
    "https://%sviap.%s/api/v1/android/validate_purchase_v2?app_id=",
    "https://%sviap.%s/api/v1/android/validate_purchase?app_id=",
    "https://%sars.%s/api/v2/android/validate_subscription_v2?app_id=",
    "https://%sars.%s/api/v2/android/validate_subscription?app_id=",
    "https://%smonitorsdk.%s/remote-debug/exception-manager",
    "https://%scdn-%stestsettings.%s/android/v1/%s/settings",
    "https://%scdn-%ssettings.%s/android/v1/%s/settings",
    "https://privacy-sandbox.appsflyersdk.com/api/trigger",
    "https://%sadrevenue.%s/api/v2/generic/v6.16.2/android?app_id=",
    "https://%sattr.%s/api/v",
    "https://%sconversions.%s/api/v",
    "appsflyersdk.com",

    // AppMetrica / Metrica push.
    "https://startup.mobile.yandex.net/",
    // Its backup startup hosts.
    "https://startup.mobile.webvisor.com",
    "https://u.startup.mobile.webvisor.com",
    "https://appmetrica.yandex.com/docs/",
    "io.appmetrica.analytics.internal.IAppMetricaService",
    "io.appmetrica.analytics.IAppMetricaService",

    // OpenTelemetry.
    "io.opentelemetry.sdk.testing.context.SettableContextStorageProvider",
    "io.opentelemetry.sdk.metrics",
    "io.opentelemetry.context.",
    "io.opentelemetry.api.",

    // Google Advertising ID and Firebase / Crashlytics.
    "https://pagead2.googlesyndication.com/pagead/gen_204?id=gmob-apps",
    "com.google.android.gms.ads.identifier.service.START",
    "https://firebase-settings.crashlytics.com/spi/v2/platforms/android/gmp/",
    "firebase-settings.crashlytics.com",
    "https://www.googleapis.com/auth/games_lite",
    "https://www.googleapis.com/auth/games",
)

private val TELEMETRY_FILE_STRINGS = listOf(
    // AppsFlyer probes /proc/net/tcp to detect tethering.
    StringReplacement("/proc/net/tcp", "/dev/null"),
)

/**
 * Manifest components that only serve telemetry and attribution, by tag. Without them Android
 * cannot start these services and receivers, whatever strings their code uses. Datatransport
 * drops every event when its backend list (`TransportBackendDiscovery`) is missing.
 *
 * The AppMetrica Push and Firebase Messaging components stay: they deliver notifications.
 */
private val TELEMETRY_COMPONENTS = mapOf(
    "service" to setOf(
        "io.appmetrica.analytics.internal.AppMetricaService",
        "io.appmetrica.analytics.internal.AppMetricaMainProcessService",
        "com.google.firebase.sessions.SessionLifecycleService",
        "com.google.android.datatransport.runtime.backends.TransportBackendDiscovery",
        "com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService",
    ),
    "receiver" to setOf(
        "com.appsflyer.MultipleInstallBroadcastReceiver",
        "com.google.android.datatransport.runtime.scheduling.jobscheduling." +
            "AlarmManagerSchedulerBroadcastReceiver",
    ),
    "provider" to setOf("io.appmetrica.analytics.internal.PreloadInfoContentProvider"),
)

/** Permissions for the advertising ID, ad attribution and the install referrer. */
private val TELEMETRY_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
)

/** `<queries>` entries that let the SDKs see install referrer and advertising ID providers. */
private val TELEMETRY_QUERIES = setOf(
    "com.appsflyer.referrer.INSTALL_PROVIDER",
    "com.yandex.android.advid.IDENTIFIER_SERVICE",
    "com.uodis.opendevice.OPENIDS_SERVICE",
    "com.yandex.preinstallsatellite.appmetrica.AppMetricaContentProvider",
)

/** Firebase's own manifest switches. */
private val FIREBASE_OPT_OUTS = listOf(
    "firebase_crashlytics_collection_enabled",
    "firebase_sessions_enabled",
)

val disableTelemetryPatch = patch(
    name = "Отключить телеметрию",
    description = "Отключает адреса и описания сервисов AppsFlyer, AppMetrica, OpenTelemetry " +
        "и Firebase/Crashlytics.",
) {
    compatibleWith(COMPATIBILITY_YANDEX_MUSIC)

    execute {
        disableTelemetryInManifest()

        val replacements = buildList {
            TELEMETRY_STRINGS.forEach { add(StringReplacement(it, DISABLED)) }
            addAll(TELEMETRY_FILE_STRINGS)
        }

        val changed = replaceStringConstants(*replacements.toTypedArray())

        if (changed == 0) {
            throw PatchException("No telemetry string constant was found")
        }

        logger.info("Disabled $changed telemetry string constants")
    }
}

private fun disableTelemetryInManifest() {
    resourceXml("AndroidManifest.xml").use { manifest ->
        val application = manifest.elements("application").first()
        var removed = 0

        TELEMETRY_COMPONENTS.forEach { (tag, names) ->
            val found = application.children(tag).filter { it.attribute("android:name") in names }
            found.forEach { it.remove() }
            removed += found.size
        }

        manifest.root.children("uses-permission")
            .filter { it.attribute("android:name") in TELEMETRY_PERMISSIONS }
            .forEach {
                it.remove()
                removed++
            }

        // A query is either `<provider android:name>` or `<intent>` with an `<action android:name>`.
        manifest.root.children("queries").forEach { queries ->
            val found = queries.children("provider").filter { it.attribute("android:name") in TELEMETRY_QUERIES } +
                queries.children("intent").filter { intent ->
                    intent.children("action").any { it.attribute("android:name") in TELEMETRY_QUERIES }
                }
            found.forEach { it.remove() }
            removed += found.size
        }

        if (removed == 0) {
            throw PatchException("No telemetry manifest entry was found")
        }

        FIREBASE_OPT_OUTS.forEach { key ->
            application.children("meta-data")
                .filter { it.attribute("android:name") == key }
                .forEach { it.remove() }
            application.appendChild("meta-data") {
                setAttribute("android:name", key)
                setAttribute("android:value", "false")
            }
        }

        logger.info("Removed $removed telemetry manifest entries")
    }
}
