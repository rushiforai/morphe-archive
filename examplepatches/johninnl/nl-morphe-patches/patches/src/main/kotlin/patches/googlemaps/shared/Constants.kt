package org.ungoogled.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    /** Standalone universal APK reviewed against the exact R8 symbols and resources. */
    val COMPATIBILITY_MAPS = Compatibility(
        name = "Google Maps",
        packageName = "com.google.android.apps.maps",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFFFFFF,
        targets = listOf(AppTarget(
            version = "26.43.05.1002020710",
            versionCodes = SupportedAbi.entries.associateWith { 1068844719 },
            minSdk = 29,
        )),
    )
}
