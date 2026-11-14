package semicoloncolonel.mobilestream.patches.cvs.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "CVS",
        packageName = "com.cvs.launchers.cvs",
        description = "The CVS Pharmacy app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xCC0000,
        targets = listOf(AppTarget(version = "26.11.30", isExperimental = true), AppTarget("26.10.50"))
    )
}
