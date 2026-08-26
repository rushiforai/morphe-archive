package morningentree.morphe.patches.obdandroid.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY = Compatibility(
        name = "OBD Android",
        packageName = "ai.metaverselabs.obdandroid",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0xE53935,
        targets = listOf(
            AppTarget(version = "4.9", versionCode = 133),
        ),
    )
}
