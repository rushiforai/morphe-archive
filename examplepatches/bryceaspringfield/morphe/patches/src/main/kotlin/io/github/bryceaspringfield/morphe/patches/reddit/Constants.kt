package io.github.bryceaspringfield.morphe.patches.reddit

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

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
                version = "2026.48.0",
                minSdk = 29,
                isExperimental = true
            ),
            AppTarget(
                version = "2026.47.0",
                minSdk = 29,
                isExperimental = true
            ),
            AppTarget(
                version = "2026.46.0",
                minSdk = 29,
                isExperimental = true
            ),
            AppTarget(
                version = "2026.45.0",
                minSdk = 29,
                isExperimental = true
            ),
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
                version = "2026.40.0",
                minSdk = 29
            ),
            AppTarget(
                version = "2026.24.0",
                minSdk = 29
            ),
            AppTarget(
                version = "2026.10.0",
                minSdk = 28
            )
        )
    )

}
