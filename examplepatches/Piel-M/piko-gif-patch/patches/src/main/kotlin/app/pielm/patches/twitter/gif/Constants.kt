package app.pielm.patches.twitter.gif

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_X = Compatibility(
        name = "Twitter",
        packageName = "com.twitter.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(
            AppTarget(
                version = null,
                isExperimental = true,
            ),
            AppTarget(
                version = "12.19.1-release.0",
            ),
        ),
    )

    const val GIF_HOOKS_DESCRIPTOR = "Lapp/pielm/extension/twitter/gif/GifPatchHooks;"
}
