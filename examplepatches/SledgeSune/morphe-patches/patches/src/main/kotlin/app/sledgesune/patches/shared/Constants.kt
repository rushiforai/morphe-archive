package app.sledgesune.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SYNCME = Compatibility(
        name = "Sync.ME",
        packageName = "com.syncme.syncmeapp",
        // APKMirror ships this app as a split bundle (.apkm).
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x089CFC,
        targets = listOf(
            // Version the patch was developed and verified against.
            AppTarget(version = "4.71.2.1"),
            // The fingerprint avoids obfuscated names, so newer versions will likely work too.
            AppTarget(version = null, isExperimental = true),
        )
    )

    val COMPATIBILITY_WAZE = Compatibility(
        name = "Waze",
        packageName = "com.waze",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x33CCFF,
        targets = listOf(
            // Version the patch was developed against.
            AppTarget(version = "5.27.4.900"),
            AppTarget(version = null, isExperimental = true),
        )
    )
}
