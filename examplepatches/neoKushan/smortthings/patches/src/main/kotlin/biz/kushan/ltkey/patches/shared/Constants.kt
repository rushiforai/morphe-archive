package biz.kushan.ltkey.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Samsung SmartThings (OneConnect). Pinned to the single build this PoC was developed and
     * tested against. No `null`/experimental target — the extraction chain and fingerprints are
     * version-specific, so we only advertise the confirmed version.
     */
    val COMPATIBILITY_SMARTTHINGS = Compatibility(
        name = "SmartThings",
        packageName = "com.samsung.android.oneconnect",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1C8CF5, // SmartThings blue
        targets = listOf(
            AppTarget(
                version = "1.8.52.23",
            ),
        ),
    )
}
