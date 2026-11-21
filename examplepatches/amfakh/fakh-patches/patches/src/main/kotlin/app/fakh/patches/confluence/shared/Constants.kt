package app.fakh.patches.confluence.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_CONFLUENCE = Compatibility(
        name = "Confluence",
        packageName = "com.atlassian.android.confluence.core",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1868DB,
        targets = listOf(AppTarget(version = "5.26.1.1", versionCode = 5260101)),
    )
}
