package com.ameen.morphe.patches.photogrid.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Compatibility descriptor for PhotoGrid.
     * version = null means this patch targets the latest version and is
     * expected to remain compatible with future releases (best-effort).
     */
    val PHOTOGRID = Compatibility(
        name = "PhotoGrid",
        packageName = "com.roidapp.photogrid",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x4A90D9, // PhotoGrid blue
        targets = listOf(
            AppTarget(version = "8.81")
        )
    )
}
