package semicoloncolonel.mobilestream.patches.cnn.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

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
        )
    )

    // Faster launch only applies to 26.21.0. 26.23.0 already starts Optimizely
    // from the datafile on the phone, which is what the patch does, so there is
    // nothing left for it to speed up there.
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
