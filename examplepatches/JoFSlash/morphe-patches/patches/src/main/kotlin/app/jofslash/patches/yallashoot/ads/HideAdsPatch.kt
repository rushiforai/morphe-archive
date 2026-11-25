package app.jofslash.patches.yallashoot.ads

import app.jofslash.patches.yallashoot.shared.Constants.ADS_PLUGIN
import app.jofslash.patches.yallashoot.shared.Constants.COMPATIBILITY_YALLA_SHOOT
import app.jofslash.patches.yallashoot.shared.editManifest
import app.jofslash.patches.yallashoot.shared.methodOf
import app.jofslash.patches.yallashoot.shared.removeNamed
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

// The google_mobile_ads Flutter plugin. Dart asks it for every ad over one method channel, and
// onMethodCall(MethodCall, Result) answers: "MobileAds#initialize" starts the Google Mobile Ads SDK
// and with it every mediation network, "loadBannerAd", "loadNativeAd", "loadInterstitialAd" and
// "loadRewardedAd" (the ones the app uses) build and load an ad.
private const val PLUGIN = "$ADS_PLUGIN/GoogleMobileAdsPlugin;"
private const val INSTANCE_MANAGER = "$ADS_PLUGIN/AdInstanceManager;"
private const val LOAD_AD_ERROR = "$ADS_PLUGIN/FlutterAd\$FlutterLoadAdError;"
private const val RESPONSE_INFO = "$ADS_PLUGIN/FlutterAd\$FlutterResponseInfo;"
private const val METHOD_CALL = "Lio/flutter/plugin/common/MethodCall;"
private const val RESULT = "Lio/flutter/plugin/common/MethodChannel\$Result;"

private val hideAdsResourcePatch = resourcePatch {
    execute {
        editManifest {
            // Content providers the ad networks use to start themselves with the app, before any ad
            // is asked for: AppLovin's, Liftoff's (Vungle) and Meta Audience Network's, which loads
            // the network's own code from assets/audience_network. They only serve ads.
            it.removeNamed(
                "provider",
                setOf(
                    "com.applovin.sdk.AppLovinInitProvider",
                    "com.vungle.ads.VungleProvider",
                    "com.facebook.ads.AudienceNetworkContentProvider",
                )
            )
        }
    }
}

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Hides the banners, the native ads, the full-screen ads and the rewarded video ads, and " +
            "never starts the ad networks (Google AdMob with AppLovin, Meta, Pangle, Liftoff and DT Exchange). " +
            "The subscription and any paid feature aren't touched.",
    default = true
) {
    category("Ads")
    compatibleWith(COMPATIBILITY_YALLA_SHOOT)

    dependsOn(hideAdsResourcePatch)

    execute {
        // MobileAds#initialize fails: the app logs "Mobile Ads init failed" and skips every banner,
        // native, interstitial and rewarded ad load from then on, as it does when the SDK can't
        // start, so nothing of the SDK or the mediation networks is started. Should an ad be asked
        // for anyway (a "load...Ad" call), it is never built: Dart gets the call answered and the
        // ad's "failed to load" event with AdMob's "no fill" (code 3), as for an empty ad slot.
        // The method has 25 locals, so p0-p2 are v25-v27: they are copied to low registers first,
        // as iget-object and invoke-* (non-range) only take v0-v15.
        methodOf(PLUGIN, "onMethodCall", listOf(METHOD_CALL, RESULT)).addInstructionsWithLabels(
            0,
            """
                move-object/from16 v7, p0
                move-object/from16 v8, p1
                move-object/from16 v9, p2
                iget-object v0, v8, $METHOD_CALL->method:Ljava/lang/String;
                if-eqz v0, :original

                const-string v1, "MobileAds#initialize"
                invoke-virtual { v1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v1
                if-eqz v1, :load
                const-string v0, "AdsRemoved"
                const-string v1, "Ads are removed by a Morphe patch"
                const/4 v2, 0x0
                invoke-interface { v9, v0, v1, v2 }, $RESULT->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
                return-void

                :load
                const-string v1, "load"
                invoke-virtual { v0, v1 }, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
                move-result v1
                if-eqz v1, :original
                iget-object v1, v7, $PLUGIN->instanceManager:$INSTANCE_MANAGER
                if-eqz v1, :original
                const-string v0, "adId"
                invoke-virtual { v8, v0 }, $METHOD_CALL->argument(Ljava/lang/String;)Ljava/lang/Object;
                move-result-object v0
                instance-of v2, v0, Ljava/lang/Integer;
                if-eqz v2, :answer
                check-cast v0, Ljava/lang/Integer;
                invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
                move-result v0
                new-instance v2, $LOAD_AD_ERROR
                const/4 v3, 0x3
                const-string v4, "com.google.android.gms.ads"
                const-string v5, "No fill."
                const/4 v6, 0x0
                invoke-direct { v2, v3, v4, v5, v6 }, $LOAD_AD_ERROR-><init>(ILjava/lang/String;Ljava/lang/String;$RESPONSE_INFO)V
                invoke-virtual { v1, v0, v2 }, $INSTANCE_MANAGER->onAdFailedToLoad(I$LOAD_AD_ERROR)V
                :answer
                const/4 v0, 0x0
                invoke-interface { v9, v0 }, $RESULT->success(Ljava/lang/Object;)V
                return-void

                :original
                nop
            """
        )
    }
}
