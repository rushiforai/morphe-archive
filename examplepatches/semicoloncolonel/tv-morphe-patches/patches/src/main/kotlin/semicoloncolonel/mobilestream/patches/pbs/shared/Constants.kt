package semicoloncolonel.mobilestream.patches.pbs.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "PBS",
        packageName = "com.pbs.video",
        description = "The PBS app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x2638C4,
        targets = listOf(AppTarget("5.27.0")),
        formFactor = FormFactor.TV,
    )
}
