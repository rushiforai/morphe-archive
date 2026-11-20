package app.jaybyte.patches.ifunny.ads

import app.jaybyte.patches.ifunny.shared.Constants.COMPATIBILITY_IFUNNY
import app.jaybyte.patches.ifunny.shared.Constants.EXTENSION
import app.jaybyte.patches.ifunny.shared.Constants.EXTENSION_PKG
import app.jaybyte.patches.ifunny.shared.editManifest
import app.jaybyte.patches.ifunny.shared.stubAll
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.util.returnEarly
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction20t
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

@Suppress("unused")
val blockAdsPatch = patch(
    name = "Block ads",
    description = "Stops all bundled ad SDKs from initialising or loading ads (AppLovin MAX, AdMob, Meta, " +
        "Prebid, BidMachine, Smaato, InMobi, Fyber, Unity, Pangle, BIGO, Vungle, Moloco, Amazon, Nimbus) " +
        "and removes the empty banner space. Premium is not unlocked.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IFUNNY)

    execute {
        // SDK initialisation.
        stubAll("Lcom/applovin/sdk/AppLovinSdk;", "initialize")
        stubAll("Lcom/google/android/gms/ads/MobileAds;", "initialize")
        stubAll("Lcom/facebook/ads/AudienceNetworkAds;", "initialize")
        stubAll("Lorg/prebid/mobile/PrebidMobile;", "initializeSdk")
        stubAll("Lio/bidmachine/BidMachine;", "initialize")
        stubAll("Lcom/smaato/sdk/core/SmaatoSdk;", "init")
        stubAll("Lcom/inmobi/sdk/InMobiSdk;", "init")
        stubAll("Lcom/inmobi/unifiedId/InMobiUnifiedIdService;", "fetchUnifiedIds")
        stubAll("Lcom/fyber/inneractive/sdk/external/InneractiveAdManager;", "initialize")
        stubAll("Lcom/unity3d/ads/UnityAds;", "initialize")
        stubAll("Lcom/bytedance/sdk/openadsdk/api/init/PAGSdk;", "init")
        stubAll("Lsg/bigo/ads/BigoAdSdk;", "initialize")
        stubAll("Lcom/vungle/ads/VungleAds;", "init")
        stubAll("Lcom/moloco/sdk/publisher/Moloco;", "initialize")

        // Ad loading.
        stubAll("Lcom/applovin/mediation/ads/MaxInterstitialAd;", "loadAd", "isReady")
        stubAll("Lcom/applovin/mediation/ads/MaxAdView;", "loadAd", "startAutoRefresh")
        stubAll("Lcom/applovin/mediation/nativeAds/MaxNativeAdLoader;", "loadAd")
        stubAll("Lcom/applovin/mediation/ads/MaxRewardedAd;", "loadAd")
        stubAll("Lcom/applovin/mediation/ads/MaxAppOpenAd;", "loadAd")
        stubAll("Lcom/google/android/gms/ads/interstitial/InterstitialAd;", "load")
        stubAll("Lcom/google/android/gms/ads/appopen/AppOpenAd;", "load")
        stubAll("Lcom/google/android/gms/ads/rewarded/RewardedAd;", "load")
        stubAll("Lcom/google/android/gms/ads/BaseAdView;", "loadAd")
        stubAll("Lcom/google/android/gms/ads/AdLoader;", "loadAd", "loadAds")
        stubAll("Lcom/facebook/ads/NativeAdBase;", "loadAd")
        stubAll("Lcom/facebook/ads/InterstitialAd;", "loadAd")
        stubAll("Lorg/prebid/mobile/api/rendering/BannerViewPrefetched;", "loadAd")
        stubAll("Lorg/prebid/mobile/api/rendering/BannerView;", "loadAd")
        stubAll("Lorg/prebid/mobile/AdUnit;", "fetchDemand")
        stubAll("Lio/bidmachine/AdRequest;", "request")
        stubAll("Lio/bidmachine/AdView;", "load", returnThis = true)
        stubAll("Lcom/smaato/sdk/banner/widget/BannerView;", "loadAd")
        stubAll("Lcom/amazon/device/ads/DTBAdInterstitial;", "fetchAd")
        // Only the public overload; the private ones are its implementation.
        mutableClassDefBy("Lcom/amazon/device/ads/DTBAdRequest;").methods
            .filter { it.name == "loadAd" && it.parameterTypes.map(Any::toString) == listOf("Lcom/amazon/device/ads/DTBAdCallback;") }
            .forEach { it.returnEarly() }
        stubAll("Lcom/adsbynimbus/NimbusAdManager;", "c")
        mutableClassDefBy("Lcom/adsbynimbus/render/Renderer\$Companion;").methods
            .filter { it.returnType == "V" && it.parameterTypes.firstOrNull()?.toString() == "Lcom/adsbynimbus/NimbusAd;" }
            .forEach { it.returnEarly() }
        mutableClassDefBy("Lcom/adsbynimbus/request/VungleDemandProvider;").methods
            .filter { it.returnType == "V" && it.parameterTypes.firstOrNull()?.toString() == "Ljava/lang/String;" }
            .forEach { it.returnEarly() }
        mutableClassDefBy("Lcom/adsbynimbus/request/FANDemandProvider;").methods
            .filter { it.returnType == "V" && it.parameterTypes.firstOrNull()?.toString() == "Landroid/content/Context;" }
            .forEach { it.returnEarly() }

        // Auto-init components.
        editManifest {
            disableComponents(
                "com.google.android.gms.ads.MobileAdsInitProvider",
                "com.yandex.mobile.ads.core.initializer.YandexAdsInitializeProvider",
                "com.vungle.ads.VungleProvider",
                "com.facebook.ads.AudienceNetworkContentProvider",
                "com.applovin.sdk.AppLovinInitProvider",
                "sg.bigo.ads.controller.provider.BigoAdsProvider",
                "com.mbridge.msdk.config.component.status.MBComponentLifecycleProvider",
                "com.mbridge.msdk.foundation.same.broadcast.NetWorkChangeReceiver",
            )
            removeMetaData("com.unity3d.services.core.configuration.AdsSdkInitializer")
        }

        // Collapse the reserved banner slot under the bottom bar.
        resourceXml("res/values/dimens.xml").use { dimens ->
            listOf("banner_ad_height", "banner_ad_height_65", "banner_ad_height_100").forEach {
                dimens.resource(it).text = "0.0dp"
            }
        }
        resourceXml("res/layout/ad_frame.xml").use { it.root.setAttribute("android:visibility", "gone") }
    }
}

@Suppress("unused")
val hidePromoCardsPatch = patch(
    name = "Hide promo cards",
    description = "Removes Premium trial promo cards, surveys, \"ask to smile\" prompts and the inline " +
        "push-notification request from the feed. Content cards are kept.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IFUNNY)
    extendWith(EXTENSION)

    execute {
        ExtraElementCriterionFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-virtual {p1}, Lmobi/ifunny/rest/content/extraElements/ExtraElement;->getType()Ljava/lang/String;
                    move-result-object v0
                    invoke-static {v0}, $EXTENSION_PKG/NagFilter;->isBlocked(Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :jb_allowed
                    const/4 v0, 0x0
                    return v0
                """,
                ExternalLabel("jb_allowed", getInstruction(0)),
            )
        }
    }
}

@Suppress("unused")
val hidePremiumUpsellsPatch = patch(
    name = "Hide Premium upsells",
    description = "Hides the \"Hide ads\" tab and badge, the Boost post button and the Premium / Trial / " +
        "limited-time-offer entries in the toolbar and side menu. Does not unlock Premium.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IFUNNY)

    execute {
        HideAdsTabAttachFingerprint.method.returnEarly()
        HideCommentsAdsBadgeFingerprint.method.returnEarly(false)
        BoostUpsellEnabledFingerprint.method.returnEarly(false)
        GalleryBoostButtonFingerprint.method.returnEarly(false)

        MainEntryTitleStatusFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lmobi/ifunny/app/subscription/MainEntryTitleStatus${'$'}DISABLED;->a:Lmobi/ifunny/app/subscription/MainEntryTitleStatus${'$'}DISABLED;
                return-object v0
            """,
        )
        Paywall4EntryStatusFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Lmobi/ifunny/app/subscription/paywall4/Paywall4PremiumEntryStatus${'$'}DISABLED;->a:Lmobi/ifunny/app/subscription/paywall4/Paywall4PremiumEntryStatus${'$'}DISABLED;
                return-object v0
            """,
        )

        // Side menu: skip the PREMIUM / LTO / TRIAL items (MY_PREMIUM for subscribers is kept).
        val menuItemType = "Lmobi/ifunny/menu/MenuItem;"
        val enumFields = enumFieldNames(menuItemType, setOf("PREMIUM", "LTO", "TRIAL"))
        check(enumFields.size == 3) { "MenuItem enum fields not found: $enumFields" }

        var skipped = 0
        val transformer = "Lmobi/ifunny/menu/ui/transformers/MenuStateToViewModelTransformer;"
        mutableClassDefBy(transformer).methods.forEach { method ->
            val impl = method.implementation ?: return@forEach
            val insns = impl.instructions.toList()
            insns.withIndex()
                .filter { (_, insn) ->
                    insn.opcode == Opcode.SGET_OBJECT &&
                        ((insn as ReferenceInstruction).reference as FieldReference).let {
                            it.definingClass == menuItemType && it.name in enumFields
                        }
                }
                .forEach { (index, _) ->
                    // The first if-eqz after reading the item guards "add this menu entry".
                    val guardIndex = (index + 1 until minOf(index + 12, insns.size))
                        .firstOrNull { insns[it].opcode == Opcode.IF_EQZ } ?: return@forEach
                    val target = (impl.instructions[guardIndex] as BuilderOffsetInstruction).target
                    impl.replaceInstruction(guardIndex, BuilderInstruction20t(Opcode.GOTO_16, target))
                    skipped++
                }
        }
        check(skipped == 3) { "Expected to skip 3 Premium menu items, skipped $skipped" }
    }
}

/** Resolve obfuscated enum constant field names from the enum's static initializer. */
private fun enumFieldNames(enumType: String, constants: Set<String>): Set<String> {
    val clinit = classDefBy(enumType).methods.first { it.name == "<clinit>" }
    val insns = clinit.implementation!!.instructions.toList()
    val result = mutableSetOf<String>()
    insns.forEachIndexed { i, insn ->
        val str = ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string ?: return@forEachIndexed
        if (str !in constants) return@forEachIndexed
        (i + 1 until insns.size).map { insns[it] }
            .firstOrNull { it.opcode == Opcode.SPUT_OBJECT }
            ?.let { result += ((it as ReferenceInstruction).reference as FieldReference).name }
    }
    return result
}
