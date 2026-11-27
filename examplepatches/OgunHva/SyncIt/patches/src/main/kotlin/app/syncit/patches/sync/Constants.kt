package app.syncit.patches.sync

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val SYNC_FOR_REDDIT = Compatibility(
        name = "Sync for Reddit",
        packageName = "com.laurencedawson.reddit_sync",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFF4500,
        targets = listOf(
            AppTarget(version = "v23.06.30-13:39")
        )
    )
}
