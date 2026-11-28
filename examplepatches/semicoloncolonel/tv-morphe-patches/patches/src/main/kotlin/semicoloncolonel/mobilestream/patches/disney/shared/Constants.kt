package semicoloncolonel.mobilestream.patches.disney.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Disney+",
        packageName = "com.disney.disneyplus",
        description = "The Disney+ app. Patch the build with version code 1793662190.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x113CCF,
        targets = listOf(
            // One target by version name matches both builds of this version: the
            // phone build (version code 179366219, from Google Play) and the Android
            // TV build (1793662190). No version code is pinned, so the Android TV
            // build is accepted too; the Android TV build crashes on a phone, so use
            // it only on a TV. The older +rc2 phone build is pinned below.
            AppTarget("26.20.0+rc3-2026.11.02"),
            devTarget("26.21.0+rc3-2026.11.17", versionCode = 1794879420),
        ),
        formFactor = FormFactor.TV,
    )
}
