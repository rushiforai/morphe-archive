package dev.utaa.cutlog.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val SETLOG_COMPATIBILITY = Compatibility(
        name = "setlog",
        packageName = "com.newchat.setlog",
        apkFileType = ApkFileType.APKM_REQUIRED,
        targets = listOf(
            AppTarget(
                version = "1.3",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 76),
            ),
        ),
    )
}
