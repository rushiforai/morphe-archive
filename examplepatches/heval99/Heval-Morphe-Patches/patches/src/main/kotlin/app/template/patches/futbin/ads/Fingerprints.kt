package app.template.patches.futbin.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// Futbin's own code is R8-obfuscated and its names rotate every release (the GAM controller is
// x.cv3 in 27.02 and x.nk4 in 27.05/27.06), so app methods are found by a preference key or by
// the stable prefix of their "Ad Log" / "GAM ->" log lines. Each anchor is unique in 27.02, 27.05
// and 27.06.

// getBoolean("preferences.ad.allowed.key", true). The Application caches it as its isAdAllowed
// flag, and the app's "no ads" check everywhere is `premium || !isAdAllowed`. The setter for the
// same key takes a boolean and returns void, so the shape excludes it.
internal object AdAllowedPreferenceFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(),
    strings = listOf(string("preferences.ad.allowed.key", StringComparisonType.CONTAINS)),
)

// FbApplication's ad SDK init ("Ad Log -> int GAM/Numbus"): starts Google Ad Manager and Nimbus.
internal object InitAdSdksFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(string("Ad Log -> int GAM", StringComparisonType.STARTS_WITH)),
)

// GamController.showInterstitial(Activity, callback). With no GAM interstitial loaded it falls
// back to a Nimbus interstitial, so GMA hooks alone do not stop it.
internal object ShowInterstitialFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "L"),
    filters = listOf(string("GAM -> !isInterstitialGapPassed", StringComparisonType.STARTS_WITH)),
)

// NimbusController init: Nimbus, plus the Moloco, Mintegral and Vungle demand SDKs.
internal object NimbusInitFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(string("GAM -> Nimbus -> initAds", StringComparisonType.STARTS_WITH)),
)

// NimbusController bottom banner (fallback when the GAM sticky banner fails).
internal object NimbusBottomBannerFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/view/ViewGroup;"),
    filters = listOf(string("GAM -> Nimbus -> Bottom loadBottomBanner", StringComparisonType.STARTS_WITH)),
)

// NimbusController in-feed 300x250 banner (fallback when the GAM in-feed banner fails).
internal object NimbusInFeedBannerFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/view/ViewGroup;", "Ljava/lang/String;"),
    filters = listOf(string("GAM -> Nimbus -> In-Feed loadInFeedBanner", StringComparisonType.STARTS_WITH)),
)

// BuilderFragment's Anzu init: `if (isPremium()) { layoutAds.setVisibility(GONE); return; }`, else
// an AnzuAdView (video ad) is added to the builder's ad panel, which then slides in and out every
// 30 seconds. Anzu ignores isAdAllowed, so it needs its own hook.
internal object AnzuInitFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_STATIC, parameters = listOf(), returnType = "Z"),
        opcode(Opcode.MOVE_RESULT, location = MatchAfterImmediately()),
        opcode(Opcode.IF_EQZ, location = MatchAfterImmediately()),
        string("Ad Log -> init Anzu", StringComparisonType.STARTS_WITH),
    ),
)
