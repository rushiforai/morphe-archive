package app.diskwala.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val COMPATIBILITY_DISKWALA = Compatibility(
        name = "DiskWala",
        packageName = "com.diskwalaapp",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFF1A73E8L.toInt() and 0xFFFFFF,
        targets = listOf(
            AppTarget(
                version = "27.3",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 367),
                isExperimental = true
            ),
            // Allow any future version experimentally - patches are string/opcode based and should survive
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}
