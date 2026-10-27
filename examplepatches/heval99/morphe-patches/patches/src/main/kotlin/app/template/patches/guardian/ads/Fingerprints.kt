package app.template.patches.guardian.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

internal const val AD_MANAGER_AD_VIEW = "Lcom/google/android/gms/ads/admanager/AdManagerAdView;"

// R8 renames the app's own classes since 6.238, so every anchor below is a string, a kept
// Google Mobile Ads / app class name or a method shape.

// The app's single Google Ad Manager load path (6.238: qj7.a(zc, AdManagerAdView)). Article
// MPUs, front advert cards and the swipe-in interstitial pages all request through it. It checks
// consent ("No consent given for google ads"), logs "preparing ad request: %s", honours the debug
// "Forced ad failure" switch, starts the Amazon APS bid and then loads the GMA ad.
internal object LoadAdFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf(
        string("preparing ad request: %s", StringComparisonType.CONTAINS),
        string("No consent given for google ads", StringComparisonType.CONTAINS),
        string("Forced ad failure", StringComparisonType.CONTAINS),
    ),
    custom = { method, _ ->
        method.implementation != null && method.parameterTypes.size == 2 &&
            method.parameterTypes[1].toString() == AD_MANAGER_AD_VIEW
    },
)

// ShouldLoadAds (6.238: sub.a()), the app's own "ads on" check: the ads remote switch (a
// RemoteSwitches$Companion$Key constant) is on, the user is not premium (isPremium()) and the
// network is available. Article HTML gets ad slots and the article pager gets interstitial pages
// only when it answers true.
internal object ShouldLoadAdsFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(type = "Lcom/guardian/util/switches/RemoteSwitches\$Companion\$Key;", opcode = Opcode.SGET_OBJECT),
        methodCall(name = "isPremium", parameters = listOf(), returnType = "Z"),
    ),
)
