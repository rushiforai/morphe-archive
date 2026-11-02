package app.morphe.patches.platform8tv.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

object Constants {
    val COMPATIBILITY_PLATFORM8TV =
        Compatibility(
            name = "Platform8",
            packageName = "digivive.platform8.androidtv",
            apkFileType = ApkFileType.XAPK,
            appIconColor = 0xF20FB6,
            signatures = setOf("6d5e71644f6841f82d8982c26b7be9b1756f23f16f3974e3c40ed3a182598ef1"),
            targets = listOf(AppTarget(version = "1.1.7", versionCode = 17, minSdk = 24)),
            formFactor = FormFactor.TV,
        )
}
