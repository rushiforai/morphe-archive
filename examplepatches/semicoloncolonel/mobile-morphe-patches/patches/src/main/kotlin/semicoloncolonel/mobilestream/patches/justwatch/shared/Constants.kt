package semicoloncolonel.mobilestream.patches.justwatch.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "JustWatch",
        packageName = "com.justwatch.justwatch",
        description = "The JustWatch streaming guide app, for phones and Android TV.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFBC500,
        targets = listOf(
            AppTarget("26.44.2", 2644002, description = "Phone build"),
            // Two Android TV builds of 26.43.8 exist: APKMirror's bundle (2643008, with
            // 32-bit and 64-bit splits) and the single 32-bit APK Google Play gives an
            // NVIDIA Shield (12643008). Both are listed so Morphe Manager accepts either.
            AppTarget(
                version = "26.43.8",
                versionCodes = mapOf(
                    SupportedAbi.ARMEABI_V7A to 12643008,
                    SupportedAbi.ARM64_V8A to 2643008,
                ),
                description = "Android TV build",
            ),
        )
    )
}
