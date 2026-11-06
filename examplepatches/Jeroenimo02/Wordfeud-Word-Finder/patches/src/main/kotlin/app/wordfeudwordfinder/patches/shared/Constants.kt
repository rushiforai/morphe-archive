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
        // Tested versions. On a new Wordfeud release: run tools/check-apk/check_apk.py on its XAPK, test on a device
        // and add it here (see docs/UPDATING.md). Other versions can still be patched as "experimental".
        targets = listOf(
            AppTarget(version = "5.7.1"),
            AppTarget(version = "5.8.0"),
            AppTarget(version = null, isExperimental = true)
        )
    )
}
