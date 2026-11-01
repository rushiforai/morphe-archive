package semicoloncolonel.mobilestream.patches.paramount.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Paramount+",
        packageName = "com.cbs.app",
        description = "The phone app, not the Android TV app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0064FF,
        targets = listOf(AppTarget("17.2.0"))
    )
}
