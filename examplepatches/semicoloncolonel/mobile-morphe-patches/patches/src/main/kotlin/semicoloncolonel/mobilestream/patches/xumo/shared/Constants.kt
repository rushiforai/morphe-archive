package semicoloncolonel.mobilestream.patches.xumo.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Xumo Play",
        packageName = "com.xumo.xumo",
        description = "The mobile app (com.xumo.xumo), not the Android TV app (com.xumo.xumo.tv).",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x6C2BD9,
        targets = listOf(AppTarget("4.6.21")),
    )
}
