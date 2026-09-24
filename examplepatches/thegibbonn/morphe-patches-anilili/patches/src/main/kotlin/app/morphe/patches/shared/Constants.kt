package app.morphe.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_ANILILI = Compatibility(
        name = "Anilili",
        packageName = "com.miruronative",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x6200EE,
        targets = listOf(
            // "version = null" means the patch works with any app target
            // and is expected to work with all future app targets.
            AppTarget(
                version = null
            )
        )
    )
}
