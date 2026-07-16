package app.jouss.patches.morolingo.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MOROLINGO = Compatibility(
        name = "Morolingo",
        packageName = "com.vivredarija",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x1E88E5,
        targets = listOf(
            AppTarget(version = "2.6.4")
        )
    )
}
