package app.morphe.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    // Exact build the patches were developed and verified against: APKMirror build #2 (APKM),
    // the canonical distribution for 4.0.0. Surfaced in the app's target/version list so a user
    // installing this source downloads the build whose byte sequence the fingerprints expect.
    val BEJEWELED_APK_DOWNLOAD_GUIDANCE =
        "Download build #2: " +
        "https://www.apkmirror" +
        ".com/apk/electronic-arts/bejeweled-classic/" +
        "bejeweled-classic-4-0-0-release/bejeweled-" +
        "classic-4-0-0-2-android-apk-download/"

    val BEJEWELED_COMPATIBILITY = Compatibility(
        // App name as it appears in the Android launcher.
        name = "Bejeweled Classic",
        packageName = "com.ea.gp.bej3",
        // Surfaced to the user in the app's source/import dialog so the exact build to download
        // is spelled out. This file on APKMirror is an APK Mirror bundle (APKM) containing
        // base.apk + abi splits.
        description = BEJEWELED_APK_DOWNLOAD_GUIDANCE,
        // This file on APKMirror is an APK Mirror bundle (APKM) containing base.apk + abi splits.
        apkFileType = ApkFileType.APKM,
        // Primary green of the Bejeweled Classic icon.
        appIconColor = 0x00A550,
        targets = listOf(
            // The exact version we developed and verified against; the description pushes the
            // specific build (#2) so the fingerprint matches the APK the user downloads.
            AppTarget(
                version = "4.0.0",
                description = BEJEWELED_APK_DOWNLOAD_GUIDANCE
            )
        )
    )
}
