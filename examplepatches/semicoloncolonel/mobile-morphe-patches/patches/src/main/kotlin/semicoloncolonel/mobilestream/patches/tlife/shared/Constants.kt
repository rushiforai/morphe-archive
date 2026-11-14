package semicoloncolonel.mobilestream.patches.tlife.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "T-Life",
        packageName = "com.tmobile.tuesdays",
        description = "The T-Mobile T-Life app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE20074,
        targets = listOf(
            devTarget("12.4.0", versionCode = 162734),
            AppTarget("12.3.1"),
        )
    )
}
