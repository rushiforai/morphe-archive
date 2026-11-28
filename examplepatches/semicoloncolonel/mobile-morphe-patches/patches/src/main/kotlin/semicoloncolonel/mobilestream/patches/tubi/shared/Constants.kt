package semicoloncolonel.mobilestream.patches.tubi.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Tubi",
        packageName = "com.tubitv",
        description = "The Tubi app for phones.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE9181C,
        targets = listOf(
            AppTarget("10.44.3", versionCode = 1066, description = "Phone build"),
            devTarget("10.46.0", versionCode = 1068, description = "Phone build"),
            AppTarget("10.44.1", versionCode = 1063, description = "Phone build"),
        )
    )
}
