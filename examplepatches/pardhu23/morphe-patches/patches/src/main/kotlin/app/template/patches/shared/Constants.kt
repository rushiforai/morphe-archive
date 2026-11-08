package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_WAY2NEWS = Compatibility(
        name = "Way2News",
        packageName = "sun.way2sms.hyd.com",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xE53935,
        targets = listOf(
            // Confirmed working.
            AppTarget(
                version = "9.58"
            ),
            // Any other version: untested, may fail if a fingerprint no longer matches.
            AppTarget(
                version = null,
                isExperimental = true
            )
        )
    )
}
