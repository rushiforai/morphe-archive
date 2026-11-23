package app.template.patches.mailcom.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string
import app.template.patches.mailcom.shared.STRING
import app.template.patches.mailcom.shared.toStringFingerprint

// The Cocos remote-config ad switches (9.18.3: remoteconfig.models.AdvertisingIdentityConfig).
// AdsFeatureFlagsManager maps each getter into the flow its ad placement reads.
internal val AdvertisingIdentityConfigToStringFingerprint =
    toStringFingerprint("AdvertisingIdentityConfig(isId5Enabled=")

// The interstitial switch (9.18.3: remoteconfig.models.InterstitialAdConfig), read by
// InterstitialFeatureFlagsManager.isInterstitialEnabled.
internal val InterstitialAdConfigToStringFingerprint =
    toStringFingerprint("InterstitialAdConfig(isEnabled=")

// The ad pixel sender. Up to 9.20.2 it was tracking.adtracker.AdTracker.send(String)V, called only
// by CommonTracker.trackCustomUrl; 9.21.2 inlined it into that suspend method,
// trackCustomUrl(String, continuation)Object, which sends the pixel synchronously and returns
// Unit. Every trackCustomUrl caller reports an ad event: inbox ad displayed, read, deleted and
// swiped away, smart header ad, ad measure points and shopping-list order ads. Found by its two
// log strings and the (String, continuation)Object shape; the continuation type is R8's pick, so
// only the first parameter is checked.
internal object AdTrackerSendFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("AdTracker: url is null or invalid", StringComparisonType.STARTS_WITH),
        string("AdTracker failed", StringComparisonType.STARTS_WITH),
    ),
    custom = { method, _ ->
        method.implementation != null && method.parameterTypes.size == 2 &&
            method.parameterTypes[0].toString() == STRING
    },
)
