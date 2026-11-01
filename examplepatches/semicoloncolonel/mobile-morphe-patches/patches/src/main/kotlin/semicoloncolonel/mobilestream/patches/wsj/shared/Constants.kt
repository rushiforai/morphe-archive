package semicoloncolonel.mobilestream.patches.wsj.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "The Wall Street Journal",
        packageName = "wsj.reader_sp",
        description = "The Wall Street Journal news app.",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x111111,
        targets = listOf(AppTarget("15.12.0.42675"))
    )
}
