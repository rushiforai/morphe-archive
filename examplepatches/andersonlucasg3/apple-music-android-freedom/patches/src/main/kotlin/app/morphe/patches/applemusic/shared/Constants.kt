package app.morphe.patches.applemusic.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Apple Music 7.0.0 (versionCode 1614), the version that ships/installs on the
     * BYD DiLink 3.0 head unit (Android 9/10).
     *
     * The app is distributed as an XAPK (base + config splits) and is signed with a rotated
     * certificate: Apple Inc. covers API 24-32 (the DiLink target) and Google Inc. covers
     * API 33+. Both SHA-256 fingerprints are declared so Morphe Manager can reject a
     * modified or unrelated APK before patching.
     */
    val APPLE_MUSIC_DILINK = Compatibility(
        name = "Apple Music",
        packageName = "com.apple.android.music",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFA243C,
        signatures = setOf(
            "88ba590ec2e1ea33c4458daf59489faee2cef297a9b4071e18cf82ef531100aa",
            "771d8674d3d9837c9edf11b11873443998f19105abcecab425ed9b8e6fefff9b",
        ),
        targets = listOf(
            AppTarget("7.0.0"),
        ),
    )
}
