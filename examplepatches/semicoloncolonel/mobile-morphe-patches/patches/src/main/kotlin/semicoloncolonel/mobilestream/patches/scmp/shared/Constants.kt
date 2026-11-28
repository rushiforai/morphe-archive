package semicoloncolonel.mobilestream.patches.scmp.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "South China Morning Post",
        packageName = "com.scmp.newspulse",
        description = "The SCMP news app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x001246,
        targets = listOf(AppTarget("7.2.9", versionCode = 2000394, isExperimental = true))
    )
}
