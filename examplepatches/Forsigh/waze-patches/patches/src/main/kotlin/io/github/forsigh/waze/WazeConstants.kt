package io.github.forsigh.waze

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * App compatibility declarations for Waze (com.waze).
 *
 * The confirmed target is the exact build these patches were developed against,
 * plus an experimental "any version" target so the patches can still be attempted on
 * newer builds (fingerprints may or may not survive an app update).
 */
object WazeConstants {
    val COMPATIBILITY_WAZE = Compatibility(
        name = "Waze",
        packageName = "com.waze",
        // Waze is distributed on APKMirror as an APKM bundle. Kept in sync so Morphe Manager
        // redirects the user to the correct download page.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x33CCFF,
        // One version per release, on purpose. A bundle is verified against exactly one Waze
        // build, and the Manager's version column is the only thing that stops someone pointing a
        // new bundle at an old APK. 0.30.64 is the stable for 5.27.90.900 (versionCode 1030751):
        // 36/36 rows apply, 0 broken branch targets, 0 out-of-frame registers.
        // When a new Waze version is verified, cut a new bundle and move this line with it - never
        // widen the list to cover builds nobody tested.
        targets = listOf(
            AppTarget(version = "5.28.4.900"),
        ),
    )
}
