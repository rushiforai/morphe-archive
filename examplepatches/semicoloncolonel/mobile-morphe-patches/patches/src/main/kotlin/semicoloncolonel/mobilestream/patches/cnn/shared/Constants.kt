package semicoloncolonel.mobilestream.patches.cnn.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "CNN",
        packageName = "com.cnn.mobile.android.phone",
        description = "The CNN app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xCC0000,
        // 26.23.0 moved the ad "dfp" gate, so Skip ads handles both builds.
        // 26.21.0 is kept so people on the older build still get patches.
        targets = listOf(
            AppTarget("26.21.0"),
            AppTarget("26.23.0"),
            devTarget("26.24.0", versionCode = 20579381),
        )
    )

    // Faster launch only applies to 26.21.0. 26.23.0 and 26.24.0 already start
    // Optimizely from the datafile on the phone (26.24.0 picks the mode through
    // a new InitMode and no longer makes the async initialize call the patch
    // redirects), which is what the patch does, so there is nothing left for it
    // to speed up there.
    val FASTER_LAUNCH_COMPATIBILITY = Compatibility(
        name = "CNN",
        packageName = "com.cnn.mobile.android.phone",
        description = "The CNN app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xCC0000,
        targets = listOf(
            AppTarget("26.21.0"),
        )
    )
}
