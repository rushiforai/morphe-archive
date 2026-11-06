package app.zdrgon.patches.notes.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    // Notes by iNotes (com.inotesapp.inotes) — Flutter title; ads via
    // Google Mobile Ads (AdMob) only. Premium itself is gated in Dart
    // (RevenueCat) and is NOT touched by this bundle's Notes patch —
    // see the Remove ads patch for what it does and does not do.

    val COMPATIBILITY_NOTES = Compatibility(
        name = "Notes",
        packageName = "com.inotesapp.inotes",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFFB300,
        targets = listOf(
            AppTarget(version = "2.2.2")
        )
    )
}
