package semicoloncolonel.mobilestream.patches.fawesome.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Fawesome",
        packageName = "com.future.moviesByFawesomeAndroidTV",
        description = "The Fawesome app for phones and tablets.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(AppTarget("20.8", versionCode = 200, description = "Phone build"))
    )
}
