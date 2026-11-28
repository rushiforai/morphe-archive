package semicoloncolonel.mobilestream.patches.starz.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Starz",
        packageName = "com.bydeluxe.d3.android.program.starz",
        description = "The Starz phone and tablet apps. The phone build of 6.12.0 has version code 4518.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        // 6.12.0 is matched by version name. The phone and tablet build has version
        // code 4518; the Android TV build of the same version is patched from the
        // TV patch source.
        targets = listOf(AppTarget("6.12.0"), AppTarget("6.12.1", versionCode = 4519), AppTarget("6.11.0"))
    )
}
