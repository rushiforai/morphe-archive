package semicoloncolonel.mobilestream.patches.tubi.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Tubi",
        packageName = "com.tubitv",
        description = "The Tubi app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE9181C,
        targets = listOf(
            AppTarget("10.44.5001", versionCode = 1067),
            devTarget("10.46.5000", versionCode = 1069),
        ),
        formFactor = FormFactor.TV,
    )
}
