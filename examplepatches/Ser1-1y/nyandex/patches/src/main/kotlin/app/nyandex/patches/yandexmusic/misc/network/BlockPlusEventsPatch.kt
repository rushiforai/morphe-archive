/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.patches.yandexmusic.misc.network

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.nyandex.patches.yandexmusic.shared.Constants.COMPATIBILITY_YANDEX_MUSIC
import app.nyandex.patches.yandexmusic.util.StringReplacement
import app.nyandex.patches.yandexmusic.util.replaceAnnotationStrings
import app.nyandex.patches.yandexmusic.util.replaceStringConstants
import java.util.logging.Logger

private val logger = Logger.getLogger("YandexMusicBlockPlusEvents")

private const val LOOPBACK = "127.0.0.1"
private const val TRIGGER_API = "Lcom/yandex/music/shared/bdu/trigger/network/TriggerApi;"

/**
 * Plus analytics/acquisition hosts are separate from the GraphQL and payment hosts.
 * Redirecting only these two keeps login, playback and the real Plus API working.
 */
private val PLUS_HOSTS = arrayOf(
    "api.events.plus.yandex.net",
    "api.acquisition-gwe.plus.yandex.net",
)

private val TRIGGER_PATHS = arrayOf(
    "dynamic-pages/v2/trigger/shown",
    "dynamic-pages/v2/trigger/polling",
    "dynamic-pages/v2/trigger/action",
)

val blockPlusEventsPatch = patch(
    name = "Блокировать аналитику Плюса",
    description = "Перенаправляет на localhost хосты событий и привлечения Плюса, а также устаревшие " +
        "триггеры динамических страниц.",
) {
    compatibleWith(COMPATIBILITY_YANDEX_MUSIC)

    execute {
        val triggers = TRIGGER_PATHS.map { StringReplacement(it, LOOPBACK) }.toTypedArray()
        var changed = replaceStringConstants(
            *PLUS_HOSTS.map { StringReplacement(it, LOOPBACK) }.toTypedArray(),
        )
        changed += replaceStringConstants(*triggers)

        // Retrofit endpoint paths are annotation values, not const-string instructions.
        changed += replaceAnnotationStrings(
            TRIGGER_API,
            *triggers,
        )

        if (changed == 0) {
            throw PatchException("No Plus event or trigger endpoint was found")
        }

        logger.info("Redirected $changed Plus/trigger endpoint strings")
    }
}
