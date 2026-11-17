package app.zdrgon.patches.moises.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_MOISES = Compatibility(
        name = "Moises",
        packageName = "ai.moises",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x7B61FF,
        targets = listOf(
            AppTarget(version = "2.141.0")
        )
    )
}
