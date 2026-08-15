/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.webetu.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object WebetuConstants {
    val COMPATIBILITY_WEBETU = Compatibility(
        name = "Webetu",
        packageName = "app.progres.webetu",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x023C69,
        signatures = null,
        targets = listOf(
            AppTarget(version = "2.4.0"),
        ),
    )
}
