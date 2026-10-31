package app.syncfixes.patches.syncforreddit.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /** Sync's final release, the same version name for the free and Pro apps. */
    private const val SYNC_VERSION = "v23.06.30-13:39"

    val COMPATIBILITY_SYNC = Compatibility(
        name = "Sync for Reddit",
        packageName = "com.laurencedawson.reddit_sync",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x313235,
        targets = listOf(AppTarget(version = SYNC_VERSION)),
    )

    val COMPATIBILITY_SYNC_PRO = Compatibility(
        name = "Sync for Reddit Pro",
        packageName = "com.laurencedawson.reddit_sync.pro",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x313235,
        targets = listOf(AppTarget(version = SYNC_VERSION)),
    )

    val COMPATIBILITY_SYNC_ALL = arrayOf(COMPATIBILITY_SYNC, COMPATIBILITY_SYNC_PRO)

    const val EXTENSION = "extensions/syncforreddit.mpe"
    const val EXTENSION_PACKAGE = "Lapp/syncfixes/extension/syncforreddit"

    const val NETWORK_RESPONSE = "Lcom/android/volley/NetworkResponse;"
    const val VOLLEY_RESPONSE = "Lcom/android/volley/Response;"
    const val VOLLEY_REQUEST = "Lcom/android/volley/Request;"
}
