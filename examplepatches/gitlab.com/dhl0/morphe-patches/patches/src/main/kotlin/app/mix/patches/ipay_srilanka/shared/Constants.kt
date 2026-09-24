package app.mix.patches.ipay_srilanka.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_IPAY_SRILANKA = Compatibility(
        name = "iPay Sri Lanka",
        packageName = "com.ipay.mobile",
        apkFileType = ApkFileType.APK,
        targets = listOf(
            AppTarget(
                version = "4.17.2",
            ),
            AppTarget(
                version = "4.17.0",
            ),
        ),
    )
}
