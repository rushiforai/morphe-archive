package app.diskwala.patches.ad

import app.diskwala.patches.shared.Constants.COMPATIBILITY_DISKWALA
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * Disables ads by stubbing SDK initializers and React Native bridge ad calls.
 * Design: early return with safe defaults so callers do not crash.
 * - Init providers: return true immediately without calling SDK init
 * - Bridge load/show: return-void without delegating to impl (no ad request)
 * - Bridge isReady: resolve Promise with false (ad not ready) then return
 */
@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Stubs AppLovin, AdMob, InMobi and other ad SDKs at the bytecode level to prevent ads from loading without breaking the app.",
    default = true
) {
    compatibleWith(COMPATIBILITY_DISKWALA)

    execute {
        fun stubBooleanProvider(fingerprint: Fingerprint) = runCatching {
            fingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }

        fun stubVoid(fingerprint: Fingerprint) = runCatching {
            fingerprint.method.addInstructions(0, "return-void")
        }

        fun stubReadiness(fingerprint: Fingerprint) = runCatching {
            fingerprint.method.addInstructions(
                0,
                """
                    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                    return-void
                """
            )
        }

        // 1) Stub InitProviders - prevent native SDK init.
        stubBooleanProvider(AppLovinInitProviderFingerprint)
        stubBooleanProvider(InMobiInitProviderFingerprint)
        stubBooleanProvider(MobileAdsInitProviderFingerprint)

        // Best-effort Yandex init provider.
        runCatching {
            val yandex = Fingerprint(
                definingClass = "Lcom/yandex/mobile/ads/core/initializer/YandexAdsInitializeProvider;",
                name = "onCreate",
                returnType = "Z"
            )
            stubBooleanProvider(yandex)
        }

        // 2) Stub React Native AppLovin MAX bridge - void methods -> return-void.
        //    The initialize bridge resolves the JS promise so the RN side continues without the SDK.
        runCatching {
            AppLovinMAXInitializeFingerprint.method.addInstructions(
                0,
                """
                    const-string v0, "stub_initialized"
                    invoke-interface {p3, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
                    return-void
                """
            )
        }
        stubVoid(AppLovinMAXLoadInterstitialFingerprint)
        stubVoid(AppLovinMAXShowInterstitialFingerprint)
        stubVoid(AppLovinMAXLoadRewardedAdFingerprint)
        stubVoid(AppLovinMAXShowRewardedAdFingerprint)
        stubVoid(AppLovinMAXLoadAppOpenAdFingerprint)
        stubVoid(AppLovinMAXShowAppOpenAdFingerprint)
        stubVoid(AppLovinMAXCreateBannerFingerprint)
        stubVoid(AppLovinMAXCreateMRecFingerprint)

        // 3) Readiness checks resolve Promise with false.
        stubReadiness(AppLovinMAXIsInterstitialReadyFingerprint)
        stubReadiness(AppLovinMAXIsRewardedAdReadyFingerprint)
        runCatching {
            stubReadiness(
                Fingerprint(
                    definingClass = "Lcom/applovin/reactnative/AppLovinMAXModule;",
                    name = "isAppOpenAdReady",
                    returnType = "V",
                    parameters = listOf("Ljava/lang/String;", "Lcom/facebook/react/bridge/Promise;")
                )
            )
        }

        // 4) Direct SDK initialization safety net (JS may bypass bridge).
        runCatching {
            Fingerprint(
                definingClass = "Lcom/applovin/sdk/AppLovinSdk;",
                name = "initializeSdk",
                returnType = "V"
            ).method.addInstructions(0, "return-void")
        }
    }
}
