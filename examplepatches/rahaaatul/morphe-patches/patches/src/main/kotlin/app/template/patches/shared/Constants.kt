package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {

val PRIVACYKIT_COMPATIBILITY = Compatibility(
        name = "Privacy Kit",
        packageName = "com.sal.privacykit",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1A73E8,
        targets = listOf(
            AppTarget(version = "2.0.5"),
            AppTarget(version = "2.2"),
            AppTarget(version = "2.3.1"),
            AppTarget(version = "3.2"),
            AppTarget(version = "3.4"),
            AppTarget(version = "3.5"),
            AppTarget(version = "3.5.1"),
        )
    )

val PROTONVPN_COMPATIBILITY = Compatibility(
        name = "Proton VPN",
        packageName = "ch.protonvpn.android",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x6D4AFF,
        targets = listOf(
            AppTarget(version = "5.19.99.0", versionCode = 605199900),
            AppTarget(version = "5.20.8.0", versionCode = 605200800),
            AppTarget(version = "5.20.21.0", versionCode = 605202100),
            AppTarget(version = "5.20.39.0", versionCode = 605203900),
            AppTarget(version = "5.20.57.0", versionCode = 605205700),
        )
    )
}