package app.hh.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_PUNGE = Compatibility(
        name = "Punge",
        packageName = "com.markatlarge.scrub",
        apkFileType = ApkFileType.APKS,
        // Magenta/pink field from the Punge logo.
        appIconColor = 0xD469A5,
        targets = listOf(
            AppTarget(
                version = "3.1.4",
            ),
            AppTarget(
                version = null,
                isExperimental = true,
            ),
        ),
    )
}
