package semicoloncolonel.mobilestream.patches.mint.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Mint Mobile",
        packageName = "com.uvnv.mintsim",
        description = "The Mint Mobile app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x6FBE4A,
        targets = listOf(AppTarget(version = "2.3.42"), devTarget("2.3.43", versionCode = 401))
    )
}
