package semicoloncolonel.mobilestream.patches.recgov.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Recreation.gov",
        packageName = "com.bah.r1smobile",
        description = "The Recreation.gov app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x325D5A,
        targets = listOf(AppTarget(version = "2.2.67.1"))
    )
}
