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
        // 26.23.0 rewrote the Optimizely startup and moved the ad "dfp" gate, so
        // the Faster launch and Skip ads patches handle both builds. 26.21.0 is
        // kept so people on the older build still get patches.
        targets = listOf(
            AppTarget("26.21.0"),
            devTarget("26.23.0"),
        )
    )
}
