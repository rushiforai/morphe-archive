package app.stylus.patches.instagram.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    val COMPATIBILITY_INSTAGRAM = Compatibility(
        name = "Instagram",
        packageName = "com.instagram.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFC483C,
        signatures = setOf(
            // Android 13+
            "3a10c50c18ba937506c2875e9047be74f8fd8b86fae2ff9feaa50a81fcb4c014",
            // Android 9-12L
            "5f3e50f435583c9ae626302a71f7340044087a7e2c60adacfc254205a993e305",
        ),
        targets = listOf(
            AppTarget(
                version = "435.0.0.37.76",
                versionCodes = mapOf(
                    SupportedAbi.ARM64_V8A to 384109456,
                ),
                minSdk = 28,
            ),
        ),
    )
}