package semicoloncolonel.mobilestream.patches.foxlocal.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Fox Local",
        packageName = "com.fox.fts.android",
        description = "The FOX LOCAL app for local Fox stations.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x003366,
        targets = listOf(AppTarget("7.22.0"))
    )
}
