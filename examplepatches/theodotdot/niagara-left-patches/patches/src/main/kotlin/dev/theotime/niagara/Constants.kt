package dev.theotime.niagara

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val NIAGARA = Compatibility(
        name = "Niagara Launcher",
        packageName = "bitpit.launcher",
        apkFileType = ApkFileType.APK,
        // Background color of the Niagara launcher icon.
        appIconColor = 0x03004C,
        targets = listOf(
            // Version the patch was written and verified against.
            AppTarget(version = "1.16.36"),
            // The layout file this patch edits has been stable across releases,
            // so other versions are offered as experimental.
            AppTarget(version = null, isExperimental = true),
        )
    )
}
