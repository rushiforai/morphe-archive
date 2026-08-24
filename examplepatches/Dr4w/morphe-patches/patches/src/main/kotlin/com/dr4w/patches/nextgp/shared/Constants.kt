package com.dr4w.patches.nextgp.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_NEXTGP = Compatibility(
        name = "NextGP | Calendar F1 MotoGP",
        packageName = "com.jscti.nextgp_f1motogp",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xE10600,
        targets = listOf(
            AppTarget(version = "9.0")
        )
    )
}