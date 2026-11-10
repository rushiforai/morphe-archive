package app.morphe.patches.merriamwebster

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_MERRIAM_WEBSTER = Compatibility(
        name = "Merriam-Webster",
        packageName = "com.merriamwebster",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xD51921,
        targets = listOf(
            AppTarget(version = "5.6.3"),
        )
    )
}
