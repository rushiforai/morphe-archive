package app.morphe.patches.kabbik.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_KABBIK = Compatibility(
        name = "Kabbik",
        packageName = "com.kabbik.app",
        apkFileType = ApkFileType.XAPK,
        signatures = setOf("5b7e0691263a21a2a239462dc90c04f3e69fada272f6b3cb25953c3627c98650"),
        targets = listOf(
            AppTarget(version = "1.7.12", versionCode = 305, isExperimental = true, minSdk = 24),
        )
    )
}
