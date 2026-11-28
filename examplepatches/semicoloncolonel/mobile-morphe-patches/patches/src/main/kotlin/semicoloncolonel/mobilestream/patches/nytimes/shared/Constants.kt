package semicoloncolonel.mobilestream.patches.nytimes.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "The New York Times",
        packageName = "com.nytimes.android",
        description = "The New York Times news app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(AppTarget("11.99.0", versionCode = 11474926), devTarget("12.0.0", versionCode = 12475013), devTarget("12.1.0", versionCode = 12475161), AppTarget("11.98.2"), AppTarget("11.98.0"))
    )
}
