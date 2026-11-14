package semicoloncolonel.mobilestream.patches.washingtonpost.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "The Washington Post",
        packageName = "com.washingtonpost.android",
        description = "The Washington Post news app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x111111,
        targets = listOf(
            devTarget("7.19.0 (3221)", versionCode = 2277),
            AppTarget("7.18.4"),
            AppTarget("7.18.3"),
            AppTarget("7.18.1"),
        )
    )
}
