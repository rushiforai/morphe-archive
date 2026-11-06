// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/ozon/lottery/Fingerprints.kt.
package app.ru_apps.ozon_jl4ctuk.lottery

import app.morphe.patcher.Fingerprint

/** Matches `LotteryOnboardingManager.startOnboarding()`, which opens `MorkovskHintDialog`. */
object LotteryStartOnboardingFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/app/android/regulardraw/onboarding/lottery/LotteryOnboardingManager;",
    name = "startOnboarding",
    returnType = "V",
    parameters = listOf(
        "Lru/ozon/app/android/regulardraw/onboarding/LotteryOnboardingModel;",
        "Z",
        "Lkotlin/jvm/functions/Function1;",
    ),
)

/**
 * Matches the Dagger provider that selects between the real in-app push SDK host
 * and Ozon's built-in disabled host using `InAppPushSdkEnabledFlag`.
 */
object InAppPushHostProviderFingerprint : Fingerprint(
    definingClass = "Lru/ozon/app/android/inapppush/di/InAppPushModule;",
    name = "provideInAppPushHost",
    returnType = "Lru/ozon/app/android/inapppush/InAppPushHost;",
)
