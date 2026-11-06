package semicoloncolonel.mobilestream.patches.substack.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Substack",
        packageName = "com.substack.app",
        description = "The Substack reader app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF6719,
        targets = listOf(AppTarget("3.12.0")),
    )
}
