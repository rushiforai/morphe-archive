package app.template.patches.ozon.lottery

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

/** Matches the second onboarding path that also opens `MorkovskHintDialog`. */
object MorkovskStartOnboardingFingerprint : Fingerprint(
    definingClass =
        "Lru/ozon/app/android/regulardraw/onboarding/MorkovskOnboardingManager;",
    name = "startOnboarding",
    returnType = "V",
    parameters = listOf(
        "Lru/ozon/app/android/regulardraw/onboarding/dialog/tutorial/data/TutorialSteps;",
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
