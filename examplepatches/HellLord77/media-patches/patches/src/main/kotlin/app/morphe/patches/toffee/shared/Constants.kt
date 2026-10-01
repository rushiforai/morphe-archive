package app.morphe.patches.toffee.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_TOFFEE = Compatibility(
        name = "Toffee",
        packageName = "com.banglalink.toffee",
        apkFileType = ApkFileType.XAPK,
        signatures = setOf("9bcc96b08bb468c0b1be2910198fd5ee3f05f5a2089a65d2be596a96b552f8a6"),
        targets = listOf(
            AppTarget(version = "9.2.6", versionCode = 235, isExperimental = true, minSdk = 25),
        )
    )
}
