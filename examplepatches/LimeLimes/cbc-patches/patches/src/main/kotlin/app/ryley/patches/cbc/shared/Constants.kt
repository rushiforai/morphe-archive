package app.ryley.patches.cbc.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * CBC News: Breaking & Local.
     *
     * The app serves display and in-read ads through its own `ca.cbc.android.ads.AdProvider`
     * abstraction, which wraps Google Ad Manager (with Amazon APS and Teads as additional
     * providers) and is wired up with Koin.
     */
    val COMPATIBILITY_CBC_NEWS = Compatibility(
        name = "CBC News",
        packageName = "ca.cbc.mobile.android.cbcnewsandroidwebview",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xD71920, // 0xRRGGBB only (CBC red).
        targets = listOf(
            // Version the patches were developed and verified against.
            AppTarget(version = "7.11.0"),
        ),
    )
}
