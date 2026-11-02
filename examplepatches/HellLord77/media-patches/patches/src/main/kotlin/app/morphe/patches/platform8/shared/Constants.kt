package app.morphe.patches.platform8.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_PLATFORM8 =
        Compatibility(
            name = "Platform8",
            packageName = "com.digivive.platform8",
            apkFileType = ApkFileType.XAPK,
            appIconColor = 0xF21B54,
            signatures = setOf("25533fece94a83e9b22c01555bb7a17fc57c18cba9f8fb0d71b5a40d59c33479"),
            targets = listOf(AppTarget(version = "9.66.23", versionCode = 96623, minSdk = 24)),
        )
}
