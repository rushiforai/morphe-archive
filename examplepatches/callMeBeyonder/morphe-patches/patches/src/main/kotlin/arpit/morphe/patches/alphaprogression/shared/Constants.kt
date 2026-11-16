package arpit.morphe.patches.alphaprogression.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_ALPHA_PROGRESSION = Compatibility(
        name = "Alpha Progression",
        packageName = "com.alphaprogression.alphaprogression",
        // APKMirror ships the app as an APKM split container (base APK plus ABI,
        // density and locale splits). The base manifest declares
        // `requiredSplitTypes="base__abi,base__density"` and
        // `com.android.vending.splits.required=true`, so a bare base APK is neither
        // installable nor runnable on its own.
        apkFileType = ApkFileType.APKM_REQUIRED,
        // Brand blue of the web UI (#0065B3, used throughout index-D05S4ybz.css).
        appIconColor = 0x0065B3,
        targets = listOf(
            AppTarget(
                // Version as reported by the APKM info.json (versionCode 705).
                version = "7.7.1",
                versionCode = 705,
            )
        )
    )
}
