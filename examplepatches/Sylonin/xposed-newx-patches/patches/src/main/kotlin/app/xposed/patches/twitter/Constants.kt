package app.xposed.patches.twitter

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val EXTENSION_PATH = "extensions/extension.mpe"
    const val HOOKS_CLASS = "Lapp/xposed/extension/Hooks;"
    const val BRIDGE_CLASS = "Lapp/xposed/extension/ComposeBridge;"

    /** The Compose-based X ("NewX") release this bundle supports. */
    val COMPATIBILITY_NEW_X = Compatibility(
        name = "NewX",
        packageName = "com.twitter.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(
            AppTarget(version = "12.39.0-prod.01"),
        ),
    )
}
