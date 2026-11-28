package semicoloncolonel.mobilestream.patches.substack.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Substack",
        packageName = "com.substack.app",
        description = "The Substack reader app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF6719,
        targets = listOf(devTarget("3.14.0", versionCode = 115818), devTarget("3.15.0", versionCode = 116490), devTarget("3.15.1", versionCode = 116715), AppTarget("3.13.1"), AppTarget("3.12.0")),
    )
}
