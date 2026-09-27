package app.anghami.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val COMPATIBILITY_ANGHAMI_8_0_28 = Compatibility(
        name = "Anghami",
        packageName = "com.anghami",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xA020F0,
        targets = listOf(
            // Verified against 8.0.28 (versionCode 8000280). Re-verify
            // fingerprints on every app update before release.
            AppTarget(
                version = "8.0.28",
                versionCodes = mapOf(
                    SupportedAbi.ARM64_V8A to 8000280,
                    SupportedAbi.ARMEABI_V7A to 8000280,
                    SupportedAbi.X86 to 8000280,
                    SupportedAbi.X86_64 to 8000280,
                )
            )
        )
    )
}
