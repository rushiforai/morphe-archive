package app.miraie.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MIRAIE = Compatibility(
        name = "MirAIe",
        packageName = "com.panasonic.in.miraie",
        apkFileType = ApkFileType.XAPK,
        targets = listOf(AppTarget(version = "01.4.32", isExperimental = true),
        AppTarget(version = "01.4.30"))
    )
}
