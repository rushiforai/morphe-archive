package semicoloncolonel.mobilestream.patches.nbcuott.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.FormFactor

// CNBC, NBC News, and MS NOW on Android TV are one NBCU app: a native shell
// that loads a remote web app into a WebView. CNBC and MS NOW use the current
// shell (com.versant.androidottweb). NBC News uses an older copy of it
// (com.nbc.androidottweb), with the same structure under other class names.
// Each has its own version line, separate from the phone app with the same
// package name.
object Constants {
    val CNBC = Compatibility(
        name = "CNBC",
        packageName = "com.cnbc.client",
        description = "The Android TV app. Patch the Android TV build: version code 15050 for 7.10.0.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x005594,
        targets = listOf(AppTarget("7.10.0", versionCode = 15050)),
        formFactor = FormFactor.TV,
    )

    val NBC_NEWS = Compatibility(
        name = "NBC News",
        packageName = "com.zumobi.msnbc",
        description = "The Android TV app. Patch the Android TV build: version code 1720220050 for 7.9.1.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0A0A0A,
        targets = listOf(AppTarget("7.9.1", versionCode = 1720220050)),
        formFactor = FormFactor.TV,
    )

    val MS_NOW = Compatibility(
        name = "MS NOW",
        packageName = "com.nbcnews.msnbc.mobile",
        description = "The Android TV app. Patch the Android TV build: version code 220050 for 7.10.2.",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0A2240,
        // 7.10.2 is a "beta" build type, likely from Google Play's beta track.
        // Move to the public version once it is confirmed.
        targets = listOf(AppTarget("7.10.2", versionCode = 220050, isExperimental = true)),
        formFactor = FormFactor.TV,
    )

    // The WebViewClient that loads the web app. Each build has one of these.
    internal val WEB_VIEW_CLIENTS = listOf(
        "Lcom/versant/androidottweb/web/MainWebView\$MsnbcWebViewClient;", // CNBC, MS NOW
        "Lcom/nbc/androidottweb/web/NewsWebView\$NewsWebViewClient;", // NBC News
    )
}
