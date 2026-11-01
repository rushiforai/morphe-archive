package semicoloncolonel.mobilestream.patches.appletv.ads

import app.morphe.patcher.Fingerprint

// Apple TV phone build 3.0.0 (versionCode 3000061).
//
// Ads are HLS Interstitials (EXT-X-DATERANGE CLASS="com.apple.hls.interstitial")
// that Media3's HlsInterstitialsAdsLoader plays on the device. The app's own
// MediaItem builder (sh.h.d in 3.0.0, R8-renamed) gives every on-demand item
// an AdsConfiguration whose id is "adsId-" + nanoTime. Media3 only attaches
// the interstitials loader to items that carry one. The two string literals
// are the stable anchors; the class, method, and field names are not.
object HlsMediaItemsFingerprint : Fingerprint(
    returnType = "Ljava/util/ArrayList;",
    strings = listOf("supportsInterstitials=", "adsId-"),
)
