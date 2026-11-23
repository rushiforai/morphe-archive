package org.ungoogled.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    /**
     * Patches whose 26.47 port is not finished yet: they keep the reviewed
     * 26.44 target so a 26.47 install only receives the controls that were
     * re-verified against that build.
     */
    val COMPATIBILITY_MAPS_2644 = Compatibility(
        name = "Google Maps",
        packageName = "com.google.android.apps.maps",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFFFFFF,
        targets = listOf(AppTarget(
            version = "26.44.06.1006895251",
            versionCodes = SupportedAbi.entries.associateWith { 1068856906 },
            minSdk = 29,
        )),
    )

    /** Standalone universal APK reviewed against the exact R8 symbols and resources. */
    val COMPATIBILITY_MAPS = Compatibility(
        name = "Google Maps",
        packageName = "com.google.android.apps.maps",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFFFFFF,
        targets = listOf(
            AppTarget(
                version = "26.44.06.1006895251",
                versionCodes = SupportedAbi.entries.associateWith { 1068856906 },
                minSdk = 29,
            ),
            AppTarget(
                version = "26.47.00.1022347503",
                versionCodes = SupportedAbi.entries.associateWith { 1068892333 },
                minSdk = 29,
            ),
        ),
    )
}
