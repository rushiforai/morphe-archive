package semicoloncolonel.mobilestream.patches.justwatch.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "JustWatch",
        packageName = "com.justwatch.justwatch",
        description = "The JustWatch streaming guide app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFBC500,
        targets = listOf(AppTarget("26.43.10"))
    )
}
