package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SAMSUNG_NOTES = Compatibility(
        name = "Samsung Notes",
        packageName = "com.samsung.android.app.notes",
        // Samsung Notes is usually distributed as a single APK; change to APKM if
        // the copy you patch is a split bundle.
        apkFileType = ApkFileType.APK,
        appIconColor = 0xF5A623,
        targets = listOf(
            // The patch only touches the Application class named in the manifest and a
            // framework API, so it is not tied to one app version.
            AppTarget(
                version = null,
                isExperimental = true,
            ),
        ),
    )
}
