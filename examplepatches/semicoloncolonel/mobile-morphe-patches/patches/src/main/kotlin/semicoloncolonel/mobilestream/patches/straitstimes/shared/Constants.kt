package semicoloncolonel.mobilestream.patches.straitstimes.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "The Straits Times",
        packageName = "com.buuuk.st",
        description = "The Straits Times news app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x002F5F,
        targets = listOf(AppTarget("8.5.20.PO(ST)REL", versionCode = 22471, isExperimental = true))
    )
}
