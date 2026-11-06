package app.ru_apps.yandex

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Compatibility declarations for the requested Yandex applications.
 *
 * Versions are pinned to APKs downloaded through the RuStore API and verified
 * by package identity, version metadata and SHA-256 artifact evidence.
 */
object Constants {
    val COMPATIBILITY_YANDEX_MUSIC = Compatibility(
        name = "Yandex Music",
        packageName = "ru.yandex.music",
        targets = listOf(AppTarget(version = "2026.09.5 #167.1rur")),
    )

    val COMPATIBILITY_YANDEX_MAPS = Compatibility(
        name = "Yandex Maps",
        packageName = "ru.yandex.yandexmaps",
        targets = listOf(AppTarget(version = "31.1.3")),
    )

    val COMPATIBILITY_YANDEX_TAXI = Compatibility(
        name = "Yandex Go",
        packageName = "ru.yandex.taxi",
        targets = listOf(AppTarget(version = "5.98.0")),
    )

    val COMPATIBILITY_YANDEX_PAY = Compatibility(
        name = "Yandex Pay",
        packageName = "com.yandex.bank",
        targets = listOf(AppTarget(version = "0.243.0")),
    )

    val COMPATIBILITY_YANDEX_RASP = Compatibility(
        name = "Yandex Rasp",
        packageName = "ru.yandex.rasp",
        targets = listOf(AppTarget(version = "3.73.0")),
    )

    val COMPATIBILITY_YANDEX_MAIL = Compatibility(
        name = "Yandex Mail",
        packageName = "ru.yandex.mail",
        targets = listOf(AppTarget(version = "9.30.1")),
    )
}
