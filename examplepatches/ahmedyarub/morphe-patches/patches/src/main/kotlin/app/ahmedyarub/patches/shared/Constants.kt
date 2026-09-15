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
     * Instagram.
     *
     * Version codes differ per ABI, so they are deliberately not pinned: the patcher only
     * needs them when several ABI releases share one version code.
     *
     * 446.0.0.49.77 is flagged experimental because the patch has been verified to apply
     * and to produce the intended bytecode against that build, but its runtime behaviour on
     * a device has not been confirmed.
     */
    val COMPATIBILITY_INSTAGRAM = Compatibility(
        name = "Instagram",
        packageName = "com.instagram.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0xE1306C,
        targets = listOf(
            AppTarget(
                version = "446.0.0.49.77",
                isExperimental = true
            ),
            AppTarget(
                version = "439.0.0.37.89"
            )
        )
    )
}
