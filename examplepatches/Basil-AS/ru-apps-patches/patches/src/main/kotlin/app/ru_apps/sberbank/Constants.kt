package app.ru_apps.sberbank

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Verified 2026-10-06 against a fresh RuStore download (scripts/rustore_dl.py) of
 * ru.sberbankmobile, apktool-decoded to apps/ru.sberbankmobile/apk/_apktool_base.
 * No open Morphe patch exists for this app; the long-standing
 * Xposed-Modules-Repo/ru.bluecat.sberbankpatcher LSPosed module documents similar
 * ground (Kaspersky AV, self-update, analytics, push filtering) but is closed-source
 * and runtime-hook-based, not a static patch, and explicitly does not touch the
 * SberPay root/integrity check — see research/notes/07_existing_patches_landscape.md.
 */
object Constants {
    val COMPATIBILITY_SBERBANK = Compatibility(
        name = "СберБанк",
        packageName = "ru.sberbankmobile",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x21A038,
        targets = listOf(
            AppTarget(version = "17.13.0", versionCode = 2026062316),
        ),
    )
}
