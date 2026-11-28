package semicoloncolonel.mobilestream.patches.disney.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import semicoloncolonel.mobilestream.patches.shared.misc.devTarget

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Disney+",
        packageName = "com.disney.disneyplus",
        description = "The Disney+ phone app. The Android TV build of the same version crashes on a phone.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x113CCF,
        targets = listOf(
            // Matched by version name, so the phone build (version code 179366219,
            // from Google Play) is accepted. The Android TV build of the same
            // version (1793662190) crashes on a phone. The older +rc2 phone build
            // is pinned below.
            AppTarget("26.20.0+rc3-2026.11.02"),
            devTarget("26.21.0+rc3-2026.11.17", versionCode = 179487942),
            AppTarget(version = "26.20.0+rc2-2026.10.28", versionCode = 179321403, description = "Phone build"),
        )
    )
}
