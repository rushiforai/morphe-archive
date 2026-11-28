package semicoloncolonel.mobilestream.patches.homedepot.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "The Home Depot",
        packageName = "com.thehomedepot",
        description = "The Home Depot shopping app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xF96302,
        targets = listOf(AppTarget("8.2.6"), devTarget("8.2.8", versionCode = 787), AppTarget("8.2.5"))
    )
}
