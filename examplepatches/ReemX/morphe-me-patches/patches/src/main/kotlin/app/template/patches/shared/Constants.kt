package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    // "Me - Caller ID & Spam Block" (com.nfo.me.android).
    // Distributed as a split bundle (xapk / apkm).
    val COMPATIBILITY_ME = Compatibility(
        name = "Me",
        packageName = "com.nfo.me.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x00A9E0,
        targets = listOf(
            // Developed and confirmed against this exact version.
            AppTarget(
                version = "7.20.6"
            ),
            // Best-effort for future versions (content-based fingerprints
            // where the class name is obfuscated).
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}
