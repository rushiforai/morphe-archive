package app.template.patches.onefootball.ads

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_ONEFOOTBALL
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.misc.ads.failFlutterGmaPluginLoads
import app.template.patches.shared.misc.ads.neutraliseMobileAdsStatics
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

// OneFootball's app code is obfuscated, and from 15.150.0 so is most of Google Mobile Ads: R8 renamed
// the full-screen ad classes (InterstitialAd, RewardedAd, AppOpenAd, ...) and AdLoader, and
// inlined or renamed MobileAds.initialize(Context). What stays are the request types (AdRequest,
// AdManagerAdRequest), the banner views (AdView, AdManagerAdView and their kept loadAd), the
// Flutter google_mobile_ads plugin's method-channel strings, and the SDK's own init log line.
// The patch therefore anchors on those: every plugin load reports NO_FILL to Dart (shared
// helper), the SDK never initializes, and the native load entry points are found by their
// signature (a void taking a request, or a static void taking Context, String, request). The
// native feeds' ad slots are server-driven components; their two parsers keep their names, but
// are found by shape and the protobuf class they decode (Fingerprints.kt), and return null so
// the feed drops them. The Flutter feeds ask the native side for each ad over the method channel;
// those requests get the app's own "Ad Blocked" error reply at once, so Dart is not left waiting
// on a load. The Home feed's Dart "Ad Break" card still shows its no-fill skeleton (Dart-only, no
// native lever).
private const val GMA = "Lcom/google/android/gms/ads/"
private const val AD_VIEW = GMA + "AdView;"
private const val AD_MANAGER_AD_VIEW = GMA + "admanager/AdManagerAdView;"
private const val CONTEXT = "Landroid/content/Context;"
private const val STRING = "Ljava/lang/String;"
private val REQUEST_TYPES = setOf(GMA + "AdRequest;", GMA + "admanager/AdManagerAdRequest;")

private class LoadSite(val type: String, val name: String, val parameters: List<String>, val isStatic: Boolean)

private fun Method.parameterList() = parameterTypes.map(CharSequence::toString)

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Removes all ads."
) {
    compatibleWith(COMPATIBILITY_ONEFOOTBALL)

    execute {
        // Never initialize the ads SDK, and neuter the other MobileAds statics, which throw
        // without init (AGENTS.md rule 9): the internal feature-flag screen calls openDebugMenu
        // with no catch. R8 renamed initialize and openDebugMenu from 15.150.0 (a, b), so no names
        // are required; the helper returns early from every concrete static void of MobileAds, and
        // the check below makes the patch fail if no such method takes (Context, ...) any more.
        if (!neutraliseMobileAdsStatics()) throw PatchException("Disable ads: ${GMA}MobileAds; not found")
        val initLike = mutableClassDefBy(GMA + "MobileAds;").methods.filter {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" && it.implementation != null &&
                it.parameterList().firstOrNull() == CONTEXT
        }
        if (initLike.isEmpty()) throw PatchException("Disable ads: no static void ${GMA}MobileAds;->(Context, ...)")

        // The Flutter google_mobile_ads plugin (every concrete ad load; eight in 15.150.0) reports
        // NO_FILL to Dart.
        failFlutterGmaPluginLoads()

        // Direct native loads become no-ops. The banner loads (BaseAdView.loadAd, which AdView
        // inherits, and AdManagerAdView.loadAd) are required; the rest are found by shape: any
        // concrete instance void inside com.google.android.gms.ads taking exactly one request
        // (AdLoader.loadAd, the AdManagerAdView helper) or any static void taking
        // (Context, String, request, ...) (the full-screen loads, in classes R8 moved).
        val sites = mutableListOf<LoadSite>()
        classDefForEach { classDef ->
            for (method in classDef.methods) {
                if (method.implementation == null || method.returnType != "V" ||
                    method.name == "<init>" || method.name == "<clinit>"
                ) continue
                val parameters = method.parameterList()
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val inGma = classDef.type.startsWith(GMA)
                val singleRequest = !isStatic && inGma && parameters.size == 1 && parameters[0] in REQUEST_TYPES
                val staticLoad = isStatic && parameters.size >= 3 && parameters[0] == CONTEXT &&
                    parameters[1] == STRING && parameters[2] in REQUEST_TYPES
                if (singleRequest || staticLoad) sites += LoadSite(classDef.type, method.name, parameters, isStatic)
            }
        }
        val bannerBase = mutableClassDefBy(AD_VIEW).superclass
        for ((owner, label) in listOf(bannerBase to "BaseAdView", AD_MANAGER_AD_VIEW to "AdManagerAdView")) {
            if (sites.none { it.type == owner && it.name == "loadAd" }) {
                throw PatchException("Disable ads: no concrete void $label ($owner)->loadAd(request)")
            }
        }
        // The other loads must not silently disappear in a later R8 build: the app's own native ad
        // path goes through the AdLoader request load (an instance void outside the banner
        // classes), and the full-screen loads are the static (Context, String, request, ...) ones.
        if (sites.none { !it.isStatic && it.type != bannerBase && it.type != AD_MANAGER_AD_VIEW }) {
            throw PatchException("Disable ads: no AdLoader-style instance load found")
        }
        if (sites.none { it.isStatic }) {
            throw PatchException("Disable ads: no static full-screen load found")
        }
        for (site in sites) {
            mutableClassDefBy(site.type).methods.single {
                it.name == site.name && it.parameterList() == site.parameters
            }.returnEarly()
        }
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
