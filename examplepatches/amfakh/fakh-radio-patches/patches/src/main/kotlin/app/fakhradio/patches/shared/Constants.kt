package app.fakhradio.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_RADIO_ID = Compatibility(
        name = "Radio Indonesia",
        packageName = "com.appmind.radios.id",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x1E6FE0,
        targets = listOf(AppTarget(version = "4.2.30")),
    )
}
