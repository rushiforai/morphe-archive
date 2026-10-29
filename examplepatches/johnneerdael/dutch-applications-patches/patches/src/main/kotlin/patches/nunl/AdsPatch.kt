package patches.nunl

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

private val adResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { doc ->
            doc.one("com.google.android.gms.ads.MobileAdsInitProvider").setAttributeNS(ANDROID,"android:enabled","false")
        }
    }
}

@Suppress("unused")
val hideAds = bytecodePatch(
    name = "Hide ads",
    description = "Removes DPG banner loading/space, VACS/IMA video ads and explicit sponsored/NUshop content while retaining editorial links and video playlists.",
) {
    dependsOn(originalInput)
    compatibleWith(nunl)
    dependsOn(adResources, privacyWebRequestExtension)
    execute {
        exact("Lnl/nu/android/banners/initializer/AdvertisementInitializer;", "onApplicationCreate", "V").method.addInstructions(0, "return-void")
        exact("Lnl/nu/android/bff/presentation/views/blocks/viewholders/composables/dpg_banner_block/DpgBannerBlockViewHolder;", "getAdvertisementToDisplay", "Landroid/view/ViewGroup;").method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        exact("Lnl/nu/android/banners/MobileAdvertisingManager;", "loadAd", "Landroid/view/ViewGroup;", "Landroid/content/Context;", "Landroidx/lifecycle/LifecycleOwner;", "Ljava/util/Map;", "Ljava/util/Map;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/util/Map;", "Lkotlin/jvm/functions/Function0;", "Lkotlin/jvm/functions/Function1;").method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        exact("Lnl/nu/android/tracking/vacs/VacsVideoEventTracker;", "requestVacsUrl", "Ljava/lang/Object;", "Ljava/lang/String;", "Ljava/lang/String;", "Lkotlin/coroutines/Continuation;").method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        exact("Lnl/nu/android/bff/data/video/ImaAdvertisingFactory;", "createVmapImaAdvertisingConfig", "Lcom/jwplayer/pub/api/configuration/ads/ima/ImaVmapAdvertisingConfig;", "Ljava/lang/String;").method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        installCommercialFilter()
        installWebRequestPolicy()
        installPrivacyWebClient()
    }
}
