package app.morphe.patches.score365.utils

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/** 365Score application package name. */
const val PACKAGE_365SCORE = "com.scores365"

/**
 * Compatibility declaration for the 365Scores app.
 * Lists the latest verified version (14.9.7) so Morphe Manager
 * recommends the latest target.
 */
val COMPATIBILITY_365SCORE = arrayOf(
    Compatibility(
        name = "365Scores",
        packageName = PACKAGE_365SCORE,
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFFC107,
        targets = listOf(
            AppTarget(version = "14.9.7", versionCode = 1497),
        ),
    ),
)
