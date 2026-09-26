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
        targets = listOf(AppTarget(version = "2.0.5"))
    )
}