package app.template.patches.shared.misc.pairip

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/** Glass Widgets 1.0.2 only (versionCode 12). Use the full APKS set, not a thin single APK. */
internal val GLASS_WIDGETS = Compatibility(
    name = "Glass Widgets",
    packageName = "com.jndapp.glass.widgets",
    apkFileType = ApkFileType.APKS_REQUIRED,
    appIconColor = 0x00BCD4,
    targets = listOf(
        AppTarget(version = "1.0.2", versionCode = 12, minSdk = 32),
    ),
)
