package semicoloncolonel.mobilestream.patches.dailywire.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "The Daily Wire",
        packageName = "com.dailywire.thedailywire",
        description = "The DailyWire+ app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xC8102E,
        targets = listOf(AppTarget("3.5.21")),
    )
}
