package io.github.bryceaspringfield.morphe.patches.reddit

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

// The Reddit versions Morphe Patches supports, kept equal to its own list, since this bundle is used beside it.

internal object Constants {
    val COMPATIBILITY_REDDIT = Compatibility(
        name = "Reddit",
        packageName = "com.reddit.frontpage",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF4500,
        signatures = setOf(
            "970b91143813b4c9d5f3634f672c9fcaa5621b4efaaedafd6c235cbbb869736f"
        ),
        targets = listOf(
            AppTarget(
                version = "2026.44.0",
                minSdk = 29,
                isExperimental = true
            ),
            AppTarget(
                version = "2026.43.0",
                minSdk = 29,
                isExperimental = true
            ),
            AppTarget(
                version = "2026.42.0",
                minSdk = 29,
                isExperimental = true
            ),
            AppTarget(
                version = "2026.40.0",
                minSdk = 29
            ),
            AppTarget(
                version = "2026.24.0", // Last version with disable modern home.
                minSdk = 29
            ),
            AppTarget(
                version = "2026.10.0", // Last version for Android 9.0
                minSdk = 28
            )
        )
    )

}
