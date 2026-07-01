package app.morphe.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_IDOS = Compatibility(
        name = "IDOS",
        packageName = "cz.mafra.jizdnirady",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x9fc5e8, // Icon color in Morphe Manager
        targets = listOf(
            // "version = null" means the patch works with the latest app target
            // and is expected to work with all future app targets
            AppTarget(
                version = "3.8.0"
            ),
        )
    )
}
