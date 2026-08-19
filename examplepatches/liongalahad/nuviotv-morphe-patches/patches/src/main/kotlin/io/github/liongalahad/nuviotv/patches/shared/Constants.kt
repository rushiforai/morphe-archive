package io.github.liongalahad.nuviotv.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    const val PACKAGE_NAME = "com.nuvio.tv"
    const val TARGET_VERSION = "0.8.6-beta"

    val NUVIO_COMPATIBILITY = Compatibility(
        name = "NuvioTV",
        packageName = PACKAGE_NAME,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x111827,
        targets = listOf(AppTarget(version = TARGET_VERSION))
    )
}
