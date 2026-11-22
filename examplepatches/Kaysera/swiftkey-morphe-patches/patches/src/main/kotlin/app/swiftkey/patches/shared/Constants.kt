package app.swiftkey.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_SWIFTKEY = Compatibility(
        name = "Microsoft SwiftKey",
        packageName = "com.touchtype.swiftkey",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x0078D4,
        targets = listOf(
            // These builds were analysed. The patch relies on SwiftKey's obfuscated
            // keyboard layout code, which changes between builds.
            AppTarget(version = "9.13.20.4"),
            AppTarget(version = "9.13.19.3"),
        ),
    )
}
