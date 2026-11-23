package app.fakh.patches.fomo.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_FOMO = Compatibility(
        name = "FOMO Indonesia",
        packageName = "id.anon.android",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x8A3BF5,
        targets = listOf(AppTarget(version = "9.0.64", versionCode = 340)),
    )
}
