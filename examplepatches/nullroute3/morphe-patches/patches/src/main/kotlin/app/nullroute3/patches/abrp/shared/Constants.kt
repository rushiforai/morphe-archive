package app.nullroute3.patches.abrp.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_ABRP = Compatibility(
        name = "A Better Route Planner",
        packageName = "com.iternio.abrpapp",
        apkFileType = ApkFileType.APKS,
        targets = listOf(
            AppTarget(version = "7.1.13"),
        ),
    )
}
