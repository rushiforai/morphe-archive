package semicoloncolonel.mobilestream.patches.amc.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "AMC+",
        packageName = "com.amcplus.amcfullepisodes",
        description = "The AMC+ phone app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x081424,
        targets = listOf(AppTarget("1.8.62.1"))
    )
}
