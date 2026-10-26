package app.xposed.patches.twitter

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val EXTENSION_PATH = "extensions/extension.mpe"
    const val HOOKS_CLASS = "Lapp/xposed/extension/Hooks;"

    val COMPATIBILITY_X = Compatibility(
        name = "Twitter",
        packageName = "com.twitter.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(
            AppTarget(version = "12.19.1-release.0"),
        ),
    )
}
