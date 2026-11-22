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
import app.nyandex.patches.yandexmusic.util.replaceStringConstants
import java.util.logging.Logger

private val logger = Logger.getLogger("YandexMusicRemoveTrackingHeaders")

private const val PREFIX = "X-Nyandex-Disabled-"

/**
 * The app and the Plus client add per-request identifiers that are only useful for
 * server-side analytics. Renaming the header keeps the header map valid while the
 * backend no longer receives the original tracking key.
 */
private val TRACKING_HEADERS = arrayOf(
    "X-Request-Id",
    "X-Yandex-DeviceID",
    "X-Yandex-Music-Device",
)

val removeTrackingHeadersPatch = patch(
    name = "Убрать заголовки отслеживания",
    description = "Перестаёт добавлять X-Request-Id и идентификаторы устройства Яндекса в запросы " +
        "Музыки и Плюса.",
) {
    compatibleWith(COMPATIBILITY_YANDEX_MUSIC)

    execute {
        val changed = replaceStringConstants(
            *TRACKING_HEADERS.map { StringReplacement(it, PREFIX + it.removePrefix("X-")) }
                .toTypedArray(),
        )

        if (changed == 0) {
            throw PatchException("No tracking header name was found")
        }

        logger.info("Renamed $changed tracking header constants")
    }
}
