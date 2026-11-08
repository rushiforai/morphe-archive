package io.github.sazap10.patches.sync.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object SyncCompatibility {
    // Sync shut down in 2023. This is its last release and the APK these patches were written against.
    private const val LAST_RELEASE = "v23.06.30-13:39"

    val SyncForReddit = arrayOf(
        Compatibility(
            name = "Sync for Reddit",
            packageName = "com.laurencedawson.reddit_sync",
            apkFileType = ApkFileType.APK,
            targets = listOf(AppTarget(version = LAST_RELEASE)),
        ),
        Compatibility(
            name = "Sync for Reddit Pro",
            packageName = "com.laurencedawson.reddit_sync.pro",
            apkFileType = ApkFileType.APK,
            // Pro was not available while writing these patches. The fixes match by API calls and
            // package prefixes rather than obfuscated names, so they should apply, but are untested.
            targets = listOf(
                AppTarget(
                    version = null,
                    isExperimental = true,
                    description = "Untested. Developed against the free $LAST_RELEASE APK.",
                ),
            ),
        ),
    )
}
