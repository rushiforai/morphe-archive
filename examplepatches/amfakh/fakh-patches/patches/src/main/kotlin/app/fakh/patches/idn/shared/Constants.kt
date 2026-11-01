package app.fakh.patches.idn.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_IDN = Compatibility(
        name = "IDN",
        packageName = "com.idntimes.idntimes",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xED1C24,
        targets = listOf(AppTarget(version = "6.69.0", versionCode = 2295)),
    )
}
