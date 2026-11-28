package semicoloncolonel.mobilestream.patches.cnn.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "CNN",
        packageName = "com.cnn.mobile.android.tv",
        description = "The Android TV app. Patch the Android TV build: version code 10894 for 26.10.1.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xCC0000,
        // The phone app is a different package, com.cnn.mobile.android.phone.
        targets = listOf(AppTarget("26.10.1", versionCode = 10894)),
        formFactor = FormFactor.TV,
    )
}
