package io.github.liongalahad.stremio.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

internal object Constants {
    const val PACKAGE_NAME = "com.stremio.one"
    const val TARGET_VERSION = "1.10.4"

    val STREMIO_COMPATIBILITY = Compatibility(
        name = "Stremio Android TV",
        packageName = PACKAGE_NAME,
        apkFileType = ApkFileType.APK_REQUIRED,
        appIconColor = 0x09090E,
        signatures = setOf(
            "7e6a979c968f771e3fbcf2c2e8718ce61e708d87caf91fc13e2d4c19a8022c6b"
        ),
        targets = listOf(
            AppTarget(
                version = TARGET_VERSION,
                versionCodes = mapOf(
                    SupportedAbi.ARMEABI_V7A to 31048580,
                    SupportedAbi.X86 to 32097156,
                    SupportedAbi.ARM64_V8A to 33145732,
                    SupportedAbi.X86_64 to 34194308
                ),
                minSdk = 24,
                description = "Official Stremio Android TV 1.10.4 APK"
            )
        )
    )
}
