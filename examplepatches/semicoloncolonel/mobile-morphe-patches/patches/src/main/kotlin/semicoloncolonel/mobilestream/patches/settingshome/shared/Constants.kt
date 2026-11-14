package semicoloncolonel.mobilestream.patches.settingshome.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Settings Home",
        packageName = "com.eet.settings.launcher",
        description = "The Settings Home launcher and quick-settings replacement.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x2D64BC,
        targets = listOf(AppTarget("1.6.4", versionCode = 100604)),
    )
}
