package app.morphe.patches.addatimes.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

object Constants {
    val COMPATIBILITY_ADDATIMES =
        Compatibility(
            name = "Addatimes",
            packageName = "com.addatimes.Addatimes",
            apkFileType = ApkFileType.XAPK,
            appIconColor = 0xF21D2F,
            signatures = setOf("4b287bb24e392f6f4a0a0a2a9ad56a86628ce84fedad92ed3d0421267c15e99c"),
            targets = listOf(AppTarget(version = "5849", versionCode = 51519, minSdk = 24)),
        )

    val COMPATIBILITY_ADDATIMESTV =
        Compatibility(
            name = "AddatimesTV",
            packageName = "com.addatimes.Addatimes",
            appIconColor = 0xF21D2F,
            apkFileType = ApkFileType.XAPK,
            signatures = setOf("4b287bb24e392f6f4a0a0a2a9ad56a86628ce84fedad92ed3d0421267c15e99c"),
            targets = listOf(AppTarget(version = "5782", versionCode = 51442, minSdk = 23)),
            formFactor = FormFactor.TV,
        )
}
