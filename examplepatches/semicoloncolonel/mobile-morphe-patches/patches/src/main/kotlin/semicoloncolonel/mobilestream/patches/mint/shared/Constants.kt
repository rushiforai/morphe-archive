package semicoloncolonel.mobilestream.patches.mint.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Mint Mobile",
        packageName = "com.uvnv.mintsim",
        description = "The Mint Mobile app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x6FBE4A,
        targets = listOf(AppTarget("2.3.40"))
    )
}
