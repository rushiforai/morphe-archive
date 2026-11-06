// Ported from Freeman022026/rustore-privacy-patches (GPLv3), dev/freeman022026/rustore/patches/Constants.kt.
package app.ru_apps.rustore

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

const val AUDITED_VERSION = "1.109.1.0"

private const val OFFICIAL_SIGNER_SHA256 =
    "661f20828ef780de0b79bc59f26a30864316355f30e4f91cfa14a20791839914"

object Constants {
    val COMPATIBILITY_RUSTORE = Compatibility(
        name = "RuStore",
        packageName = "ru.vk.store",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0A85FF,
        signatures = setOf(OFFICIAL_SIGNER_SHA256),
        // A single pinned AppTarget meant every patch here was silently skipped
        // (compatibleWith() check, before any fingerprint matching) against any
        // live RuStore newer than AUDITED_VERSION. Following the multi-version
        // AppTarget list convention used by ozon/avito/tbank/wildberries, keep
        // the originally-audited version and add 1.111.0.3, which this session
        // live-decompiled and re-anchored both fingerprints in this package
        // against (static.rustore.ru/release/RuStore.apk, 2026-10-08).
        targets = listOf(
            AppTarget(version = "1.111.0.3", versionCode = 1111003),
            AppTarget(version = AUDITED_VERSION),
        )
    )
}
