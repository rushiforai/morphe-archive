package io.github.sabopura.morphe.patches.reddit

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    /** The official Morphe patches' stable Reddit target plus the newest store version. */
    val REDDIT = Compatibility(
        name = "Reddit",
        packageName = "com.reddit.frontpage",
        description = "Official Reddit Android app, pinned to verified bytecode anchors.",
        apkFileType = ApkFileType.APKS,
        appIconColor = 0xFF4500,
        signatures = setOf(
            "970b91143813b4c9d5f3634f672c9fcaa5621b4efaaedafd6c235cbbb869736f",
        ),
        targets = listOf(
            AppTarget(
                version = "2026.24.0",
                versionCode = 2624051,
                minSdk = 29,
                description = "Official Morphe patches' stable target; patched and launched logged out on the dedicated Android API 36 emulator (the sign-in screen blocks public feeds), with the same ten translation hooks as 2026.42.0 in the output DEX.",
            ),
            AppTarget(
                version = "2026.42.0",
                versionCode = 2642001,
                minSdk = 32,
                description = "Patched and launched logged out on the dedicated Android API 36 emulator; the sign-in screen blocks public feeds.",
            ),
        ),
    )
}
