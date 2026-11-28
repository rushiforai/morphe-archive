package semicoloncolonel.mobilestream.patches.foxone.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Fox One",
        packageName = "com.fox.foxone",
        description = "The Fox One phone app. Needs the Pairip license-check patch to run once re-signed.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x030B1A,
        targets = listOf(
            AppTarget(version = "1.25.1", description = "Phone build"),
            devTarget("1.26.0", versionCode = 26110404, description = "Phone build"),
            AppTarget("1.24.0", versionCode = 26101302, description = "Phone build"),
        )
    )
}
