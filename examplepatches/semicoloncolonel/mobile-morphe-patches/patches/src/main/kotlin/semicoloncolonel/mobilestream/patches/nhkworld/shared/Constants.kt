package semicoloncolonel.mobilestream.patches.nhkworld.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    // The phone and Android TV builds share this package. The TV build has
    // other version codes (9.0.1 is 21689010), so the version code keeps it out.
    val COMPATIBILITY = Compatibility(
        name = "NHK WORLD-JAPAN",
        packageName = "jp.or.nhk.nhkworld.tv",
        description = "The phone build.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(AppTarget("9.0.2", versionCode = 21259021, isExperimental = true))
    )
}
