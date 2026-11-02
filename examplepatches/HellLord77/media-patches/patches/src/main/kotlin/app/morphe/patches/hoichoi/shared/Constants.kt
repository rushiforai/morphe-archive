package app.morphe.patches.hoichoi.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

object Constants {
    val COMPATIBILITY_HOICHOI =
        Compatibility(
            name = "Hoichoi",
            packageName = "com.viewlift.hoichoi",
            apkFileType = ApkFileType.XAPK,
            appIconColor = 0xBF0A2B,
            signatures = setOf("904a1603367960be38acacaa193df810c3a9868a485da82186da02def4763717"),
            targets =
                listOf(
                    AppTarget(version = "4.0.12", versionCode = 101419, minSdk = 32),
                    AppTarget(version = "4.0.11", versionCode = 101416, minSdk = 32),
                ),
        )

    val COMPATIBILITY_HOICHOITV =
        Compatibility(
            name = "Hoichoi",
            packageName = "com.viewlift.hoichoi",
            appIconColor = 0xD90B31,
            apkFileType = ApkFileType.XAPK,
            signatures = setOf("904a1603367960be38acacaa193df810c3a9868a485da82186da02def4763717"),
            targets = listOf(AppTarget(version = "5.19.51", versionCode = 101418, minSdk = 24)),
            formFactor = FormFactor.TV,
        )
}
