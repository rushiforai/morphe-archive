package app.idm.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_1DM = Compatibility(
        name = "1DM",
        packageName = "idm.internet.download.manager",
        apkFileType = ApkFileType.APKM,
        targets = listOf(
            AppTarget(version = "18.2", versionCode = 30249)
        )
    )
}
