package app.morphe.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_KINESTOP = Compatibility(
        name = "KineStop",
        packageName = "com.urbandroid.kinestop",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00FFC107, // 0x00RRGGBB — alpha must be 0x00 (amber)
        targets = listOf(
            // Exact version this patch was developed and confirmed working against.
            // KineService$Companion.isTrial is non-obfuscated first-party Kotlin,
            // so the fingerprint is stable, but pin the tested version to be safe.
            AppTarget(version = "5.1")
        )
    )
}