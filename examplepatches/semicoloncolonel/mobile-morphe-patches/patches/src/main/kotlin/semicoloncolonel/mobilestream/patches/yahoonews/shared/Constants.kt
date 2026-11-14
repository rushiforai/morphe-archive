package semicoloncolonel.mobilestream.patches.yahoonews.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Yahoo News",
        packageName = "com.yahoo.mobile.client.android.yahoo",
        description = "The Yahoo News app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x6001D2,
        targets = listOf(devTarget("100.1.1", versionCode = 2003021875))
    )
}
