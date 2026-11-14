package semicoloncolonel.mobilestream.patches.tubi.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Tubi",
        packageName = "com.tubitv",
        description = "The Tubi app, for phones and Android TV. On a TV, patch the Android TV build, " +
            "version 10.44.5001.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE9181C,
        targets = listOf(
            devTarget("10.44.3", versionCode = 1066, description = "Phone build"),
            devTarget("10.44.5001", versionCode = 1067, description = "Android TV build"),
        )
    )
}
