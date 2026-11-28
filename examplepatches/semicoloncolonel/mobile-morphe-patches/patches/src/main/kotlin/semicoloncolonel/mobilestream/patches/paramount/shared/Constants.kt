package semicoloncolonel.mobilestream.patches.paramount.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Paramount+",
        packageName = "com.cbs.app",
        description = "The phone app, not the Android TV app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0064FF,
        targets = listOf(AppTarget("17.3.0"), devTarget("17.4.1", versionCode = 420001015), AppTarget("17.2.0", versionCode = 420000962))
    )
}
