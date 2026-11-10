package app.sledgesune.patches.syncme.promotions

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string

internal const val REGISTRATION_ACTIVITY =
    "Lcom/syncme/activities/registration/registration_activity/RegistrationActivity;"

/**
 * RegistrationActivity.showOnboardingPaywall() (obfuscated, e.g. `Z1()V` in 4.71.2.1).
 * Opens the "Go Pro" BillingActivity or the trial screen at the end of onboarding.
 */
object ShowOnboardingPaywallFingerprint : Fingerprint(
    definingClass = REGISTRATION_ACTIVITY,
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        string("the trial screen"),
    )
)

/**
 * RegistrationActivity.completeOnboarding() (obfuscated, e.g. `Y1()V` in 4.71.2.1).
 * Logs onboarding_complete and opens MainActivity. This is what runs when the paywall is disabled.
 */
object CompleteOnboardingFingerprint : Fingerprint(
    definingClass = REGISTRATION_ACTIVITY,
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/syncme/utils/analytics/EventToProvider;",
            name = "onboarding_complete",
        ),
        methodCall(name = "startActivity"),
    )
)

// These classes keep their real names in the release build, so they can be matched directly.

/** Sale / campaign headers ("50% off Premium", special-offer pushes). */
object GetActivePromotionFingerprint : Fingerprint(
    definingClass = "Lcom/syncme/billing/promotional_header/PromotionalHeaderManager;",
    name = "getActivePromotion",
    returnType = "Lcom/syncme/billing/promotional_header/CampaignConfig;",
)

/** Premium bottom sheet shown when closing the after-SMS screen. */
object ShouldShowAfterSmsPromoFingerprint : Fingerprint(
    definingClass = "Lcom/syncme/caller_id/sms/after_sms/domain/AfterSmsPromoPolicy;",
    name = "shouldShowPromoOnClose",
    returnType = "Z",
    parameters = listOf("Z"),
)

/** Background worker that posts Premium promo notifications (backup, full report, trial ended). */
object PromoNotificationWorkerFingerprint : Fingerprint(
    definingClass = "Lcom/syncme/job_task/PromoNotificationWorker;",
    name = "execute",
    returnType = "Landroidx/work/ListenableWorker\$Result;",
    parameters = listOf(),
)

/** Picks the banner shown at the top of the call history. */
object GetNextPromoBannerFingerprint : Fingerprint(
    definingClass = "Lcom/syncme/activities/main_activity/fragment_history/promo_banner/PromoBannerUtil;",
    name = "getNextPromoBanner",
)

/** "Get the Sync.AI app" banners in the drawer, lists and after calls. */
object PrepareAppPromotionIntentFingerprint : Fingerprint(
    definingClass = "Lcom/syncme/ads/app_promotion/AppPromotionManager\$Companion;",
    name = "prepareIntentForAppBannerAd",
    returnType = "Landroid/content/Intent;",
)

/** "Free gift" card on the after-call screen. */
object FreeGiftIsToShowFingerprint : Fingerprint(
    definingClass = "Lcom/syncme/caller_id/FreeGiftChecker;",
    name = "isToShow",
    returnType = "Z",
    parameters = listOf(),
)
