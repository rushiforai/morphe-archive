package app.morphe.patches.colonyflow

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_COLONY_FLOW =
        Compatibility(
            name = "Colony Flow",
            packageName = "com.abi.colony.flow",
            apkFileType = ApkFileType.APK,
            targets =
                listOf(
                    AppTarget(
                        version = "1.0.76",
                    ),
                    AppTarget(
                        version = "1.0.78",
                    ),
                ),
        )
}
