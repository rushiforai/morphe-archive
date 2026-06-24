package app.kareem.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_INSTAGRAM =
        Compatibility(
            name = "Instagram",
            packageName = "com.instagram.android",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xFC483C,
            targets =
                listOf(
                    AppTarget(
                        version = "424.0.0.49.64",
                        description = "Instagram Stable version (all archs)",
                    ),
                    AppTarget(
                        version = "425.0.0.0.0",
                        description = "Instagram Alpha version (arm64-v8a only)",
                        isExperimental = true,
                    ),
                ),
        )

    val COMPATIBILITY_TIKTOK =
        Compatibility(
            name = "TikTok",
            packageName = "com.zhiliaoapp.musically",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xFE2C55,
            targets =
                listOf(
                    AppTarget(
                        version = "44.9.3",
                        description = "TikTok Stable version (arm64-v8a + arm-v7a)",
                    ),
                ),
        )

    val COMPATIBILITY_THREADS =
        Compatibility(
            name = "Threads",
            packageName = "com.instagram.barcelona",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0x000000,
            targets =
                listOf(
                    AppTarget(
                        version = "426.0.0.36.67",
                        description = "Threads Stable version (arm-v7a)",
                    ),
                ),
        )

    val COMPATIBILITY_REDDIT =
        Compatibility(
            name = "Reddit",
            packageName = "com.reddit.frontpage",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xFF4500,
            targets =
                listOf(
                    AppTarget(
                        version = "2026.17.0",
                        description = "Reddit Stable version (arm64-v8a + arm-v7a + x86_64)",
                    ),
                    AppTarget(
                        version = "2026.13.0",
                        description = "Previously validated Reddit version",
                        isExperimental = true,
                    ),
                ),
        )

    val COMPATIBILITY_TWITTER =
        Compatibility(
            name = "X / Twitter",
            packageName = "com.twitter.android",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0x000000,
            targets =
                listOf(
                    AppTarget(
                        version = "11.86.0-release.0",
                        description = "X Stable version (all archs)",
                    ),
                    AppTarget(
                        version = "10.86.0-release.0",
                        description = "Previously validated X version",
                        isExperimental = true,
                    ),
                ),
        )
}
