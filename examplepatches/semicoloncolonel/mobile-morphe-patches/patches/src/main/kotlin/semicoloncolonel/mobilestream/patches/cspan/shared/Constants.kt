package semicoloncolonel.mobilestream.patches.cspan.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "C-SPAN Now",
        packageName = "org.cspan.app",
        description = "The C-SPAN Now app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x004B87,
        targets = listOf(AppTarget("1.25.0")),
    )
}
