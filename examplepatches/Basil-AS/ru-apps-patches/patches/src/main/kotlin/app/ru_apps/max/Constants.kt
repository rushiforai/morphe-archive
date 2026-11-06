package app.ru_apps.max

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Ported from RealCyberwash/max-patches (GPLv3), app/template/patches/shared/Constants.kt
 * (there named COMPATIBILITY_CHMAX), and extended with the version we actually
 * downloaded and reverse-engineered for this repo (26.34.0, versionCode 6850, via
 * scripts/rustore_dl.py). See apps/ru.oneme.app/analysis/ for the verification work.
 *
 * Fingerprint matching in this framework is structural (access flags, types, literals,
 * string/method-call filters), not name-based, so [vpn.VpnCheckerFingerprint] was
 * re-verified against 26.34.0's smali directly (class renamed vb7 -> ji8 by R8 between
 * builds) rather than assumed to still match from the older target versions alone.
 */
object Constants {
    val COMPATIBILITY_MAX = Compatibility(
        name = "MAX",
        packageName = "ru.oneme.app",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A73E8,
        targets = listOf(
            AppTarget(version = "26.35.0"),
            AppTarget(version = "26.34.0"),
            AppTarget(version = "26.10.1"),
            AppTarget(version = "26.11.3"),
        ),
    )
}
