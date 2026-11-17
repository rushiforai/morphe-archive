package semicoloncolonel.mobilestream.patches.foxone.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.splitByBundle

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Fox One",
        packageName = "com.fox.foxone",
        description = "The Fox One app, for phones (1.25.1 and 1.24.0) and Android TV (1.20.0). " +
            "Needs the Pairip license-check patch to run once re-signed.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x030B1A,
        targets = listOf(
            AppTarget(version = "1.25.1", description = "Phone build"),
            AppTarget("1.24.0", versionCode = 26101302, description = "Phone build"),
            AppTarget("1.20.0", description = "Android TV build"),
        )
    ).splitByBundle(
        phoneDescription = "The Fox One phone app. Needs the Pairip license-check patch to run once re-signed.",
        tvDescription = "The Fox One app. Needs the Pairip license-check patch to run once re-signed.",
    )
}
