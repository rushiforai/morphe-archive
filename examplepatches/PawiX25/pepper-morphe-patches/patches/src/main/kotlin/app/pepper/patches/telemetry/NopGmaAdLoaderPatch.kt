package app.pepper.patches.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.pepper.patches.shared.PEPPER_FAMILY
import app.pepper.patches.shared.clearBody

/**
 * Cuts every public ad-load entry point in the Google Mobile Ads SDK by
 * replacing the method bodies with `return-void`. This sits one layer above
 * [nopGmaInitPatch] (`MobileAds.initialize`) — mitm / tcpdump capture on
 * 8.13.00 with patches 01–05 applied still showed continuous TLS ClientHello
 * traffic to:
 *
 *   googleads.g.doubleclick.net           (GMA SDK config + native ad fetch)
 *   csi.gstatic.com                       (GMA performance-instrumentation pings)
 *   pubads.g.doubleclick.net              (DFP ad-serve)
 *   ade.googlesyndication.com             (ad delivery)
 *   tpc.googlesyndication.com             (third-party content)
 *   pagead2.googlesyndication.com
 *   ad.doubleclick.net
 *   adx.g.doubleclick.net
 *   imasdk.googleapis.com                 (IMA SDK)
 *   securepubads.g.doubleclick.net
 *   gcdn.2mdn.net + r3---sn-*.c.2mdn.net  (GMP CDN — ad creative assets)
 *
 * Why patches 01 + 05 didn't already cover this:
 *   * patch 01 rewrites `const-string` URL constants in dex; GMA builds these
 *     hostnames at runtime from the encoded `zzz`-style byte[] config blob,
 *     so they never appear as `const-string` and never get rewritten.
 *   * patch 05 NOPs `MobileAds.initialize(...)`, but Pepper's native-ad path
 *     in `kfb.smali` (string `"callGoogleAdManager() loadAd() for "`) goes
 *     `new AdLoader$Builder(ctx, adUnitId).forCustomFormatAd(...).build()
 *      .loadAd(new AdManagerAdRequest$Builder().build())` — independent of
 *     `MobileAds.initialize`. Same for the Pubmatic→DFP bridge in
 *     `com.pubmatic.sdk.openwrap.eventhandler.dfp.DFPBannerEventHandler`,
 *     which calls `AdManagerAdView.loadAd(AdManagerAdRequest)` directly.
 *
 * Coverage — every public `load` / `loadAd` / `loadAds` returning `V` on the
 * GMS ad-load entry classes:
 *
 *   Lcom/google/android/gms/ads/AdLoader;
 *      loadAd(Lcom/google/android/gms/ads/AdRequest;)V
 *      loadAd(Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;)V
 *      loadAds(Lcom/google/android/gms/ads/AdRequest;I)V
 *
 *   Lcom/google/android/gms/ads/admanager/AdManagerAdView;
 *      loadAd(Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;)V
 *
 *   Lcom/google/android/gms/ads/admanager/AdManagerInterstitialAd;
 *      load(Landroid/content/Context;Ljava/lang/String;
 *           Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;
 *           Lcom/google/android/gms/ads/admanager/AdManagerInterstitialAdLoadCallback;)V  (static)
 *
 *   Lcom/google/android/gms/ads/rewarded/RewardedAd;
 *      load(Landroid/content/Context;Ljava/lang/String;
 *           Lcom/google/android/gms/ads/AdRequest;
 *           Lcom/google/android/gms/ads/rewarded/RewardedAdLoadCallback;)V              (static)
 *      load(Landroid/content/Context;Ljava/lang/String;
 *           Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;
 *           Lcom/google/android/gms/ads/rewarded/RewardedAdLoadCallback;)V              (static)
 *
 *   Lcom/google/android/gms/ads/rewardedinterstitial/RewardedInterstitialAd;
 *      load(Landroid/content/Context;Ljava/lang/String;
 *           Lcom/google/android/gms/ads/AdRequest;
 *           Lcom/google/android/gms/ads/rewardedinterstitial/RewardedInterstitialAdLoadCallback;)V  (static)
 *      load(Landroid/content/Context;Ljava/lang/String;
 *           Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;
 *           Lcom/google/android/gms/ads/rewardedinterstitial/RewardedInterstitialAdLoadCallback;)V  (static)
 *
 * Total: 9 methods. All return V, so the replacement is just `return-void` —
 * the caller (Pepper's `kfb`, Pubmatic DFP handler, mediation adapters, IMA
 * adapter) calls into a stub, no network is ever touched, no exception is
 * thrown, the load callback simply never fires.
 *
 * What about the listener never getting called?
 *   The callers don't enforce a timeout-error path. With the load body NOPped,
 *   Pepper's `OnNativeAdLoadedListener` / Pubmatic's `DFPConfigListener`
 *   simply never receive a result. Since Pepper's UI render path for native
 *   ads waits asynchronously on that callback and `HideAdsPatch` already
 *   hides the banner cell layout, the missing callback degrades gracefully
 *   (the cell stays in its hidden state). No UI freeze, no ANR.
 *
 * All target classes are kept by R8 via @Keep on the GMS public surface, so
 * we match by exact fully-qualified class type and method signature.
 */
@Suppress("unused")
val nopGmaAdLoaderPatch = bytecodePatch(
    name = "Disable Google Mobile Ads ad-load entry points",
    description = "Blocks Google's Ad SDK from fetching native ads after init.",
) {
    compatibleWith(*PEPPER_FAMILY)

    // Sits on top of the full GMA stack-cut. T1 strips tracker URL
    // constants, T2 neuters mediation auto-init providers, T4 silences
    // MobileAds.initialize. Without those upstream patches several
    // alternative ad-load paths remain open and the partially-cut graph
    // crashes at boot.
    dependsOn(redirectTrackerUrlsPatch, neuterTrackerProvidersPatch, nopGmaInitPatch)

    // type -> set of (methodName, methodReturnType="V")  with required parameter signatures
    data class Target(val methodName: String, val params: List<String>)

    val targets: Map<String, List<Target>> = mapOf(
        "Lcom/google/android/gms/ads/AdLoader;" to listOf(
            Target("loadAd", listOf("Lcom/google/android/gms/ads/AdRequest;")),
            Target("loadAd", listOf("Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;")),
            Target("loadAds", listOf("Lcom/google/android/gms/ads/AdRequest;", "I")),
        ),
        "Lcom/google/android/gms/ads/admanager/AdManagerAdView;" to listOf(
            Target("loadAd", listOf("Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;")),
        ),
        "Lcom/google/android/gms/ads/admanager/AdManagerInterstitialAd;" to listOf(
            Target("load", listOf(
                "Landroid/content/Context;",
                "Ljava/lang/String;",
                "Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;",
                "Lcom/google/android/gms/ads/admanager/AdManagerInterstitialAdLoadCallback;",
            )),
        ),
        "Lcom/google/android/gms/ads/rewarded/RewardedAd;" to listOf(
            Target("load", listOf(
                "Landroid/content/Context;",
                "Ljava/lang/String;",
                "Lcom/google/android/gms/ads/AdRequest;",
                "Lcom/google/android/gms/ads/rewarded/RewardedAdLoadCallback;",
            )),
            Target("load", listOf(
                "Landroid/content/Context;",
                "Ljava/lang/String;",
                "Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;",
                "Lcom/google/android/gms/ads/rewarded/RewardedAdLoadCallback;",
            )),
        ),
        "Lcom/google/android/gms/ads/rewardedinterstitial/RewardedInterstitialAd;" to listOf(
            Target("load", listOf(
                "Landroid/content/Context;",
                "Ljava/lang/String;",
                "Lcom/google/android/gms/ads/AdRequest;",
                "Lcom/google/android/gms/ads/rewardedinterstitial/RewardedInterstitialAdLoadCallback;",
            )),
            Target("load", listOf(
                "Landroid/content/Context;",
                "Ljava/lang/String;",
                "Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;",
                "Lcom/google/android/gms/ads/rewardedinterstitial/RewardedInterstitialAdLoadCallback;",
            )),
        ),
    )

    execute {
        classDefForEach { classDef ->
            val classTargets = targets[classDef.type] ?: return@classDefForEach
            val mutableClass = mutableClassDefBy(classDef)

            mutableClass.methods.forEach methodLoop@{ method ->
                if (method.returnType != "V") return@methodLoop
                classTargets.firstOrNull { t ->
                    t.methodName == method.name && t.params == method.parameterTypes
                } ?: return@methodLoop

                // Wipe the body in place: `method.implementation` is `val` in
                // morphe-patcher so we can't assign a fresh impl like ReVanced
                // did. removeInstructions(0, N) deletes the body; the original
                // try/catch table is also dropped by the patcher when the only
                // remaining instruction is the new return-void.
                method.clearBody()
                method.addInstructions(0, "return-void")
            }
        }
    }
}
