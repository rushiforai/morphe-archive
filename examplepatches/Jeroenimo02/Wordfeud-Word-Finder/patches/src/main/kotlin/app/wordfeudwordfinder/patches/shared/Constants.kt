package app.wordfeudwordfinder.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_WORDFEUD = Compatibility(
        name = "Wordfeud",
        packageName = "com.hbwares.wordfeud.free",
        // V11: the APK comes from APKPure, which serves split builds as XAPK.
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x1B5E9E,
        targets = listOf(
            AppTarget(version = "5.7.1"),
            AppTarget(version = null, isExperimental = true)
        )
    )
}
