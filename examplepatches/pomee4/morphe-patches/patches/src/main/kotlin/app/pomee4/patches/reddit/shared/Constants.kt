package app.pomee4.patches.reddit.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {
    /**
     * Same versions as the Reddit patches of Morphe Patches, which this bundle is used with.
     */
    val COMPATIBILITY_REDDIT = Compatibility(
        name = "Reddit",
        packageName = "com.reddit.frontpage",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF4500,
        signatures = setOf(
            "970b91143813b4c9d5f3634f672c9fcaa5621b4efaaedafd6c235cbbb869736f"
        ),
        targets = listOf(
            AppTarget(version = "2026.46.0", minSdk = 29, isExperimental = true),
            AppTarget(version = "2026.45.0", minSdk = 29, isExperimental = true),
            AppTarget(version = "2026.44.0", minSdk = 29, isExperimental = true),
            AppTarget(version = "2026.40.0", minSdk = 29),
        )
    )
}
