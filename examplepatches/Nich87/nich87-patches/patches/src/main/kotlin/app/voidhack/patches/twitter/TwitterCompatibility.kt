package app.voidhack.patches.twitter

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal const val TWITTER_12_19_1 = "12.19.1-release.0"

internal val twitterCompatibility = Compatibility(
    name = "Twitter",
    packageName = "com.twitter.android",
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x000000,
    targets = listOf(
        AppTarget(version = TWITTER_12_19_1, versionCode = 312191000),
    ),
)
