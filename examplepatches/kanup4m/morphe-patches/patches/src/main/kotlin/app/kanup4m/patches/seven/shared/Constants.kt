package app.kanup4m.patches.seven.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SEVEN = Compatibility(
        name = "Seven",
        packageName = "se.perigee.android.seven",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x6B21A8,
        targets = listOf(
            AppTarget(version = "9.25.15-handheld")
        )
    )
}
