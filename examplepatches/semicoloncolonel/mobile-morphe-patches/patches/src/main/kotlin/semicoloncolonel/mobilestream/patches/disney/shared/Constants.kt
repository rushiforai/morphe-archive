package semicoloncolonel.mobilestream.patches.disney.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Disney+",
        packageName = "com.disney.disneyplus",
        description = "The phone app, not the Android TV app.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x113CCF,
        targets = listOf(
            // The Android TV builds of this version share its name (1793662190 and
            // 1803662190) and crash on a phone, so only the phone build is listed.
            // APKMirror does not have the phone build; it comes from Google Play.
            AppTarget(
                version = "26.20.0+rc3-2026.11.02",
                versionCode = 179366219,
                minSdk = 32,
                description = "Phone build",
            ),
            // Only the phone build is listed, so an Android TV build with the same
            // version name is not accepted on a phone. Every APKMirror download of
            // this version is this build.
            AppTarget(version = "26.20.0+rc2-2026.10.28", versionCode = 179321403, description = "Phone build"),
        )
    )
}
