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
                version = "2026.40.0",
                versionCode = 2640091,
                minSdk = 32,
                description = "Official Morphe patches' stable target; patched and launched logged out on the dedicated Android API 36 emulator (the sign-in screen blocks public feeds). Its post callbacks build the translation event in a separate method; the output DEX has six post, two comment, one accessibility comment and two post detail translation hooks.",
            ),
            AppTarget(
                version = "2026.44.0",
                versionCode = 2644031,
                minSdk = 32,
                description = "Official Morphe patches' newest target and the newest store version; patched and launched logged out on the dedicated Android API 36 emulator (the sign-in screen blocks public feeds), with the same ten translation call sites as 2026.43.0 in the output DEX after the comment and post detail anchors were adapted to the new event constructors.",
            ),
        ),
    )
}
