package semicoloncolonel.mobilestream.patches.disney.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Disney+",
        packageName = "com.disney.disneyplus",
        description = "The Disney+ phone and Android TV apps. The phone and Android TV builds of " +
            "26.20.0+rc3-2026.11.02 share the version name. On a TV, patch the Android TV build " +
            "(version code 1793662190); it crashes on a phone, where the phone build (179366219) is used.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x113CCF,
        targets = listOf(
            // One target by version name matches both builds of this version: the
            // phone build (version code 179366219, from Google Play) and the Android
            // TV build (1793662190). No version code is pinned, so the Android TV
            // build is accepted too; the Android TV build crashes on a phone, so use
            // it only on a TV. The older +rc2 phone build is pinned below.
            AppTarget("26.20.0+rc3-2026.11.02"),
            AppTarget(version = "26.20.0+rc2-2026.10.28", versionCode = 179321403, description = "Phone build"),
        )
    )
}
