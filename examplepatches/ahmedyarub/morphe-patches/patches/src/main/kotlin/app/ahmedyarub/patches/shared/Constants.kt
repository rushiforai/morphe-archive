package app.ahmedyarub.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object Constants {

    /**
     * Reddit for Android.
     *
     * Only versions that have been verified against a decompiled APK are listed here.
     * 2026.37.0 is the version the Reddit Pro patch was developed and verified against.
     */
    val COMPATIBILITY_REDDIT = Compatibility(
        name = "Reddit",
        packageName = "com.reddit.frontpage",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xFF4500,
        targets = listOf(
            AppTarget(
                version = "2026.37.0",
                minSdk = 29
            )
        )
    )

    /**
     * Instagram. Every Instagram patch in the bundle declares this one value, so no two patches
     * can disagree about which builds they support.
     *
     * Only the latest release is supported: the patches resolve obfuscated names, and every
     * extra version is another set of shapes to keep matching. The apkTest task applies the
     * patches to this build and fails on any fingerprint that does not resolve to exactly one
     * method.
     *
     * Version codes are deliberately not pinned. A release ships under more than one version code
     * (448 had 385412020 and 385412061), and pinning one turns the others away; the patcher only
     * needs codes when several ABI releases share one version name.
     */
    val COMPATIBILITY_INSTAGRAM = Compatibility(
        name = "Instagram",
        packageName = "com.instagram.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE1306C,
        targets = listOf(
            AppTarget(
                version = "449.0.0.52.84"
            )
        )
    )

    /**
     * X (Twitter). Ported from piko, which targets 12.19.1; adapted to the latest release only,
     * for the same reason as Instagram.
     */
    val COMPATIBILITY_X = Compatibility(
        name = "X",
        packageName = "com.twitter.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(
            AppTarget(
                version = "12.31.0-prod.01"
            )
        )
    )
}
