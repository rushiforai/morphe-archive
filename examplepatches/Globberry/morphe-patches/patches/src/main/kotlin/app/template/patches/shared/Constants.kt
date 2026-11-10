package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Keyflow",
        packageName = "com.angkin.keyflow",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0xFF0045,
        targets = listOf(
            AppTarget(
                version = "1.5.10"
            )
        )
    )
}
