package app.xitter.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_X = Compatibility(
        name = "X",
        packageName = "com.twitter.android",
        // APKMirror only has this release as a bundle
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(
            // the version these patches were written against (also Piko's)
            AppTarget(version = "12.19.1-release.0"),
        ),
    )

    const val EXTENSION_PACKAGE = "Lapp/xitter/extension/"
    const val CONFIG_CLASS = "${EXTENSION_PACKAGE}XitterConfig;"
    const val NETWORK_CLASS = "${EXTENSION_PACKAGE}XitterNetwork;"
}
