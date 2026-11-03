package semicoloncolonel.mobilestream.patches.nfg.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "National Forests & Grasslands",
        packageName = "gov.usda.fs.nfg",
        description = "The U.S. Forest Service app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x2E5C3B,
        targets = listOf(AppTarget("1.3.0"))
    )
}
