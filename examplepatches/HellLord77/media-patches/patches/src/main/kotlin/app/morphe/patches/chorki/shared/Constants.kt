package app.morphe.patches.chorki.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CHORKI = Compatibility(
        name = "Chorki",
        packageName = "com.prothomalo",
        apkFileType = ApkFileType.XAPK,
        signatures = setOf("297da502a4aa81631233b95c2b8179b6a4182685a9f373e6515fe842935cf375"),
        targets = listOf(
            AppTarget(version = "2.4.3", versionCode = 311, isExperimental = true, minSdk = 24),
        )
    )
}
