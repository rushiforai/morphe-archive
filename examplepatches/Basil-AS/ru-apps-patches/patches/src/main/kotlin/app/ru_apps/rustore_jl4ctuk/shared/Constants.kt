// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/rustore/shared/Constants.kt.
package app.ru_apps.rustore_jl4ctuk.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val OFFICIAL_RUSTORE_SIGNER_SHA256 =
        "661f20828ef780de0b79bc59f26a30864316355f30e4f91cfa14a20791839914"

    val COMPATIBILITY_RUSTORE = Compatibility(
        name = "RuStore",
        packageName = "ru.vk.store",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0077FF,
        signatures = setOf(OFFICIAL_RUSTORE_SIGNER_SHA256),
        // A single pinned AppTarget meant every patch in this package was
        // silently skipped (compatibleWith() check, before any fingerprint
        // matching) against any live RuStore newer than 1.108.0.2. Following
        // the multi-version AppTarget list convention used by
        // ozon/avito/tbank/wildberries, keep the original target and add
        // 1.111.0.3, which this session live-decompiled and re-anchored every
        // drifted fingerprint in this package against
        // (static.rustore.ru/release/RuStore.apk, 2026-10-08).
        targets = listOf(
            AppTarget(version = "1.111.0.3", versionCode = 1111003),
            AppTarget(version = "1.108.0.2", versionCode = 1108002),
        ),
    )
}
