package semicoloncolonel.mobilestream.patches.pbs.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.splitByBundle

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "PBS",
        packageName = "com.pbs.video",
        description = "The PBS app. One build serves phones and Android TV.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x2638C4,
        targets = listOf(AppTarget("5.27.0"))
    ).splitByBundle(
        phoneDescription = "The PBS app for phones.",
        tvDescription = "The PBS app.",
    )
}
