package app.drbushytop.patches.relay

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Same targets as Patcheddit's Relay patches, so both bundles patch the same APK.
 */
internal object Relay {
    const val EXTENSION = "extensions/drbushytop-relay.mpe"

    val compatibility = arrayOf(
        Compatibility(
            name = "Relay for Reddit",
            packageName = "free.reddit.news",
            apkFileType = ApkFileType.APK,
            appIconColor = 0x2196F3,
            targets = listOf(AppTarget(version = "10.2.40")),
        ),
        Compatibility(
            name = "Relay for Reddit Pro",
            packageName = "reddit.news",
            apkFileType = ApkFileType.APK,
            appIconColor = 0x2196F3,
            targets = listOf(AppTarget(version = "10.2.40")),
        ),
    )
}
