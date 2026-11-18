package semicoloncolonel.mobilestream.patches.starz.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Starz",
        packageName = "com.bydeluxe.d3.android.program.starz",
        description = "The Starz app. Patch the Android TV build: version code 9511 for 6.12.1, " +
            "or 9510 for 6.12.0.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        // 6.12.1 is pinned to the Android TV build's version code (9511). The phone and
        // Fire tablet build of the same version is 4519, so it is never offered here.
        // 6.12.0 is matched by version name, and its Android TV build is 9510.
        targets = listOf(AppTarget("6.12.1", versionCode = 9511), AppTarget("6.12.0")),
        formFactor = FormFactor.TV,
    )
}
