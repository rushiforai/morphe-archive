package app.morphe.patches.cinematic.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CINEMATIC =
        Compatibility(
            name = "Cinematic",
            packageName = "net.live.ent.cinematic",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xF29422,
            signatures = setOf("b27cc269028dc4f962cb68a1d60bcc727e2e04fcc16b3f115752bcaf675ae7b4"),
            targets =
                listOf(
                    AppTarget(version = "4.23", versionCode = 54, minSdk = 24),
                    AppTarget(version = "4.22", versionCode = 53, minSdk = 24),
                ),
        )
}
