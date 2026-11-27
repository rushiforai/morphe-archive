package app.gogamid.morphed.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_ROSSMANN = Compatibility(
        name = "Rossmann",
        packageName = "de.rossmann.app.android",
        apkFileType = ApkFileType.APKM,
        // Rossmann red.
        appIconColor = 0xD0082C,
        targets = listOf(
            AppTarget(version = "5.11.1"),
        ),
    )
}
