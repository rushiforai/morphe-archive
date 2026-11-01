package semicoloncolonel.mobilestream.patches.nytimes.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "The New York Times",
        packageName = "com.nytimes.android",
        description = "The New York Times news app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(AppTarget("11.98.0"))
    )
}
