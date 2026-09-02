package app.template.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val COMPATIBILITY_STEAM_LINK = Compatibility(
        name = "Steam Link",
        packageName = "com.valvesoftware.steamlinkvr",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1B2838,
        targets = listOf(
            AppTarget(version = "2.0.22"),
        )
    )

    val COMPATIBILITY_STEAM_LINK_EXPERIMENTAL = Compatibility(
        name = "Steam Link Experimental",
        packageName = "com.valvesoftware.steamlinkvr",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1B2838,
        targets = listOf(
            AppTarget(version = "2.0.22", isExperimental = true),
        )
    )

    val COMPATIBILITY_STEAM_LINK_HMD_ONLY = Compatibility(
        name = "Steam Link",
        packageName = "com.valvesoftware.steamlinkvr",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1B2838,
        targets = listOf(
            AppTarget(
                version = "2.0.20",
                versionCodes = SupportedAbi.entries.associateWith { 5001712 },
                description = "HMD-only pose fix layout verified for versionCode 5001712.",
            )
        )
    )

    val COMPATIBILITY_STEAM_LINK_HMD_ONLY_5002206 = Compatibility(
        name = "Steam Link",
        packageName = "com.valvesoftware.steamlinkvr",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1B2838,
        targets = listOf(
            AppTarget(
                version = "2.0.22",
                versionCodes = SupportedAbi.entries.associateWith { 5002206 },
                description = "HMD-only pose fix layout verified for build 5002206.",
            )
        )
    )

    val COMPATIBILITY_STEAM_LINK_HMD_ONLY_5002172 = Compatibility(
        name = "Steam Link",
        packageName = "com.valvesoftware.steamlinkvr",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1B2838,
        targets = listOf(
            AppTarget(
                version = "2.0.22",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 5002172),
                description = "HMD-only pose fix layout verified for build 5002172.",
            )
        )
    )

    val COMPATIBILITY_STEAM_LINK_HMD_ONLY_5002244 = Compatibility(
        name = "Steam Link",
        packageName = "com.valvesoftware.steamlinkvr",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x1B2838,
        targets = listOf(
            AppTarget(
                version = "2.0.22",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 5002244),
                description = "HMD-only pose fix layout verified for build 5002244.",
            )
        )
    )
}
