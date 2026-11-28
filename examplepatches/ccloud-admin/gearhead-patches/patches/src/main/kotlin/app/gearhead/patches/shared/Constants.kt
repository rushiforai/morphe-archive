package app.gearhead.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val ANDROID_AUTO_PACKAGE = "com.google.android.projection.gearhead"

    val COMPATIBILITY_ANDROID_AUTO = Compatibility(
        name = "Android Auto",
        packageName = ANDROID_AUTO_PACKAGE,
        // Android Auto is published on APKMirror as plain APK variants (per ABI).
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4285F4,
        targets = listOf(
            // The installer patch does not use fingerprints. It rewrites every call to the
            // Android installer-source APIs, so it is expected to work on any version.
            //
            // Marked experimental until it has been confirmed on a real head unit.
            // Once confirmed, add the tested version here, for example:
            // AppTarget(version = "17.4.663004-release"),
            AppTarget(
                version = null,
                isExperimental = true,
            ),
        ),
    )
}
