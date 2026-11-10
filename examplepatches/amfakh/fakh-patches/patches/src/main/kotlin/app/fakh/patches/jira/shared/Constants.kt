package app.fakh.patches.jira.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_JIRA = Compatibility(
        name = "Jira",
        packageName = "com.atlassian.android.jira.core",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1868DB,
        targets = listOf(AppTarget(version = "2026.21.2", versionCode = 202616072)),
    )
}
