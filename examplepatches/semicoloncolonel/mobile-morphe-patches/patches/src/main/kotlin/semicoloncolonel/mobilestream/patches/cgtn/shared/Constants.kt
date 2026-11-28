package semicoloncolonel.mobilestream.patches.cgtn.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    // CGTN (China Global Television Network) ships under the package
    // com.imib.cctv. APKPure serves a single universal APK, not a split bundle.
    val COMPATIBILITY = Compatibility(
        name = "CGTN",
        packageName = "com.imib.cctv",
        description = "The CGTN news app.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xCE1126,
        targets = listOf(AppTarget("6.7.0", versionCode = 235, isExperimental = true))
    )
}
