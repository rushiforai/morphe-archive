package app.template.patches.themezy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags

private val THEMEZY = Compatibility(
    name = "Themezy",
    packageName = "com.themezy.theme.iconwidgets",
    apkFileType = ApkFileType.APKS_REQUIRED,
    appIconColor = 0x7C4DFF,
    targets = listOf(AppTarget(version = "1.0.9", versionCode = 9)),
)

// ── Master gates (Firebase + placement) ───────────────────────

private object EnableAllAdsFingerprint : Fingerprint(
    definingClass = "Lcom/leansoft/ads/AdConfig;",
    name = "enableAllAds",
    returnType = "Z",
    parameters = listOf(),
)

private object AdConfigEnablePlacementFingerprint : Fingerprint(
    definingClass = "Lcom/leansoft/ads/AdConfig;",
    name = "adEnablePlacement",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
)

private object C1AdEnablePlacementFingerprint : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "adEnablePlacement",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
)

private object CheckCanShowAdResumeFingerprint : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "checkCanShowAdResume",
    returnType = "Z",
    parameters = listOf(),
)

private object GetCanShowAdResumeFingerprint : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "getCanShowAdResume",
    returnType = "Z",
    parameters = listOf(),
)

// ── C1 show methods (with callbacks where needed) ─────────────

private object ShowInterAd1 : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "showInterAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lkotlin/jvm/functions/Function1;"),
)

private object ShowInterAd2 : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "showInterAd",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;", "Z", "Z", "Ljava/lang/Long;", "Lkotlin/jvm/functions/Function1;",
    ),
)

private object ShowInterNativeAd1 : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "showInterNativeAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lkotlin/jvm/functions/Function1;"),
)

private object ShowInterNativeAd2 : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "showInterNativeAd",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;", "Z", "Z", "Ljava/lang/Long;", "Lkotlin/jvm/functions/Function1;",
    ),
)

private object ShowInterRewardAd : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "showInterRewardAd",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;", "Lkotlin/jvm/functions/Function0;", "Lkotlin/jvm/functions/Function1;",
    ),
)

private object ShowRewardAd : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "showRewardAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Z", "Lkotlin/jvm/functions/Function1;"),
)

private object ShowAppOpenAd : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "showAppOpenAd",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;", "Ljava/lang/Long;", "Z", "Lkotlin/jvm/functions/Function1;",
    ),
)

private object ShowNativeFullDialog1 : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "showNativeFullDialog",
    returnType = "V",
    parameters = listOf(
        "Landroidx/fragment/app/FragmentManager;", "Ljava/lang/String;", "Lkotlin/jvm/functions/Function0;",
    ),
)

private object ShowNativeFullDialog2 : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "showNativeFullDialog",
    returnType = "V",
    parameters = listOf(
        "Landroidx/fragment/app/FragmentManager;", "Ljava/lang/String;", "Z", "Lkotlin/jvm/functions/Function0;",
    ),
)

private object ShowLoadingAdDialog : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "showLoadingAdDialog",
    returnType = "V",
    parameters = listOf(),
)

// ── Preload ───────────────────────────────────────────────────

private object PreloadAppOpenAd : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "preloadAppOpenAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

private object PreloadBannerAd1 : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "preloadBannerAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

private object PreloadBannerAd2 : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "preloadBannerAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Z"),
)

private object PreloadInterAd1 : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "preloadInterAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

private object PreloadInterAd2 : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "preloadInterAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lkotlin/jvm/functions/Function1;"),
)

private object PreloadInterRewardAd : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "preloadInterRewardAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

private object PreloadNativeAd1 : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "preloadNativeAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

private object PreloadNativeAd2 : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "preloadNativeAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "I", "Z"),
)

private object PreloadRewardAd1 : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "preloadRewardAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

private object PreloadRewardAd2 : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "preloadRewardAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lkotlin/jvm/functions/Function1;"),
)

private object ForceLoadNativeAd : Fingerprint(
    definingClass = "Lcom/leansoft/ads/C1;",
    name = "forceLoadNativeAd",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;", "Lcom/leansoft/ads/interfaces/AdStatusChangeListener;",
    ),
)

private object ShowAdNativeCollapsible : Fingerprint(
    definingClass = "Lcom/themezy/theme/iconwidgets/base/BaseFragment;",
    name = "showAdNativeCollapsible",
    returnType = "V",
    parameters = listOf(
        "Lcom/leansoft/ads/view/NativeAdViewContainer;",
        "Lcom/themezy/theme/iconwidgets/ads/AdPlacement;",
        "J",
    ),
)

// AppLovin backup
private object MaxInterstitialShow : Fingerprint(
    definingClass = "Lcom/applovin/mediation/ads/MaxInterstitialAd;",
    name = "showAd",
    returnType = "V",
)
private object MaxInterstitialLoad : Fingerprint(
    definingClass = "Lcom/applovin/mediation/ads/MaxInterstitialAd;",
    name = "loadAd",
    returnType = "V",
)
private object MaxRewardedShow : Fingerprint(
    definingClass = "Lcom/applovin/mediation/ads/MaxRewardedAd;",
    name = "showAd",
    returnType = "V",
)
private object MaxRewardedLoad : Fingerprint(
    definingClass = "Lcom/applovin/mediation/ads/MaxRewardedAd;",
    name = "loadAd",
    returnType = "V",
)
private object MaxInterstitialIsReady : Fingerprint(
    definingClass = "Lcom/applovin/mediation/ads/MaxInterstitialAd;",
    name = "isReady",
    returnType = "Z",
)
private object MaxRewardedIsReady : Fingerprint(
    definingClass = "Lcom/applovin/mediation/ads/MaxRewardedAd;",
    name = "isReady",
    returnType = "Z",
)

/** Invoke Function1 with Boolean.TRUE then return (so UI does not hang). */
private fun invokeBoolCallbackThenReturn(paramIndex: Int): String = """
    const/4 v0, 0x1
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v0
    invoke-interface {p$paramIndex, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
    return-void
""".trimIndent()

/** Invoke Function0 then return. */
private fun invokeUnitCallbackThenReturn(paramIndex: Int): String = """
    invoke-interface {p$paramIndex}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;
    return-void
""".trimIndent()

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide Ads",
    description = "Turns off every ad gate and every show/preload path in Themezy.",
    default = true,
) {
    compatibleWith(THEMEZY)

    execute {
        // Gates off
        runCatching { EnableAllAdsFingerprint.method.returnEarly(false) }
        runCatching { AdConfigEnablePlacementFingerprint.method.returnEarly(false) }
        runCatching { C1AdEnablePlacementFingerprint.method.returnEarly(false) }
        runCatching { CheckCanShowAdResumeFingerprint.method.returnEarly(false) }
        runCatching { GetCanShowAdResumeFingerprint.method.returnEarly(false) }

        // Show with callback → fire success so flow continues without ad
        // showInterAd(String, Function1) → p2
        runCatching {
            ShowInterAd1.method.addInstructions(0, invokeBoolCallbackThenReturn(2))
        }
        // showInterAd(String, Z, Z, Long, Function1) → p5
        runCatching {
            ShowInterAd2.method.addInstructions(0, invokeBoolCallbackThenReturn(5))
        }
        runCatching {
            ShowInterNativeAd1.method.addInstructions(0, invokeBoolCallbackThenReturn(2))
        }
        runCatching {
            ShowInterNativeAd2.method.addInstructions(0, invokeBoolCallbackThenReturn(5))
        }
        // showInterRewardAd(String, Function0, Function1) → invoke Function0 (reward) then Function1
        runCatching {
            ShowInterRewardAd.method.addInstructions(
                0,
                """
                    invoke-interface {p2}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;
                    const/4 v0, 0x1
                    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
                    move-result-object v0
                    invoke-interface {p3, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;
                    return-void
                """.trimIndent(),
            )
        }
        // showRewardAd(String, Z, Function1) → p3
        runCatching {
            ShowRewardAd.method.addInstructions(0, invokeBoolCallbackThenReturn(3))
        }
        // showAppOpenAd(..., Function1) → p4
        runCatching {
            ShowAppOpenAd.method.addInstructions(0, invokeBoolCallbackThenReturn(4))
        }
        // showNativeFullDialog → Function0
        runCatching {
            ShowNativeFullDialog1.method.addInstructions(0, invokeUnitCallbackThenReturn(3))
        }
        runCatching {
            ShowNativeFullDialog2.method.addInstructions(0, invokeUnitCallbackThenReturn(4))
        }
        runCatching { ShowLoadingAdDialog.method.returnEarly() }
        runCatching { ShowAdNativeCollapsible.method.returnEarly() }

        // Preload: just no-op
        runCatching { PreloadAppOpenAd.method.returnEarly() }
        runCatching { PreloadBannerAd1.method.returnEarly() }
        runCatching { PreloadBannerAd2.method.returnEarly() }
        runCatching { PreloadInterAd1.method.returnEarly() }
        runCatching { PreloadInterAd2.method.returnEarly() }
        runCatching { PreloadInterRewardAd.method.returnEarly() }
        runCatching { PreloadNativeAd1.method.returnEarly() }
        runCatching { PreloadNativeAd2.method.returnEarly() }
        runCatching { PreloadRewardAd1.method.returnEarly() }
        runCatching { PreloadRewardAd2.method.returnEarly() }
        runCatching { ForceLoadNativeAd.method.returnEarly() }

        // AppLovin backup
        runCatching { MaxInterstitialShow.method.returnEarly() }
        runCatching { MaxInterstitialLoad.method.returnEarly() }
        runCatching { MaxRewardedShow.method.returnEarly() }
        runCatching { MaxRewardedLoad.method.returnEarly() }
        runCatching { MaxInterstitialIsReady.method.returnEarly(false) }
        runCatching { MaxRewardedIsReady.method.returnEarly(false) }
    }
}
