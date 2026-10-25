package app.template.patches.onefootball.ads

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_ONEFOOTBALL
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.misc.ads.neutraliseMobileAdsStatics

// OneFootball's app code is obfuscated, but every ad runs through Google Mobile Ads
// (com.google.android.gms.ads), whose class and method names are stable library API.
// The patch hooks that surface: the SDK never initializes, direct loads become no-ops
// and the app-open preloader reports failure. The native feeds' ad slots are server-driven
// components; their two parsers keep their names, but are found by shape and the protobuf class
// they decode (Fingerprints.kt), and return null so the feed drops them. The Flutter feeds ask
// the native side for each ad over the method channel; those requests get the app's own
// "Ad Blocked" error reply at once, so Dart is not left waiting on a load. The Home feed's Dart
// "Ad Break" card still shows its no-fill skeleton (Dart-only, no native lever).
private const val GMA = "Lcom/google/android/gms/ads/"

private val LOAD_NAMES = setOf("load", "loadAd", "loadAds")

// Every concrete void load/loadAd/loadAds of these classes is neutered. The value lists the
// loads each class is known to declare (15.147.0): the class and those methods must be there, so a
// drifted SDK fails the patch instead of leaving a format loading. AdLoader has the batch
// loadAds(AdRequest, int) next to loadAd. AdView declares no load of its own (it inherits
// BaseAdView's), so no method is required there; an override would still be neutered.
private val AD_CLASSES = mapOf(
    "BaseAdView" to listOf("loadAd"),
    "AdView" to emptyList(),
    "AdLoader" to listOf("loadAd", "loadAds"),
    "interstitial/InterstitialAd" to listOf("load"),
    "rewarded/RewardedAd" to listOf("load"),
    "rewardedinterstitial/RewardedInterstitialAd" to listOf("load"),
    "appopen/AppOpenAd" to listOf("load"),
    "admanager/AdManagerAdView" to listOf("loadAd"),
    "admanager/AdManagerInterstitialAd" to listOf("load"),
)

private fun BytecodePatchContext.methods(relative: String): Set<MutableMethod> =
    mutableClassDefBy(GMA + relative + ";").methods

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_ONEFOOTBALL)

    execute {
        // Never initialize the ads SDK, and neuter the other MobileAds statics, which throw
        // without init (AGENTS.md rule 9): the internal feature-flag screen calls openDebugMenu
        // with no catch. Required: a missing MobileAds or either method fails the patch.
        neutraliseMobileAdsStatics("initialize", "openDebugMenu")

        // Direct loads become no-ops.
        for ((relative, required) in AD_CLASSES) {
            val loads = methods(relative)
                .filter { it.implementation != null }
                .filter { it.name in LOAD_NAMES && it.returnType == "V" }
            for (name in required) {
                if (loads.none { it.name == name }) {
                    throw PatchException("Disable ads: no concrete void $GMA$relative;->$name")
                }
            }
            loads.forEach { it.returnEarly() }
        }

        // Nothing is preloaded for app-open ads.
        val preloads = methods("appopen/AppOpenAdPreloader")
            .filter { it.implementation != null }
            .filter { it.name == "start" && it.returnType == "Z" }
        if (preloads.isEmpty()) throw PatchException("Disable ads: no concrete ${GMA}appopen/AppOpenAdPreloader;->start(...)Z")
        preloads.forEach { it.returnEarly(false) }

        // The native experience feeds' ad components are dropped. Both ad component parsers
        // return null at the top; ComponentParserRegistry passes the null on and the feed leaves
        // the component out, the app's own path for a component it cannot parse. On the emulator
        // the visible slots came from the Flutter bridge (below), so this step's runtime effect
        // was not observed; it is defensive. Object return, so
        // smali, not returnEarly (rule 1). Both fingerprints are mandatory.
        for (fingerprint in listOf(AdComponentParseFingerprint, PlaceholderAdComponentParseFingerprint)) {
            val parse = fingerprint.method
            if (parse.implementation == null) {
                throw PatchException("Disable ads: ${parse.definingClass}->${parse.name} has no body")
            }
            parse.addInstructionsChecked(
                0,
                """
                    const/4 v0, 0x0
                    return-object v0
                """,
            )
        }

        // The Flutter feeds' ad requests are answered "Ad Blocked" at once. Their bridge handlers
        // otherwise wait on a GMA load that the hooks above never complete, so Dart never gets a
        // reply. result.error("Ad Blocked", ...) is the reply the app itself sends when its ad
        // manager reports an error; match page slots then go away, while the Home feed's Dart
        // "Ad Break" card keeps its no-fill skeleton (as stock does on no-fill). Other channel methods
        // still go down the handler chain unchanged. p1/p2 are v13/v14 (.locals 12), 4-bit safe;
        // the checked helper throws if that changes (rule 11).
        for ((fingerprint, channelMethod) in listOf(
            GetAdDataHandleFingerprint to "getAdData",
            GetOmpAdDataHandleFingerprint to "getOMPAdData",
        )) {
            val handle = fingerprint.method
            handle.addInstructionsWithLabelsChecked(
                0,
                """
                    const-string v0, "$channelMethod"
                    iget-object v1, p1, Lio/flutter/plugin/common/MethodCall;->method:Ljava/lang/String;
                    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :handle
                    const-string v0, "Ad Blocked"
                    const/4 v1, 0x0
                    invoke-interface {p2, v0, v1, v1}, Lio/flutter/plugin/common/MethodChannel${'$'}Result;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
                    return-void
                """,
                ExternalLabel("handle", handle.getInstruction(0)),
            )
        }
    }
}
