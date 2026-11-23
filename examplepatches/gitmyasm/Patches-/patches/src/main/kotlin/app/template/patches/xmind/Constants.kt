package app.template.patches.xmind

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Xmind target used while developing the premium patches.
 *
 * The original file from Google Play is an .apks bundle (base.apk + splits),
 * so the file type must be APKS or Morphe Manager will offer the wrong file.
 */
val COMPATIBILITY_XMIND = Compatibility(
    name = "Xmind",
    packageName = "net.xmind.doughnut",
    apkFileType = ApkFileType.APKS,
    appIconColor = 0x1A73E8,
    targets = listOf(
        // Confirmed working against this exact build.
        AppTarget(version = "27.01.05467"),
    ),
)
