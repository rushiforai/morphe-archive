package app.stylus.patches.bitwarden.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_BITWARDEN = Compatibility(
        name = "Bitwarden",
        packageName = "com.x8bit.bitwarden",
        apkFileType = ApkFileType.APK_REQUIRED,
        appIconColor = 0x175DDC,
        signatures = setOf(
            "24e06c04c208048f19f1c993b4dda4430ea8b06db8375ea0e37b834696b9ac3a"
        ),
        targets = listOf(
            AppTarget(
                version = "2026.6.1",
                minSdk = 29,
            ),
        ),
    )
}