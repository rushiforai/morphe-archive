package dev.petalaa.patches.androidauto

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Shared constants for Petal Maps Android Auto patches.
 *
 * The signature is the SHA-256 of the original Huawei certificate used to sign
 * Petal Maps 4.7.0.322(001) (versionCode 40700322).
 */
internal object Constants {
    val COMPATIBILITY_PETAL_MAPS = Compatibility(
        name = "Petal Maps",
        packageName = "com.huawei.maps.app",
        apkFileType = ApkFileType.APK_REQUIRED,
        appIconColor = 0xE60012,
        signatures = setOf(
            "ddab0c1db857b116ab1f7a41583f8b452a609cdbd9a2ef088f5592d6fadb5cff"
        ),
        targets = listOf(
            AppTarget(
                version = "4.7.0.322(001)",
                minSdk = 26,
            )
        ),
    )
}
