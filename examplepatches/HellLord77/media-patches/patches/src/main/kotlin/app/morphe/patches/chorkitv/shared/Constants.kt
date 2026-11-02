package app.morphe.patches.chorkitv.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

object Constants {
    val COMPATIBILITY_CHORKITV =
        Compatibility(
            name = "Chorki TV",
            packageName = "com.prothomalo.chorki",
            apkFileType = ApkFileType.XAPK,
            appIconColor = 0xF22E62,
            signatures = setOf("7b250394de1f89c1f3bcb5b94a3d8cbf6a0139d10428fc3d1f99c9e9bf3812a7"),
            targets =
                listOf(
                    AppTarget(version = "2.0.90", versionCode = 290, minSdk = 24),
                    AppTarget(version = "2.0.88", versionCode = 288, minSdk = 24),
                ),
            formFactor = FormFactor.TV,
        )
}
