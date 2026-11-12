package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val COMPATIBILITY_SAI = Compatibility(
        name = "SAI",
        packageName = "com.mtv.sai",
        // SAI is distributed as a split bundle (.apks).
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1976D2,
        targets = listOf(
            // Version the premium patch was developed and verified against.
            AppTarget(
                version = "2.4.3",
                versionCodes = mapOf(
                    SupportedAbi.ARM64_V8A to 49
                )
            )
        )
    )

    val COMPATIBILITY_APKS_INSTALLER = Compatibility(
        name = "APKS Installer",
        packageName = "com.inwepo.apkinstaller",
        // Distributed as a split bundle (.apks).
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x4CAF50,
        targets = listOf(
            // Version the ad-removal patch was developed and verified against.
            AppTarget(
                version = "2.8-Google"
            )
        )
    )

    val COMPATIBILITY_SHOHAY = Compatibility(
        name = "Shohay Pregnancy Health",
        packageName = "health.shohay.pregnancy",
        // Distributed as a split bundle (.apks): base + arm64 + en + xxhdpi.
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE91E63,
        targets = listOf(
            // Version the MicroG RE login + premium patches were developed
            // and verified against (hand-built v6 .apks, confirmed working
            // on device 2026-11-11).
            AppTarget(
                version = "2.1.1",
                versionCodes = mapOf(
                    SupportedAbi.ARM64_V8A to 179
                )
            )
        )
    )
}
