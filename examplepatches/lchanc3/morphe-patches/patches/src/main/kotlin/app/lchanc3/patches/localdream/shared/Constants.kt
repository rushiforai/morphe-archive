package app.lchanc3.patches.localdream.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {

    /** Extension classes merged into the app by [extensionHookPatch]. */
    const val EXTENSION_BATCH_UPSCALE_CLASS = "Lapp/lchanc3/extension/localdream/BatchUpscalePatch;"
    const val EXTENSION_BATCH_UPSCALE_ACTIVITY = "app.lchanc3.extension.localdream.BatchUpscaleActivity"

    val COMPATIBILITY_LOCAL_DREAM = Compatibility(
        name = "Local Dream",
        packageName = "io.github.xororz.localdream",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1B1B1F,
        targets = listOf(
            // Versions the bundle has been run against with `verifyAgainstApk`.
            // Unlike JPTT the app is obfuscated by R8, which renames and merges
            // classes differently in every build, so nothing is claimed for
            // versions that have not been verified.
            AppTarget(version = "3.0.0-alpha.3"),
        ),
    )
}
