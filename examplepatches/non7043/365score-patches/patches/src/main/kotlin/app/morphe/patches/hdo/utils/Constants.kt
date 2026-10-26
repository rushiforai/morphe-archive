package app.morphe.patches.hdo.utils

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/** HDO Box application package name. */
const val PACKAGE_HDO = "com.hdoapp.hdo_box"

/**
 * Compatibility declaration for the HDO Box app.
 * Lists the latest verified version (4.4.7) so Morphe Manager
 * recommends the latest target.
 */
val COMPATIBILITY_HDO = arrayOf(
    Compatibility(
        name = "HDO Box",
        packageName = PACKAGE_HDO,
        apkFileType = ApkFileType.APK,
        appIconColor = "#E0B478",
        targets = listOf(
            AppTarget(version = "4.4.7", versionCode = 3042),
        ),
    ),
)
