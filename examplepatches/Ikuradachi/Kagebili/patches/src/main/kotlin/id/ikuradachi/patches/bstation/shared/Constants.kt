package id.ikuradachi.patches.bstation.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_BSTATION = Compatibility(
        name = "Bstation",
        packageName = "com.bstar.intl",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00A1D6,
        signatures = setOf(
            "ca819a80c96372b8900b1a05a88888f94f9aa4b2da9e483b344dcabd254d40b4",
        ),
        targets = listOf(
            AppTarget(
                version = "3.83.1",
            ),
        ),
    )
}
