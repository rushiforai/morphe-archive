package semicoloncolonel.mobilestream.patches.libby.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Libby",
        packageName = "com.overdrive.mobile.android.libby",
        description = "OverDrive's Libby library e-book and audiobook app.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xA61C49,
        // Experimental until an on-device launch is confirmed. Libby is a thin
        // WebView shell for libbyapp.com; the patchable surface is resources.
        targets = listOf(AppTarget("9.6.0", versionCode = 960000, isExperimental = true)),
    )
}
