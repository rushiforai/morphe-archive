package app.morphe.patches.shared.compat

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

internal object AppCompatibilities {

    val GOOGLE_PHOTOS = Compatibility(
        name = "Google Photos",
        packageName = "com.google.android.apps.photos",
        apkFileType = ApkFileType.APK,
        formFactor = FormFactor.MOBILE,
        appIconColor = 0xFC3F3C,
        targets = listOf(
            AppTarget("7.99.0.1007655401"),
        ),
    )
}
