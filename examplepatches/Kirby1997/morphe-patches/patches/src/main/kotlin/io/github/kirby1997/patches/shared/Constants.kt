package io.github.kirby1997.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

// Per-app compatibility descriptors shared by every patch targeting that app.
// version = the exact release each patch was reverse-engineered against; a bump
// renames obfuscated classes and will break the fingerprints (re-derive + update).
object Constants {
    val FOLDERSYNC = Compatibility(
        name = "FolderSync",
        packageName = "dk.tacit.android.foldersync.lite",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x2196F3,
        targets = listOf(AppTarget(version = "4.8.5")),
    )

    val FEELD = Compatibility(
        name = "Feeld",
        packageName = "co.feeld",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x151515,
        targets = listOf(AppTarget(version = "9.10.0")),
    )

    val HIDRATESPARK = Compatibility(
        name = "Hidrate Spark",
        packageName = "hidratenow.com.hidrate.hidrateandroid",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x00BCD4,
        targets = listOf(AppTarget(version = "4.6.9")),
    )

    val MEETUP = Compatibility(
        name = "Meetup",
        packageName = "com.meetup",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xED1C40,
        targets = listOf(AppTarget(version = "2026.04.10.2881")),
    )

    val METOFFICE = Compatibility(
        name = "Met Office",
        packageName = "uk.gov.metoffice.weather.android",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x005E9E,
        targets = listOf(AppTarget(version = "3.40.0")),
    )

    val TINDER = Compatibility(
        name = "Tinder",
        packageName = "com.tinder",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFD5564,
        targets = listOf(AppTarget(version = "17.15.0")),
    )

    // X/Twitter patches were reverse-engineered against 12.4.1, which is wrapped by
    // native PairIP and SIGSEGVs on any re-signed sideload — these patches compile and
    // are correct RE artifacts but are NOT shippable unrooted at this version. Marked
    // experimental and each patch is default-off. See repo notes.
    val TWITTER = Compatibility(
        name = "X",
        packageName = "com.twitter.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(AppTarget(version = "12.4.1-release.0", isExperimental = true)),
    )

    // X 12.7.1 is the build Piko 3.8.0 targets and the one that actually runs
    // patched on an unrooted device. Kept separate from [TWITTER] so the older
    // 12.4.1-pinned RE artifacts are not offered for a build they cannot match.
    val TWITTER_12_7_1 = Compatibility(
        name = "X",
        packageName = "com.twitter.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(AppTarget(version = "12.7.1-release.0")),
    )
}
