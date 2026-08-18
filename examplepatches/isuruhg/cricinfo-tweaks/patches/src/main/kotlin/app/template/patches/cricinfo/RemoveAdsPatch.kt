package app.template.patches.cricinfo

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_CRICINFO

/**
 * ESPNcricinfo is a Flutter app (CiMainActivity extends FlutterFragmentActivity;
 * the UI and ad-placement logic live in AOT-compiled Dart inside lib/.../libapp.so,
 * which bytecode patching cannot touch). However, every ad must cross from Dart into
 * the native Android ad SDKs through the Flutter plugin glue, and that glue *is* in
 * the DEX with its original (non-obfuscated) class names. We sever ads there:
 *
 *  1. google_mobile_ads plugin -- io.flutter.plugins.googlemobileads.FlutterAdLoader
 *     is the single choke point for interstitial, native, rewarded, rewarded-
 *     interstitial and app-open loads (both AdMob and Ad Manager variants). Every
 *     loadXxx(...) method is void; a return-void at the top means the load request is
 *     never issued, so nothing is fetched from GAM and no callback ever fires.
 *
 *  2. Banners are platform views whose FlutterAd*BannerAd.load() builds the AdView and
 *     calls .e(request). No-op load() so the AdView is never created or requested.
 *     (FluidAdManagerBannerAd inherits FlutterAdManagerBannerAd.load(), so it's covered.)
 *
 *  3. SDK initializers (androidx.startup) -- skip initialization of Google Mobile Ads
 *     (+ Teads mediation), Meta Audience Network and Taboola. Google Mobile Ads also
 *     self-initializes via its own ContentProvider, which is why step 1 is the real
 *     ad-killer; neutralizing the initializers additionally stops Meta and Taboola
 *     (which require an explicit init with publisher info) and Teads mediation.
 */
@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Stops ESPNcricinfo from fetching or showing banner, interstitial, " +
        "native, rewarded and app-open ads (Google Ad Manager, Meta Audience Network, " +
        "Taboola) by severing the Flutter ad plugins and skipping the ad SDK setup.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CRICINFO)
    extendWith("extensions/extension.mpe")

    execute {
        // Return Boolean.TRUE from an androidx.startup Initializer.create(Context):
        // androidx Startup treats init as successful, but the SDK setup never runs.
        val returnTrue = """
            sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
            return-object v0
        """

        // 1. google_mobile_ads: no-op every FlutterAdLoader.loadXxx(...) (all void).
        mutableClassDefByOrNull("Lio/flutter/plugins/googlemobileads/FlutterAdLoader;")
            ?.methods
            ?.filter { it.name.startsWith("load") }
            ?.forEach { it.addInstructions(0, "return-void") }

        // 2. Inline ad slots (banners + native). Skipping the load silently would leave
        // the Dart widget waiting forever, so the app keeps the slot's reserved height
        // and the user sees an empty grey box. Instead report a "no fill" -- the same
        // signal a real unsold GAM slot delivers -- so the app runs its own no-fill
        // path and collapses the slot. The helper is reflective and fully guarded, and
        // needs only p0, so it fits regardless of how few registers load() has.
        for (inlineAdClass in listOf(
            "Lio/flutter/plugins/googlemobileads/FlutterAdManagerBannerAd;", // GAM + Fluid (inherited)
            "Lio/flutter/plugins/googlemobileads/FlutterBannerAd;",          // AdMob
            "Lio/flutter/plugins/googlemobileads/FlutterNativeAd;",          // in-feed native
        )) {
            mutableClassDefByOrNull(inlineAdClass)
                ?.methods
                ?.filter { it.name == "load" && it.parameterTypes.isEmpty() }
                ?.forEach {
                    it.addInstructions(
                        0,
                        """
                            invoke-static { p0 }, Lapp/template/extension/ads/AdFailure;->reportNoFill(Ljava/lang/Object;)V
                            return-void
                        """,
                    )
                }
        }

        // 2b. Adaptive banner sizing. Dart asks the native side how tall an adaptive
        // banner would be; the plugin already answers null when the computed size is
        // AdSize.INVALID, and the google_mobile_ads pattern is to skip building the ad
        // entirely when that lookup returns null. Force these to INVALID so adaptive
        // slots are never even constructed.
        //
        // AdSize.INVALID is `new AdSize(0, 0, "invalid")` -- the 2-arg constructor
        // builds a different name ("0x0_as"), which would not compare equal, so the
        // 3-arg form is used. The AdSize type is read from the method's own return
        // type, since it is obfuscated and renamed between app versions.
        mutableClassDefByOrNull("Lio/flutter/plugins/googlemobileads/FlutterAdSize\$AdSizeFactory;")
            ?.methods
            ?.filter { it.name.contains("AdaptiveBannerAdSize") }
            ?.forEach { method ->
                val adSizeType = method.returnType
                method.addInstructions(
                    0,
                    """
                        const/4 v0, 0x0
                        const-string v1, "invalid"
                        new-instance v2, $adSizeType
                        invoke-direct { v2, v0, v0, v1 }, $adSizeType-><init>(IILjava/lang/String;)V
                        return-object v2
                    """,
                )
            }

        // 3. Skip ad-SDK initialization entirely.
        for (initializer in listOf(
            "Lcom/cricinfo/app/android/initializers/CiAppInitializerGoogleAds;",  // GMA + Teads
            "Lcom/cricinfo/app/android/initializers/CiAudienceNetworkInitializer;", // Meta
            "Lcom/cricinfo/app/android/initializers/CiAppInitializerTaboola;",     // Taboola
        )) {
            mutableClassDefByOrNull(initializer)
                ?.methods
                ?.filter { it.name == "create" }
                ?.forEach { it.addInstructions(0, returnTrue) }
        }
    }
}
