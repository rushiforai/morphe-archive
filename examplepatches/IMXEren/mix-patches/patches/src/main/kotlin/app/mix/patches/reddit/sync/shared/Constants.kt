package app.mix.patches.reddit.sync.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    val COMPATIBILITY_SYNC = Compatibility(
        name = "Sync for Reddit",
        packageName = "com.laurencedawson.reddit_sync",
        apkFileType = ApkFileType.APK,
        targets = listOf(
            AppTarget(
                version = "v23.06.30-13:39",
            )
        )
    )
}
