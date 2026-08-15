package app.aapam.patches.zee5.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_ZEE5_TV = Compatibility(
        packageName = "com.graymatrix.did",
        name = "ZEE5 Android TV",
        description = "ZEE5: Movies, TV Shows, Series (Android TV)",
        apkFileType = ApkFileType.APKM_REQUIRED,
        appIconColor = 0x1c1c28,
        signatures = setOf(
            "17df0bbfa43f2a1d057c0a0c96e11b9c20c595f43873388b2719eb0a7e23e0cb"
        ),
        targets = listOf(
            AppTarget(
                version = "5.83.2",
                minSdk = 23,
            ),
        ),
    )
}
