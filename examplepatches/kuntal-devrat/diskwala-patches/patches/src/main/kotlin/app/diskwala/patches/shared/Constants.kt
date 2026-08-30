package app.diskwala.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val COMPATIBILITY_DISKWALA = Compatibility(
        name = "DiskWala",
        packageName = "com.diskwalaapp",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF1A73E8L.toInt() and 0xFFFFFF,
        targets = listOf(
            AppTarget(
                version = "24.5",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 334)
            ),
            // Allow any future version experimentally - patches are string/opcode based and should survive
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}
