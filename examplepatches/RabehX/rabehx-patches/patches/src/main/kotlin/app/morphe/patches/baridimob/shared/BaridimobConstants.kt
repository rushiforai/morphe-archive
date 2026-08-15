/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.baridimob.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object BaridimobConstants {
    val COMPATIBILITY_BARIDIMOB = Compatibility(
        name = "BaridiMob",
        packageName = "ru.bpc.mobilebank.bpc",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x007A33,
        signatures = null,
        targets = listOf(
            AppTarget(version = "1.29.1"),
        ),
    )
}
