/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.patches.yandexmusic.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
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

val disableTelemetryPatch = patch(
    name = "Отключить телеметрию",
    description = "Отключает адреса и описания сервисов AppsFlyer, AppMetrica, OpenTelemetry " +
        "и Firebase/Crashlytics.",
) {
    compatibleWith(COMPATIBILITY_YANDEX_MUSIC)

    execute {
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
