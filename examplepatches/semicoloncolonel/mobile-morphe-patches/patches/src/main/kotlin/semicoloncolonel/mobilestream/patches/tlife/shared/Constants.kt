package semicoloncolonel.mobilestream.patches.tlife.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "T-Life",
        packageName = "com.tmobile.tuesdays",
        description = "The T-Mobile T-Life app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE20074,
        targets = listOf(AppTarget("12.3.1"))
    )
}
