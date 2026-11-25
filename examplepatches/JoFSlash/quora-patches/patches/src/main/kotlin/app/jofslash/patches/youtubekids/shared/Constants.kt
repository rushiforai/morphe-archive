package app.jofslash.patches.youtubekids.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val PACKAGE_NAME = "com.google.android.apps.youtube.kids"

    /**
     * SHA-1 of YouTube Kids' original signing certificate, the same one as YouTube's.
     * GmsCore support spoofs it to MicroG-RE, and the fetch script checks APKs against it.
     */
    const val SIGNATURE = "24bb24c05e47e0aefa68a58a766179d9b613a600"

    val COMPATIBILITY_YOUTUBE_KIDS = Compatibility(
        name = "YouTube Kids",
        packageName = PACKAGE_NAME,
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF0000,
        targets = listOf(
            AppTarget(version = "11.47.541"),
            AppTarget(version = null, isExperimental = true),
        )
    )
}
