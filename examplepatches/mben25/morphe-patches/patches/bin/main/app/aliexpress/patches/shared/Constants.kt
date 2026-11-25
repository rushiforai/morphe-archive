package app.aliexpress.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_ALIEXPRESS = Compatibility(
        name = "AliExpress", // App name as it appears in the Android launcher.
        packageName = "com.alibaba.aliexpresshd",
        // Play ships split APKs; the APKMirror .apkm bundle is what gets patched (merged).
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF4747, // AliExpress red.
        targets = listOf(
            // Verified against the APKMirror 8.162.8 bundle (versionCode 80005877).
            AppTarget(
                version = "8.162.8"
            ),
        )
    )
}
