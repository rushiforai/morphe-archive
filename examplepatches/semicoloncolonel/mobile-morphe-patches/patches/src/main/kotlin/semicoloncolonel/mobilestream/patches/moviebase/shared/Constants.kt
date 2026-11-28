package semicoloncolonel.mobilestream.patches.moviebase.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    const val PACKAGE_NAME = "com.moviebase"

    val COMPATIBILITY = Compatibility(
        name = "Moviebase",
        packageName = PACKAGE_NAME,
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1B1D23,
        targets = listOf(AppTarget("7.7.1"), devTarget("7.7.2", versionCode = 70702), AppTarget("7.7.0"))
    )
}
