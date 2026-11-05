package app.template.patches.librera.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

// Since 10.0 the app is R8-obfuscated (AppsConfig and ADS are renamed and partly merged), so the
// gates are found by their own log lines instead of their class and method names.

// Librera's ad gate (AppsConfig.isShowAdsInApp(Context)). It is consulted before MobileAds is
// initialized (LibreraApp.onCreate) and before AdsFragmentActivity.onResume loads the rewarded
// and interstitial ads, and by the main tab and reward views. It returns false (logging
// "no-ads ...") when Google Play services or the device is unsuitable, and otherwise true unless
// accessibility mode or the Pro app is present. Forcing false keeps the Google Mobile Ads SDK from
// starting. Filters follow the bytecode order (R8 moved the Play services exit to the end), so the
// old-device log line comes before the Pro app package check.
object IsShowAdsInAppFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("no-ads old device", StringComparisonType.STARTS_WITH),
        string("com.foobnix.pro.pdf.reader"),
    ),
)

// isRewardActivated(): whether the reward window (after a rewarded video) is still open, logged
// as "isRewardActivated". ADS.isRewardActivated guards showInterstitial and the onResume loads;
// since 10.0 R8 also inlines a copy into AdsFragmentActivity.isRewardActivated. Every match is
// forced true, so ads are skipped as if the window were open.
object IsRewardActivatedFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("isRewardActivated"),
)
